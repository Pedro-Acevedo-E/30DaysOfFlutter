import 'dart:convert';
import 'package:http/http.dart' as http;
import 'modules/pokemon/models/pokemon_info.dart';
import 'modules/pokemon/models/pokemon_page_response.dart';

class PokemonRepository {
  final baseUrl = 'pokeapi.co';
  final client = http.Client();

  Future<PokemonPageResponse> getPokemonPage(String page) async {
    print("Making request for: $page");
      final response = await client.get(Uri.parse(page));
      final json = jsonDecode(response.body);
      final data = PokemonPageResponse.fromJson(json);

      /*
      for (var i = 0; i < data.pokemonListings.length; i++) {
        final detailsData = await getPokemonDetails(data.pokemonListings[i].id);
        data.pokemonListings[i].type = detailsData.types[0].type.name;
      }

       */

      return data;
  }

  Future<PokemonInfo> getPokemonDetails(int id) async {
    print("Getting pokemon details of $id}");
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
}
