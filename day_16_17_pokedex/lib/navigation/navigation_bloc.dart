import 'package:flutter_bloc/flutter_bloc.dart';
import '../pokemon_repository.dart';
import 'navigation_event.dart';
import 'navigation_state.dart';

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