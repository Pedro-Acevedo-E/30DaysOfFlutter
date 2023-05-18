import 'package:day_16_17_pokedex/modules/pokemon/models/pokemon_ability.dart';
import 'package:day_16_17_pokedex/modules/pokemon/models/pokemon_details.dart';
import 'package:day_16_17_pokedex/modules/pokemon/models/pokemon_stats.dart';
import 'package:day_16_17_pokedex/modules/pokemon/models/pokemon_type.dart';

import 'move_info.dart';

class PokemonInfo {
  final List<PokemonAbility> abilities;
  final int height;
  final int id;
  final List<MoveInfo> moves;
  final String name;
  final List<PokemonStats> stats;
  final List<PokemonType> types;
  String? flavorText;
  String? genera;
  final PokeDetails species;

  String get imageUrl => 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png';

  PokemonInfo({required this.abilities, required this.types, required this.height, required this.id, required this.moves, required this.name, required this.stats, required this.species});

  factory PokemonInfo.fromJson(Map<String, dynamic> json) {
    final abilities = (json['abilities'] as List)
        .map((listingJson) => PokemonAbility.fromJson(listingJson))
        .toList();
    final height = json['height'];
    final id = json['id'];
    final moves = (json['moves'] as List)
        .map((listingJson) => MoveInfo.fromJson(listingJson))
        .toList();
    final name = json['name'];
    final stats = (json['stats'] as List)
        .map((listingJson) => PokemonStats.fromJson(listingJson))
        .toList();
    final types = (json['types'] as List)
        .map((listingJson) => PokemonType.fromJson(listingJson))
        .toList();
    final species = PokeDetails.fromJson(json['species']);

    return PokemonInfo(abilities: abilities, types: types, height: height, id: id, moves: moves, name: name, stats: stats, species: species);
  }

  void setSpeciesInfo(Map<String, dynamic> json) {
    final flavorTextEntries = json['flavor_text_entries'] as List;
    if(flavorTextEntries.isNotEmpty) {
      var flavorText = "";
      for(var i = 0; i < flavorTextEntries.length; i++) {
        final entry = PokeDetails.fromJson(flavorTextEntries[i]['language']);
        if(entry.name == 'en') {
          flavorText = flavorTextEntries[i]['flavor_text'].replaceAll("\n", " ").replaceAll("\f", " ");
        }
      }
      this.flavorText = flavorText.replaceAll("\f", " ");
    } 

    final generaEntries = json['genera'] as List;
    if(generaEntries.isNotEmpty) {
      var genera = "";
      for (var i = 0; i < generaEntries.length; i++) {
        final entry = PokeDetails.fromJson(generaEntries[i]['language']);
        if (entry.name == 'en') {
          genera = generaEntries[i]['genus'];
        }
      }
      this.genera = genera;
    }
  }
}









