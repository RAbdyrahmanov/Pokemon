class PokemonsRespons {
  int? count;
  String? next;
  String? previous;
  List<PokemonsResponseResults>? results;

  PokemonsRespons({this.count, this.next, this.previous, this.results});

  PokemonsRespons.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <PokemonsResponseResults>[];
      json['results'].forEach((v) {
        results!.add(PokemonsResponseResults.fromJson(v));
      });
    }
  }
}

class PokemonsResponseResults {
  String? name;
  String? url;

  PokemonsResponseResults({this.name, this.url});

  PokemonsResponseResults.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }
}
