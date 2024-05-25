import 'package:pokedex/domain/entities/pokemon_entity.dart';

class PokedexEntity {
  int count;
  List<PokemonEntity> results;
  PokedexEntity({
    required this.count,
    required this.results,
  });
}
