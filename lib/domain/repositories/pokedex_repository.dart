import 'package:pokedex/domain/entities/pokemon_entity.dart';

abstract class PokedexRepository {
  const PokedexRepository();

  Future<List<PokemonEntity>> getPokemonList(int offset, int limit);
  Future<PokemonEntity> getPokemonDetail(String pokemonId);
}