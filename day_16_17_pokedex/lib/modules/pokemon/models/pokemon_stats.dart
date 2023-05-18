import 'package:day_16_17_pokedex/modules/pokemon/models/pokemon_details.dart';

class PokemonStats {
  final int baseStat;
  final PokeDetails stat;

  PokemonStats({required this.baseStat, required this.stat});

  factory PokemonStats.fromJson(Map<String, dynamic> json) {
    final baseStat = json['base_stat'];
    final stat = PokeDetails.fromJson(json['stat']);

    return PokemonStats(baseStat: baseStat, stat: stat);
  }
}