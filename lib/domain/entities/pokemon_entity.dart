class PokemonEntity {
  String? id;
  String name;
  List<String>? types;
  String? imageUrl;
  AboutEntity? about;
  BaseStatsEntity? baseStats;
  List<String>? moves;

  PokemonEntity({
    this.id,
    required this.name,
    this.types,
    this.imageUrl,
    this.about,
    this.baseStats,
    this.moves,
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
