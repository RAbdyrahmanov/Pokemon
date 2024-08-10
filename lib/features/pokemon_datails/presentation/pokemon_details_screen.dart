import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_ap/core/enum/state_status.dart';
import 'package:poke_ap/features/pokemon_datails/domain/entity/pokemon_detail_entity.dart';
import 'package:poke_ap/features/pokemon_datails/presentation/bloc/pokemon_detail_bloc.dart';
import 'package:poke_ap/features/pokemon_datails/presentation/bloc/pokemon_detail_event.dart';
import 'package:poke_ap/features/pokemon_datails/presentation/bloc/pokemon_detail_state.dart';

@RoutePage()
class PokemonDetailsScreen extends StatefulWidget {
  const PokemonDetailsScreen({
    super.key,
    required this.index,
  });

  final int index;

  @override
  State<PokemonDetailsScreen> createState() => _PokemonDetailsScreenState();
}

class _PokemonDetailsScreenState extends State<PokemonDetailsScreen> {
  @override
  void initState() {
    context
        .read<PokemonDetailBloc>()
        .add(FetchPokemonsDetailEvent(index: widget.index));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<PokemonDetailBloc,
                PokemonDetailState<PokemonDetailsEntity>>(
            builder: (context, state) {
          if (state.status == StateStatus.success) {
            return Image.network(
              state.data.sprites?.frontDefault ?? '',
              scale: 0.5,
            );
          } else if (state.status == StateStatus.loading) {
            return const CircularProgressIndicator(
              color: Colors.orange,
            );
          } else {
            return const Text('No data');
          }
        }),
      ),
    );
  }
}
