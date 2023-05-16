import 'package:flutter/material.dart';
import '../models/pokemon_page_response.dart';

abstract class PokemonEvent {}

class PokemonPageRequest extends PokemonEvent {
  final int page;

  PokemonPageRequest({required this.page});
}