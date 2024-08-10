import 'package:poke_ap/core/enum/state_status.dart';

class PokemonDetailState<T>{
  final String responseMessage;
  final StateStatus status;
  final T data;

  PokemonDetailState({required this.responseMessage, required this.status, required this.data});
}