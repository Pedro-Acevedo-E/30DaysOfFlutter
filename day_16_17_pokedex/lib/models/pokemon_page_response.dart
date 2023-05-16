import 'dart:ui';
import 'package:flutter/material.dart';

class PokemonListing {
  final int id;
  final String name;
  late final String type;

  String get imageUrl =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';

  Color get typeColor {
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

  PokemonListing({required this.id, required this.name});

  factory PokemonListing.fromJson(Map<String, dynamic> json) {
    final name = json['name'];
    final url = json['url'] as String;
    final id = int.parse(url.split('/')[6]);

    return PokemonListing(id: id, name: name);
  }
}

class PokemonPageResponse {
  List<PokemonListing> pokemonListings;
  final int count;
  final String? next;
  final String? previous;

  PokemonPageResponse({required this.pokemonListings, required this.count, required this.next, required this.previous});

  factory PokemonPageResponse.fromJson(Map<String, dynamic> json) {
    final next = json['next'];
    final count = json['count'];
    final previous = json['previous'];
    final pokemonListings = (json['results'] as List)
        .map((listingJson) => PokemonListing.fromJson(listingJson))
        .toList();

    return PokemonPageResponse(pokemonListings: pokemonListings, next: next, previous: previous, count: count);
  }
}