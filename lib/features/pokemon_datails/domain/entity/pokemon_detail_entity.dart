class PokemonDetailsEntity {
  List<AbilitiesEntity>? abilities;
  int? baseExperience;
  CriesEntity? cries;
  int? height;
  int? id;
  bool? isDefault;
  String? locationAreaEncounters;
  String? name;
  int? order;
  SpritesEntity? sprites;
  int? weight;

  PokemonDetailsEntity.empty()
      : abilities = [],
        baseExperience = 0,
        cries = CriesEntity.emty(),
        height = 0,
        id = 0,
        isDefault = false,
        locationAreaEncounters = '',
        name = '',
        order = 0,
        sprites = SpritesEntity.emty(),
        weight = 0;
  PokemonDetailsEntity(
      {this.abilities,
      this.baseExperience,
      this.cries,
      this.height,
      this.id,
      this.isDefault,
      this.locationAreaEncounters,
      this.name,
      this.order,
      this.sprites,
      this.weight});
}

class AbilitiesEntity {
  AbilitiEntity? ability;
  bool? isHidden;
  int? slot;

  AbilitiesEntity({this.ability, this.isHidden, this.slot, String? name, String? url});
}

class AbilitiEntity {
  String? name;
  String? url;

  AbilitiEntity({this.name, this.url});
}

class CriesEntity {
  String? latest;
  String? legacy;
  CriesEntity.emty()
      : latest = '',
        legacy = '';

  CriesEntity({this.latest, this.legacy});
}

class GameIndices {
  int? gameIndex;
  AbilitiEntity? version;

  GameIndices({this.gameIndex, this.version});
}

class VersionGroupDetails {
  int? levelLearnedAt;
  AbilitiEntity? moveLearnMethod;
  AbilitiEntity? versionGroup;

  VersionGroupDetails(
      {this.levelLearnedAt, this.moveLearnMethod, this.versionGroup});
}

class SpritesEntity {
  String? backDefault;
  String? backFemale;
  String? backShiny;
  String? backShinyFemale;
  String? frontDefault;
  String? frontFemale;
  String? frontShiny;
  String? frontShinyFemale;

  SpritesEntity.emty()
      : backDefault = '',
        backFemale = '',
        backShiny = '',
        backShinyFemale = '',
        frontDefault = '',
        frontFemale = '',
        frontShiny = '',
        frontShinyFemale = '';

  SpritesEntity({
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });
}
