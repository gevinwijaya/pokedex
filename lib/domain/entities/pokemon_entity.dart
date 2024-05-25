class PokemonEntity {
  String? id;
  String name;
  List<String>? types;
  List<String>? moves;
  String? imageUrl;
  AboutEntity? about;
  BaseStatsEntity? baseStats;
  String? color;

  PokemonEntity({
    this.id,
    required this.name,
    this.types,
    this.moves,
    this.imageUrl,
    this.about,
    this.baseStats,
    this.color
  });
}

class BaseStatsEntity {
  int hp;
  int attack;
  int defense;
  int spatk;
  int spdef;
  BaseStatsEntity(
      {required this.hp,
      required this.attack,
      required this.defense,
      required this.spatk,
      required this.spdef});
}

class AboutEntity {
  String species;
  String height;
  String weight;
  String abilities;
  AboutEntity(
      {required this.species,
      required this.height,
      required this.weight,
      required this.abilities});
}
