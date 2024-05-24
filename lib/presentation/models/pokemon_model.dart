import 'package:pokedex/presentation/models/about_model.dart';
import 'package:pokedex/presentation/models/base_stats_model.dart';

class PokemonModel {
  String id;
  String name;
  String color;
  List<String> types;
  String imageUrl;
  About about;
  BaseStats baseStats;
  List<String> moves;

  PokemonModel({
    required this.id,
    required this.name,
    required this.color,
    required this.types,
    required this.imageUrl,
    required this.about,
    required this.baseStats,
    required this.moves,
  });
}
