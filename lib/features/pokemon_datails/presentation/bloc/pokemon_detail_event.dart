
abstract class PokemonDetailEvent{}
class  FetchPokemonsDetailEvent extends PokemonDetailEvent{
  final int index;

  FetchPokemonsDetailEvent({required this.index});
}