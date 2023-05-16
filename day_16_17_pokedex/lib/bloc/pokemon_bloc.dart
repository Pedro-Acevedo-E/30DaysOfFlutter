import 'package:day_16_17_pokedex/bloc/pokemon_event.dart';
import 'package:day_16_17_pokedex/bloc/pokemon_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../pokemon_repository.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final _pokemonRepository = PokemonRepository();

  PokemonBloc() : super(PokemonInitial()) {
    on<PokemonEvent>(_mapEventToState);
  }

  void _mapEventToState(PokemonEvent event, Emitter<PokemonState> emit) async {
    if (event is PokemonPageRequest) {
      emit(PokemonLoadInProgress());

      try {
        final pokemonPageResponse =
        await _pokemonRepository.getPokemonPage("ppp");
        emit(PokemonPageLoadSuccess(
            pokemonListings: pokemonPageResponse.pokemonListings,
            canLoadNextPage: true));
      } catch (e) {
        emit(PokemonPageLoadFailed(error: e));
      }
    }
  }
}