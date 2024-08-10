import 'package:poke_ap/features/home/data/model/pokemons_response.dart';

abstract class PokemonRepository {
  Future<PokemonsRespons> fetchPokemons();
}
