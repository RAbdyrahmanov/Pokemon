import 'package:dio/dio.dart';
import 'package:poke_ap/features/home/data/model/pokemons_response.dart';
import 'package:poke_ap/features/home/domain/repository/pokemon_repository.dart';

class PokemonsrepositoryImpl implements PokemonRepository {
  PokemonsrepositoryImpl({required Dio dio})
      : _dio = dio,
        super();
  final Dio _dio;
  @override
  Future<PokemonsRespons> fetchPokemons() async {
    final response = await _dio.get('pokemon');
    return PokemonsRespons.fromJson(response.data);
  }
}
