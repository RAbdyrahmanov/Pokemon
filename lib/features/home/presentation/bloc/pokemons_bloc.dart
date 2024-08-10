import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_ap/core/enum/state_status.dart';
import 'package:poke_ap/features/home/domain/entity/pokemons_entity.dart';
import 'package:poke_ap/features/home/domain/usecase/fetch_all_pokemons_usecase.dart';
import 'package:poke_ap/features/home/presentation/bloc/pokemons_event.dart';
import 'package:poke_ap/features/home/presentation/bloc/pokemons_state.dart';

class PokemonsBloc extends Bloc<PokemonsEvent, PokemonsState<PokemonsEntity>> {
  final FetchAllPokemonsUsecase _fetchAllPokemonsUsecase;
  PokemonsBloc({required FetchAllPokemonsUsecase fetchAllPokemonsUsecase})
      : _fetchAllPokemonsUsecase = fetchAllPokemonsUsecase,
        super(
          PokemonsState(
            data: PokemonsEntity.emty(),
            status: StateStatus.init,
            responseMessage: '',
          ),
        ) {
    on<FetchPokemonsEvent>((event, emit) async {
      emit(PokemonsState(
        status: StateStatus.loading,
        responseMessage: '',
        data: PokemonsEntity.emty(),
      ));
      try {
        final result = await _fetchAllPokemonsUsecase.execute();
        emit(
          PokemonsState(
              data: result, status: StateStatus.success, responseMessage: ''),
        );
      } catch (e) {
        PokemonsState(
          status: StateStatus.error,
          data: PokemonsEntity.emty(),
          responseMessage: e.toString(),
        );
      }
    });
  }
}
