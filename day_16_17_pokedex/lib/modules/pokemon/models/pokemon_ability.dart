import 'package:day_16_17_pokedex/modules/pokemon/models/pokemon_details.dart';

class PokemonAbility {
  final int slot;
  final PokeDetails ability;

  PokemonAbility({required this.slot, required this.ability});

  factory PokemonAbility.fromJson(Map<String, dynamic> json) {
    final slotData = json['slot'];
    final abilityData = PokeDetails.fromJson(json['ability']);


    return PokemonAbility(slot: slotData, ability: abilityData);
  }
}