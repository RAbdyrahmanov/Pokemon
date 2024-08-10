import 'package:dio/dio.dart';
import 'package:poke_ap/features/pokemon_datails/data/model/pokemon_detail_model.dart';
import 'package:poke_ap/features/pokemon_datails/domain/repository/pokemon_details_repository.dart';

class PokemonDetailsRepositoryImpl implements PokemonDetailsRepository {
  PokemonDetailsRepositoryImpl({required Dio dio}) : _dio = dio;
  final Dio _dio;
  @override
  Future<PokemonDetailsModel> fetchPokemonDetails({
    required int index,
  }) async {
    final response = await _dio.get('pokemon/$index');
    return PokemonDetailsModel.fromJson(response.data);
  }
}
