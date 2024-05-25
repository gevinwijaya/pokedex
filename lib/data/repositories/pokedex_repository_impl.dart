import 'package:injectable/injectable.dart';
import 'package:pokedex/core/exceptions.dart';
import 'package:pokedex/data/datasources/pokedex_remote_data_source.dart';
import 'package:pokedex/data/mappers/pokedex_remote_mapper.dart';
import 'package:pokedex/data/network/responses/pokemon_detail_response.dart';
import 'package:pokedex/data/network/responses/pokemon_species_response.dart';
import 'package:pokedex/domain/entities/pokedex_entity.dart';
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
  Future<PokedexEntity> getPokemonList(int offset, int limit) async {
    try {
      Map<String, String> queryParameters = {
        "offset": offset.toString(),
        "limit": limit.toString()
      };
      final result =
          await _pokedexRemoteDataSource.getPokemonList(queryParameters);
      List<PokemonEntity> pokemonList = List.empty(growable: true);
      for (var item in result.results) {
        PokemonDetailResponse pokemonDetailResponse =
            await getPokemonDetailThroughUrl(item.url);
        String? color = "";
        if (pokemonDetailResponse.species?.url != null) {
          PokemonSpeciesResponse speciesResponse =
              await getPokemonSpecies(pokemonDetailResponse.species!.url!);
          color = speciesResponse.color?.name ?? "";
        }
        pokemonList.add(pokemonDetailResponse.toEntityWithColor(color));
      }
      return result.toEntity(pokemonList);
    } catch (e) {
      throw ServiceApiFail("$e");
    }
  }

  Future<PokemonDetailResponse> getPokemonDetailThroughUrl(String url) async {
    try {
      final result =
          await _pokedexRemoteDataSource.getPokemonDetailFromUrl(url);
      return result;
    } catch (e) {
      throw ServiceApiFail("$e");
    }
  }

  Future<PokemonSpeciesResponse> getPokemonSpecies(String url) async {
    try {
      final result =
          await _pokedexRemoteDataSource.getPokemonSpeciesFromUrl(url);
      return result;
    } catch (e) {
      throw ServiceApiFail("$e");
    }
  }
}
