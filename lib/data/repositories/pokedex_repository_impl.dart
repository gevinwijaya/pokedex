import 'package:injectable/injectable.dart';
import 'package:pokedex/data/datasources/pokedex_remote_data_source.dart';
import 'package:pokedex/data/mappers/pokedex_remote_mapper.dart';
import 'package:pokedex/domain/entities/pokemon_entity.dart';
import 'package:pokedex/domain/repositories/pokedex_repository.dart';

@Singleton(as: PokedexRepository)
class PokedexRepositoryImpl extends PokedexRepository {
  final PokedexRemoteDataSource _pokedexRemoteDataSource;

  PokedexRepositoryImpl(
      {required PokedexRemoteDataSource pokedexRemoteDataSource})
      : _pokedexRemoteDataSource = pokedexRemoteDataSource;

  @override
  Future<PokemonEntity> getPokemonDetail(String pokemonId) async {
    final result = await _pokedexRemoteDataSource.getPokemonDetail(pokemonId);
    return result.toEntity();
  }

  @override
  Future<List<PokemonEntity>> getPokemonList(int offset, int limit) async {
    Map<String, String> queryParameters = {
      "offset": offset.toString(),
      "limit": limit.toString()
    };
    final result =
        await _pokedexRemoteDataSource.getPokemonList(queryParameters);
    
    List<PokemonEntity> pokemonList = List.empty();
    for (var result in result.results) {
      pokemonList.add(await getPokemonDetailThroughUrl(result.url));
    }
    return pokemonList;
  }

    Future<PokemonEntity> getPokemonDetailThroughUrl(String url) async {
    final result =
        await _pokedexRemoteDataSource.getPokemonDetailThroughUrl(url);
    return result.toEntity();
  }
}
