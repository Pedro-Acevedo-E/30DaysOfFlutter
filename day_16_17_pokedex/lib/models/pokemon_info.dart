import 'dart:ui';
import 'package:flutter/material.dart';

class PokemonInfo {
  final List<PokemonAbility> abilities;
  final int height;
  final int id;
  final List<MoveInfo> moves;
  final String name;
  final List<PokemonStats> stats;
  final List<PokemonType> types;
  late final String flavorText;
  late final String genera;

  Color getColor(String type) {
      switch (type) {
        case "grass":
          {
            return Colors.green;
          }
        case "fire":
          {
            return Colors.red;
          }
        case "water":
          {
            return Colors.blue;
          }
        case "bug":
          {
            return const Color.fromRGBO(167,183,35, 1);
          }
        case "normal":
          {
            return const Color.fromRGBO(176, 172, 136, 1);
          }
        case "poison":
          {
            return const Color.fromRGBO(164, 62, 158, 1);
          }
        case "fighting":
          {
            return const Color.fromRGBO(193, 34, 57, 1);
          }
        case "flying":
          {
            return const Color.fromRGBO(168, 145, 236, 1);
          }
        case "ground":
          {
            return const Color.fromRGBO(222, 193, 107, 1);
          }
        case "rock":
          {
            return const Color.fromRGBO(182, 158, 49, 1);
          }
        case "ghost":
          {
            return const Color.fromRGBO(112,85,155, 1);
          }
        case "steel":
          {
            return const Color.fromRGBO(183,185,208, 1);
          }
        case "electric":
          {
            return const Color.fromRGBO(249,207,48, 1);
          }
        case "psychic":
          {
            return const Color.fromRGBO(251,85,132, 1);
          }
        case "ice":
          {
            return const Color.fromRGBO(154,214,223, 1);
          }
        case "dragon":
          {
            return const Color.fromRGBO(112,55,255, 1);
          }
        case "dark":
          {
            return const Color.fromRGBO(117,87,76, 1);
          }
        case "fairy":
          {
            return const Color.fromRGBO(230,158,172, 1);
          }
        default:
          {
            return Colors.grey;
          }
      }
  }
  Color get typeColor {
    switch (types[0].type.name) {
      case "grass":
        {
          return Colors.green;
        }
      case "fire":
        {
          return Colors.red;
        }
      case "water":
        {
          return Colors.blue;
        }
      case "bug":
        {
          return const Color.fromRGBO(167,183,35, 1);
        }
      case "normal":
        {
          return const Color.fromRGBO(176, 172, 136, 1);
        }
      case "poison":
        {
          return const Color.fromRGBO(164, 62, 158, 1);
        }
      case "fighting":
        {
          return const Color.fromRGBO(193, 34, 57, 1);
        }
      case "flying":
        {
          return const Color.fromRGBO(168, 145, 236, 1);
        }
      case "ground":
        {
          return const Color.fromRGBO(222, 193, 107, 1);
        }
      case "rock":
        {
          return const Color.fromRGBO(182, 158, 49, 1);
        }
      case "ghost":
        {
          return const Color.fromRGBO(112,85,155, 1);
        }
      case "steel":
        {
          return const Color.fromRGBO(183,185,208, 1);
        }
      case "electric":
        {
          return const Color.fromRGBO(249,207,48, 1);
        }
      case "psychic":
        {
          return const Color.fromRGBO(251,85,132, 1);
        }
      case "ice":
        {
          return const Color.fromRGBO(154,214,223, 1);
        }
      case "dragon":
        {
          return const Color.fromRGBO(112,55,255, 1);
        }
      case "dark":
        {
          return const Color.fromRGBO(117,87,76, 1);
        }
      case "fairy":
        {
          return const Color.fromRGBO(230,158,172, 1);
        }
      default:
        {
          return Colors.grey;
        }
    }
  }

  String get imageUrl => 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png';

  PokemonInfo({required this.abilities, required this.types, required this.height, required this.id, required this.moves, required this.name, required this.stats, });

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

    return PokemonInfo(abilities: abilities, types: types, height: height, id: id, moves: moves, name: name, stats: stats);
  }

  void setSpeciesInfo(Map<String, dynamic> json) {
    final flavorTextEntries = json['flavor_text_entries'] as List;
    final flavorText = flavorTextEntries[0]['flavor_text'];
    this.flavorText = flavorText;

    final generaEntries = json['genera'] as List;
    var genera = "";
    for(var i = 0; i < generaEntries.length; i++){
      final entry = PokeDetails.fromJson(generaEntries[i]['language']);
      if (entry.name == 'en'){
        genera = generaEntries[i]['genus'];
      }
    }
    this.genera = genera;
  }
}

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

class PokeDetails {
  final String name;
  final String url;

  PokeDetails({required this.name, required this.url});

  factory PokeDetails.fromJson(Map<String, dynamic> json) {
    final nameData = json['name'];
    final urlData = json['url'];


    return PokeDetails(name: nameData, url: urlData);
  }
}

class MoveInfo {
  final PokeDetails move;
  final List<VersionDetail> versionGroupDetails;

  MoveInfo({required this.move, required this.versionGroupDetails});

  factory MoveInfo.fromJson(Map<String, dynamic> json) {
    final move = PokeDetails.fromJson(json['move']);
    final versionGroupDetails = (json['version_group_details'] as List)
        .map((listingJson) => VersionDetail.fromJson(listingJson))
        .toList();

    return MoveInfo(move: move, versionGroupDetails: versionGroupDetails);
  }
}

class VersionDetail {
  final int levelLearnedAt;
  final PokeDetails moveLearnMethod;
  final PokeDetails versionGroup;

  VersionDetail({required this.levelLearnedAt, required this.moveLearnMethod, required this.versionGroup});

  factory VersionDetail.fromJson(Map<String, dynamic> json) {
    final levelLearnedAt = json['level_learned_at'];
    final moveLearnMethod = PokeDetails.fromJson(json['move_learn_method']);
    final versionGroup = PokeDetails.fromJson(json['version_group']);

    return VersionDetail(levelLearnedAt: levelLearnedAt, moveLearnMethod: moveLearnMethod, versionGroup: versionGroup);
  }
}

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