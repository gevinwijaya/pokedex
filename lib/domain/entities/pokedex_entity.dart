import 'package:pokedex/domain/entities/pokemon_properties_entity.dart';

class PokedexEntity {
  int count;
  List<PokemonPropertiesEntity> results;
  PokedexEntity({
    required this.count,
    required this.results,
  });
}
