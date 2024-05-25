import 'package:flutter/material.dart';
import 'package:pokedex/domain/entities/pokemon_entity.dart';
import 'package:pokedex/presentation/models/about_model.dart';
import 'package:pokedex/presentation/models/base_stats_model.dart';
import 'package:pokedex/presentation/models/pokemon_model.dart';
import 'package:pokedex/utils/pokedex_utils.dart';

extension PokemonEntityToModel on PokemonEntity {
  PokemonModel toModel() {
    return PokemonModel(
        id: id?.toFormattedId() ?? "",
        name: name.capitalize(),
        color: color?.toColor() ?? Colors.black54,
        types: types?.map((type) => type.capitalize()).toList() ?? List.empty(),
        imageUrl: imageUrl.toString(),
        about: About(
            species: about?.species.capitalize() ?? "",
            height: about?.height ?? "",
            weight: about?.weight ?? "",
            abilities: about?.abilities ?? ""),
        baseStats: BaseStats(
            hp: baseStats?.hp ?? 0,
            attack: baseStats?.attack ?? 0,
            defense: baseStats?.defense ?? 0,
            spatk: baseStats?.spatk ?? 0,
            spdef: baseStats?.spdef ?? 0),
        moves: moves?.map((move) => move.capitalize()).toList() ?? List.empty());
  }
}

extension StringToColor on String {
  Color toColor() {
    switch (toLowerCase()) {
      case 'black':
        return Colors.black54;
      case 'white':
        return Colors.grey;
      case 'red':
        return const Color(0xfffc2847);
      case 'green':
        return const Color(0xff71bc78);
      case 'blue':
        return const Color(0xff0f4c81);
      case 'yellow':
        return const Color(0xffc49102);
      case 'orange':
        return const Color(0xffffa343);
      case 'pink':
        return const Color(0xfffb7efd);
      case 'purple':
        return const Color(0xff7442c8);
      case 'brown':
        return Colors.brown;
      case 'grey':
      case 'gray':
        return Colors.black38;
      default:
        return Colors.black54;
    }
  }
}
