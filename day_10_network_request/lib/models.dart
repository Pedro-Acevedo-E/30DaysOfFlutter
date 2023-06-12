import 'dart:convert';

class Response {
  final int count;
  final String? next;
  final String? previous;
  final List<Pokemon> results;

  Response({
    required this.count,
    required this.next,
    required this.previous,
    required this.results
  });

  factory Response.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      var listJson = json['results'] as List;
      List<Pokemon> results = listJson.map((e) => Pokemon.fromJson(e)).toList();

      return Response(
          count: json['count'],
          next: json['next'],
          previous: json['previous'],
          results: results
      );
    }
    return Response(
        count: json['count'],
        next: json['next'],
        previous: json['previous'],
        results: []
    );
  }
}

class Pokemon {
  final String name;
  final String url;

  Pokemon({required this.name, required this.url});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
        name: json['name'],
        url: json['url']
    );
  }
}