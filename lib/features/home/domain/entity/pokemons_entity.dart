class PokemonsEntity {
  int? count;
  String? next;
  String? previous;
  List<PokemonsEntityResults>? results;

  PokemonsEntity({this.count, this.next, this.previous, this.results});

  PokemonsEntity.emty()
      : count = 0,
        next = null,
        previous = null,
        results = [];
}

class PokemonsEntityResults {
  String? name;
  String? url;

  PokemonsEntityResults({this.name, this.url});
}
