import 'package:collection/collection.dart';
import 'package:pokedex/data/network/responses/pokemon_detail_response.dart';
import 'package:pokedex/data/network/responses/pokemon_list_response.dart';
import 'package:pokedex/domain/entities/pokedex_entity.dart';
import 'package:pokedex/domain/entities/pokemon_entity.dart';
import 'package:pokedex/utils/pokedex_utils.dart';

extension PokemonListResponseToEntity on PokemonListResponse {
  PokedexEntity toEntity(List<PokemonEntity> pokemonEntity) {
    return PokedexEntity(
        count: count,
        results: pokemonEntity.map((pokemon) => pokemon).toList());
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

  PokemonEntity toEntityWithColor(String? color) {
    String abilitiesList = "";
    int hp = 0;
    int attack = 0;
    int defense = 0;
    int spatk = 0;
    int spdef = 0;
    abilities
        ?.map((ability) => ability.ability?.name ?? "")
        .toList()
        .forEachIndexed((index, ability) {
      if (index == 0) {
        abilitiesList = ability.capitalize();
      } else {
        abilitiesList = "$abilitiesList, ${ability.capitalize()}";
      }
    });
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
        moves: moves?.map((move) => move.move?.name ?? "").toList() ??
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
        color: color);
  }
}
