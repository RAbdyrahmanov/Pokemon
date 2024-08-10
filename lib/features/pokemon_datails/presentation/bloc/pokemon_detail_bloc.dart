import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_ap/core/enum/state_status.dart';
import 'package:poke_ap/features/pokemon_datails/domain/entity/pokemon_detail_entity.dart';
import 'package:poke_ap/features/pokemon_datails/domain/usecase/fetch_pokemon_details_usecase.dart';
import 'package:poke_ap/features/pokemon_datails/presentation/bloc/pokemon_detail_event.dart';
import 'package:poke_ap/features/pokemon_datails/presentation/bloc/pokemon_detail_state.dart';

class PokemonDetailBloc
    extends Bloc<PokemonDetailEvent, PokemonDetailState<PokemonDetailsEntity>> {
  final FetchPokemonDetailsUsecase _fetchPokemonDetailsUsecase;

  PokemonDetailBloc(
      {required FetchPokemonDetailsUsecase fetchPokemonDetailsUsecase})
      : _fetchPokemonDetailsUsecase = fetchPokemonDetailsUsecase,
        super(PokemonDetailState(
            responseMessage: '',
            status: StateStatus.init,
            data: PokemonDetailsEntity.empty())) {
    on<FetchPokemonsDetailEvent>((event, emit) async {
      emit(PokemonDetailState(
          responseMessage: '',
          status: StateStatus.loading,
          data: PokemonDetailsEntity.empty()));

      try {
        
        final result = await _fetchPokemonDetailsUsecase.execute(index: event.index, idex: event.index);
        emit(PokemonDetailState(
            responseMessage: '',
            status: StateStatus.success,
            data: result));
      } catch (e) {
        emit(PokemonDetailState(
            responseMessage: e.toString(),
            status: StateStatus.error,
            data: PokemonDetailsEntity.empty()));
      }
    });
  }
}
