import 'package:day_16_17_pokedex/views/error_view.dart';
import 'package:day_16_17_pokedex/views/load_pokemon_view.dart';
import 'package:day_16_17_pokedex/views/loading_view.dart';
import 'package:day_16_17_pokedex/views/pokedex_view.dart';
import 'package:day_16_17_pokedex/views/pokemon_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/navigation_bloc.dart';
import 'bloc/navigation_event.dart';
import 'bloc/navigation_state.dart';

class AppNavigator extends StatelessWidget {
  const AppNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(builder: (context, state) {
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
    });
  }
}