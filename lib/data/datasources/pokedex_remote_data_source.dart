import 'package:injectable/injectable.dart';
import 'package:pokedex/data/network/responses/pokemon_detail_response.dart';
import 'package:pokedex/data/network/responses/pokemon_list_response.dart';
import 'package:pokedex/data/network/services/pokedex_service.dart';

@singleton
class PokedexRemoteDataSource {
  final PokedexService _pokedexService;

  PokedexRemoteDataSource({required PokedexService pokedexService})
      : _pokedexService = pokedexService;

  Future<PokemonListResponse> getPokemonList(
      Map<String, String> queryParameters) async {
    var response = await _pokedexService.getPokemonList(queryParameters);

    return PokemonListResponse.fromJson(response.data);
  }

  Future<PokemonDetailResponse> getPokemonDetail(String pokemonId) async {
    var response = await _pokedexService.getPokemonDetail(pokemonId);

    return PokemonDetailResponse.fromJson(response.data);
  }

  Future<PokemonDetailResponse> getPokemonDetailThroughUrl(String url) async {
    var response = await _pokedexService.getPokemonDetail(url);

    return PokemonDetailResponse.fromJson(response.data);
  }
}
