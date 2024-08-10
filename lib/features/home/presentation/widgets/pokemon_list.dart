import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_ap/core/enum/state_status.dart';
import 'package:poke_ap/core/service/app_router.dart';
import 'package:poke_ap/features/home/domain/entity/pokemons_entity.dart';
import 'package:poke_ap/features/home/presentation/bloc/pokemons_bloc.dart';
import 'package:poke_ap/features/home/presentation/bloc/pokemons_state.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({super.key});

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonsBloc, PokemonsState<PokemonsEntity>>(
        builder: (context, state) {
      if (state.status == StateStatus.success) {
        return CustomScrollView(
          slivers: <Widget>[
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 1.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      context.router.push(
                        PokemonDetailsRoute(
                          index: index + 1,
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: colors[index],
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        (state.data.results?[index].name ?? '').toUpperCase(),
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                    ),
                  );
                },
                childCount: state.data.results?.length ?? 0,
              ),
            ),
          ],
        );
      } else if (state.status == StateStatus.loading) {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.orange,
          ),
        );
      } else {
        return const SizedBox.shrink();
      }
    });
  }

  final List<Color> colors = [
    Colors.red.shade300,
    Colors.blue.shade300,
    Colors.green.shade300,
    Colors.yellow.shade300,
    Colors.orange.shade300,
    Colors.purple.shade300,
    Colors.teal.shade300,
    Colors.pink.shade300,
    Colors.cyan.shade300,
    Colors.indigo.shade300,
    Colors.amber.shade300,
    Colors.deepPurple.shade300,
    Colors.lime.shade300,
    Colors.brown.shade300,
    Colors.lightBlue.shade300,
    Colors.deepOrange.shade300,
    Colors.lightGreen.shade300,
    Colors.grey.shade300,
    Colors.blueGrey.shade300,
    Colors.red.shade300,
  ];
}
