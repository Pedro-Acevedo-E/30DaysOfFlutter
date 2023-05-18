import 'package:day_16_17_pokedex/modules/pokemon/models/pokemon_details.dart';

class PokemonType {
  final int slot;
  final PokeDetails type;

  PokemonType({required this.slot, required this.type});

  factory PokemonType.fromJson(Map<String, dynamic> json) {
    final slotData = json['slot'];
    final typeData = PokeDetails.fromJson(json['type']);


    return PokemonType(slot: slotData, type: typeData);
  }
}