import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_ap/core/service/app_router.dart';
import 'package:poke_ap/core/service/dio.dart';
import 'package:poke_ap/features/home/data/mapper/pokemons_mapper.dart';
import 'package:poke_ap/features/home/data/repository/pokemons_repository_impl.dart';
import 'package:poke_ap/features/home/domain/usecase/fetch_all_pokemons_usecase.dart';
import 'package:poke_ap/features/home/presentation/bloc/pokemons_bloc.dart';
import 'package:poke_ap/features/pokemon_datails/data/mapper/pokemon_details_mapper.dart';
import 'package:poke_ap/features/pokemon_datails/data/repository/pokemon_details_repository_impl.dart';
import 'package:poke_ap/features/pokemon_datails/domain/usecase/fetch_pokemon_details_usecase.dart';
import 'package:poke_ap/features/pokemon_datails/presentation/bloc/pokemon_detail_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PokemonsBloc(
            fetchAllPokemonsUsecase: FetchAllPokemonsUsecase(
              mapper: PokemonsMapper(),
              repository: PokemonsrepositoryImpl(dio: DioSetting().dio),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => PokemonDetailBloc(
            fetchPokemonDetailsUsecase: FetchPokemonDetailsUsecase(
              mapper: PokemonDetailsMapper(),
              repository: PokemonDetailsRepositoryImpl(dio: DioSetting().dio),
            ),
          ),
        ),
      ],
      child: MaterialApp.router(
        theme: ThemeData(
          fontFamily: 'ClashDisplay',
          textTheme: Theme.of(context).textTheme.apply(fontFamily: 'ClashDisplay'),
        ),
        routerConfig: appRouter.config(),
      ),
    );
  }

}
