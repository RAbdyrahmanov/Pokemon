import 'package:poke_ap/features/home/data/model/pokemons_response.dart';
import 'package:poke_ap/features/home/domain/entity/pokemons_entity.dart';

class PokemonsMapper {
  PokemonsEntity map(PokemonsRespons respons) {
    return PokemonsEntity(
      count: respons.count,
      next: respons.next,
      previous: respons.previous,
      results: respons.results?.map((e) => _mapResult(e)).toList(),
    );
  }

  PokemonsEntityResults _mapResult(PokemonsResponseResults response) {
    return PokemonsEntityResults(
      name: response.name,
      url: response.url,
    );
  }
}
