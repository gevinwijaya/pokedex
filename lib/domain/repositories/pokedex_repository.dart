import 'package:pokedex/domain/entities/pokedex_entity.dart';
import 'package:pokedex/domain/entities/pokemon_entity.dart';

abstract class PokedexRepository {
  const PokedexRepository();

  Future<PokedexEntity> getPokemonList(int offset, int limit);
  Future<PokemonEntity> getPokemonDetail(String pokemonId);
}