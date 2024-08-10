import 'package:poke_ap/features/home/data/mapper/pokemons_mapper.dart';
import 'package:poke_ap/features/home/domain/entity/pokemons_entity.dart';
import 'package:poke_ap/features/home/domain/repository/pokemon_repository.dart';

class FetchAllPokemonsUsecase {
  FetchAllPokemonsUsecase({
    required PokemonRepository repository,
    required PokemonsMapper mapper,
  })  : _repository = repository,
        _mapper = mapper;
  final PokemonRepository _repository;
  final PokemonsMapper _mapper;

  Future<PokemonsEntity> execute() {
    return _repository.fetchPokemons().then(
          (value) => _mapper.map(value),
        );
  }
}
