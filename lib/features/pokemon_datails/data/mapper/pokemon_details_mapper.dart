import 'package:poke_ap/features/pokemon_datails/data/model/pokemon_detail_model.dart';
import 'package:poke_ap/features/pokemon_datails/domain/entity/pokemon_detail_entity.dart';

class PokemonDetailsMapper {
  PokemonDetailsEntity map(PokemonDetailsModel response) {
    return PokemonDetailsEntity(
      sprites: _mapSprites(response.sprites ?? SpritesModel.empty()),
      name: response.name,
      height: response.height,
      weight: response.weight,
      id: response.id,
      order: response.order,
      locationAreaEncounters: response.locationAreaEncounters,
      isDefault: response.isDefault,
      baseExperience: response.baseExperience,
      cries: _mapCries(response.cries ?? CriesModel.empty()),
      abilities: response.abilities?.map((e) => _mapAbilities(e)).toList(),
    );
  }

  SpritesEntity _mapSprites(SpritesModel response) {
    return SpritesEntity(
      frontDefault: response.frontDefault,
      frontFemale: response.frontFemale,
      frontShiny: response.frontShiny,
      frontShinyFemale: response.frontShinyFemale,
      backDefault: response.backDefault,
      backFemale: response.backFemale,
      backShiny: response.backShiny,
      backShinyFemale: response.backShinyFemale,
    );
  }

  CriesEntity _mapCries(CriesModel response) {
    return CriesEntity(
      latest: response.latest,
      legacy: response.legacy,
    );
  }

  AbilitiesEntity _mapAbilities(AbilitiesModel response) {
    return AbilitiesEntity(
      ability: _mapAbility(response.ability ?? AbilityModel.empty()),
    );
  }

  AbilitiEntity _mapAbility(AbilityModel response) {
    return AbilitiEntity(
      name: response.name,
      url: response.url,
    );
  }
}
