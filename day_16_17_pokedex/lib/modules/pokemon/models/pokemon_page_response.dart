import 'dart:ui';
import 'package:flutter/material.dart';

class PokemonListing {
  final int id;
  final String name;

  String get imageUrl =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';

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