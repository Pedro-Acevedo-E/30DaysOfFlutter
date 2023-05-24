import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/pokemon_info.dart';
import '../models/pokemon_page_response.dart';
import 'package:hive/hive.dart';

class PokemonRepository {
  final baseUrl = 'pokeapi.co';
  final client = http.Client();

  Future<PokemonPageResponse> getPokemonPage(String page) async {
    print("Making request for: $page");
    final response = await client.get(Uri.parse(page));
    final json = jsonDecode(response.body);
    final data = PokemonPageResponse.fromJson(json);
    return data;
  }

  Future<PokemonInfo> getPokemonDetails(int id) async {
    print("Getting pokemon details of $id");
    final detailsData = await client.get(Uri.parse("https://pokeapi.co/api/v2/pokemon/$id/"));
    final json = jsonDecode(detailsData.body);
    final data = PokemonInfo.fromJson(json);

    return data;
  }

  Future<Map<String, dynamic>> getSpeciesInfo(String request) async {
    final detailsData = await client.get(Uri.parse(request));
    final json = jsonDecode(detailsData.body);

    return json;
  }

  void addPokemonToFavorites(PokemonInfo pokemon) async {
    print("Added pokemon to favorites");
    var box = await Hive.openBox('favorite_pokemon');
    box.put(pokemon.id, pokemon.name);
    Hive.close();
  }

  Future<List<Map<int, dynamic>>> getFavoritePokemon() async {
    var box = await Hive.openBox('favorite_pokemon');
    List<Map<int,dynamic>> list = [];
    for(var i = 0; i < box.length; i++) {
      final pokemon = box.getAt(i);
      list.add(pokemon);
    }
    Hive.close();
    return list;
  }
}
