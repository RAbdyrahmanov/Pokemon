import 'package:poke_ap/features/pokemon_datails/data/model/pokemon_detail_model.dart';

abstract class PokemonDetailsRepository{
  Future<PokemonDetailsModel> fetchPokemonDetails({required int index});
}