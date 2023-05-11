import 'dart:convert';

import 'package:day_10/models.dart';
import 'package:http/http.dart' as http;

class DataService {
  Future<Response> makeRequestToApi() async {

    //https://pokeapi.co/api/v2/pokemon/?limit=20&offset=0
    final uri2 = Uri(
        scheme: 'https',
        host: 'pokeapi.co',
        path: '/api/v2/pokemon/',
        queryParameters: {'limit':'20','offset':'0'}
    );
    final uri = Uri.parse('https://pokeapi.co/api/v2/pokemon/?limit=20&offset=0');


    final response = await http.get(uri2);

    if (response.statusCode == 200) {
      return Response.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('failed to load data');
    }
  }
}