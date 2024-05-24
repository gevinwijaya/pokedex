import 'package:pokedex/domain/entities/pokemon_entity.dart';

class PokemonPropertiesEntity {
  PokemonEntity pokemonEntity;
  String url;
  PokemonPropertiesEntity({
    required this.pokemonEntity,
    required this.url,
  });
}
