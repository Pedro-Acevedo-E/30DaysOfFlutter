
import '../modules/pokemon/models/pokemon_info.dart';
import '../modules/pokemon/models/pokemon_page_response.dart';

abstract class NavigationState {}

class LoadingPokemon extends NavigationState {}

class PokemonPageLoadFailed extends NavigationState {
  final Object error;

  PokemonPageLoadFailed({required this.error});
}

class PokemonDetails extends NavigationState {
  final PokemonInfo pokemon;

  PokemonDetails({required this.pokemon});
}

class PokemonList extends NavigationState {
  final PokemonPageResponse pageResponse;

  PokemonList({required this.pageResponse});
}