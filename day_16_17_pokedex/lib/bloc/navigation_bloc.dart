import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/pokemon_info.dart';
import '../models/pokemon_page_response.dart';
import '../pokemon_repository.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  final _pokemonRepository = PokemonRepository();
  final List<NavigationState> navStates = [];

  NavigationBloc() : super(LoadingPokemon()) {
    on<NavigationEvent>(_mapEventToState);
  }

  void _mapEventToState(NavigationEvent event, Emitter<NavigationState> emit) async {
    try {
      if (event is GoToDetailsEvent) {
        emit(LoadingPokemon());
        final pokemonResponse = await _pokemonRepository.getPokemonDetails(event.id);
        final speciesInfo = await _pokemonRepository.getSpeciesInfo(pokemonResponse.species.url);
        pokemonResponse.setSpeciesInfo(speciesInfo);
        navStates.add(PokemonDetails(pokemon: pokemonResponse));
        emit(PokemonDetails(pokemon: pokemonResponse));
      }
      if (event is GoToPageEvent) {
        emit(LoadingPokemon());
        final pokemonPageResponse = await _pokemonRepository.getPokemonPage(event.page);
        navStates.add(PokemonList(pageResponse: pokemonPageResponse));
        emit(PokemonList(pageResponse: pokemonPageResponse));
      }
      if (event is PreviousEvent) {
        if(navStates.length > 1) {
          emit(navStates[navStates.length - 2]);
          navStates.removeLast();
        }
      }
    } catch (e) {
      emit(PokemonPageLoadFailed(error: e));
    }
  }
}



abstract class NavigationEvent {}

class PreviousEvent extends NavigationEvent {}

class GoToDetailsEvent extends NavigationEvent {
  final int id;

  GoToDetailsEvent({required this.id});
}

class GoToPageEvent extends NavigationEvent {
  final String page;

  GoToPageEvent({required this.page});
}

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