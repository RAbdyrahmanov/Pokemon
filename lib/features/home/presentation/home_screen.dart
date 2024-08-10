import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_ap/core/service/app_assets.dart';
import 'package:poke_ap/features/home/presentation/bloc/pokemons_bloc.dart';
import 'package:poke_ap/features/home/presentation/bloc/pokemons_event.dart';
import 'package:poke_ap/features/home/presentation/widgets/pokemon_list.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<PokemonsBloc>().add(FetchPokemonsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Select Your',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      'Pokemon',
                      style: TextStyle(
                        fontSize: 46,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Image.asset(
                      AppAssets.pokeball2,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                const Expanded(child: PokemonList()),
              ],
            ),
          ),
        ));
  }
}
