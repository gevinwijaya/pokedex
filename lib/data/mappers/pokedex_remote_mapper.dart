import 'package:pokedex/data/network/responses/pokemon_detail_response.dart';
import 'package:pokedex/data/network/responses/pokemon_list_response.dart';
import 'package:pokedex/domain/entities/pokedex_entity.dart';
import 'package:pokedex/domain/entities/pokemon_entity.dart';
import 'package:pokedex/domain/entities/pokemon_properties_entity.dart';

extension PokemonListResponseToEntity on PokemonListResponse {
  PokedexEntity toEntity() {
    return PokedexEntity(
        count: count,
        results: results
            .map((result) => PokemonPropertiesEntity(
                url: result.url,
                pokemonEntity: PokemonEntity(name: result.name)))
            .toList());
  }
}

extension PokemonDetailResponseToEntity on PokemonDetailResponse {
  PokemonEntity toEntity() {
    String abilitiesList = "";
    int hp = 0;
    int attack = 0;
    int defense = 0;
    int spatk = 0;
    int spdef = 0;
    abilities
        ?.map((ability) => ability.ability?.name ?? "")
        .toList()
        .forEach((ability) => abilitiesList = "$abilitiesList,$ability");
    stats?.forEach((stat) => switch (stat.stat?.name.toString()) {
          "hp" => hp = stat.baseStat ?? 0,
          "attack" => attack = stat.baseStat ?? 0,
          "defense" => defense = stat.baseStat ?? 0,
          "special-attack" => spatk = stat.baseStat ?? 0,
          "special-defense" => spdef = stat.baseStat ?? 0,
          _ => {}
        });
    return PokemonEntity(
        id: id.toString(),
        name: name.toString(),
        types: types?.map((type) => type.type?.name ?? "").toList() ??
            List.empty(),
        imageUrl: sprites?.other?.dreamWorld?.frontDefault ??
            sprites?.frontDefault.toString(),
        about: AboutEntity(
            abilities: abilitiesList,
            species: species?.name ?? "",
            height: height.toString(),
            weight: weight.toString()),
        baseStats: BaseStatsEntity(
            hp: hp,
            attack: attack,
            defense: defense,
            spatk: spatk,
            spdef: spdef),
        moves: moves?.map((move) => move.move?.name ?? "").toList());
  }
}
