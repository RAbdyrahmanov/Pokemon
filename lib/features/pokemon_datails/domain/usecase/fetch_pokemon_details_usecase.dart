import 'package:poke_ap/features/pokemon_datails/data/mapper/pokemon_details_mapper.dart';
import 'package:poke_ap/features/pokemon_datails/domain/entity/pokemon_detail_entity.dart';
import 'package:poke_ap/features/pokemon_datails/domain/repository/pokemon_details_repository.dart';

class FetchPokemonDetailsUsecase {
  FetchPokemonDetailsUsecase({
    required PokemonDetailsRepository repository,
    required PokemonDetailsMapper mapper,
  })  : _repository = repository,
        _mapper = mapper;
  final PokemonDetailsRepository _repository;
  final PokemonDetailsMapper _mapper;

  Future<PokemonDetailsEntity> execute({required int index, required int idex}) {
    return _repository
        .fetchPokemonDetails(index: index)
        .then((value) => _mapper.map(value));
  }
}
