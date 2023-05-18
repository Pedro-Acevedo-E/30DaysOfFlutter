import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../navigation/navigation_bloc.dart';
import '../navigation/navigation_event.dart';
import '../navigation/navigation_state.dart';
import 'modules/pokemon/views/error_view.dart';
import 'modules/pokemon/views/load_pokemon_view.dart';
import 'modules/pokemon/views/loading_view.dart';
import 'modules/pokemon/views/pokedex_view.dart';
import 'modules/pokemon/views/pokemon_details_view.dart';

class AppNavigator extends StatelessWidget {
  const AppNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(builder: (context, state) {
      if (state is LoadingPokemon) { return const LoadingView(); }
      if (state is PokemonDetails) { return PokemonDetailsView(pokemon: state.pokemon); }
      if (state is PokemonList) { return PokedexView(page: state.pageResponse); }
      if (state is PokemonPageLoadFailed) { return ErrorView(error: state.error); }
      else { return const InitialView();}
    });
  }
}

/*
return Navigator(
        pages: [
          const MaterialPage(child: InitialView()),
          if (state is LoadingPokemon) const MaterialPage(child: LoadingView()),
          if (state is PokemonDetails) MaterialPage(child: PokemonDetailsView(pokemon: state.pokemon)),
          if (state is PokemonList) MaterialPage(child: PokedexView(page: state.pageResponse)),
          if (state is PokemonPageLoadFailed) MaterialPage(child: ErrorView(error: state.error)),
        ],
        onPopPage: (route, result) {
          BlocProvider.of<NavigationBloc>(context).add(PreviousEvent());
          return route.didPop(result);
        },
      );
 */