import 'package:poke_ap/core/enum/state_status.dart';

class PokemonsState<T> {
  final String responseMessage;
  final StateStatus status;
  final T data;

  PokemonsState({
    required this.responseMessage,
    required this.status,
    required this.data,
  });
}
