import 'package:day_16_17_pokedex/utils/widgets/pokedex_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../navigation/navigation_bloc.dart';
import '../../../navigation/navigation_state.dart';
import '../../../utils/constants/constants.dart';
import '../../../utils/widgets/botom_navigation_container.dart';
import '../models/pokemon_page_response.dart';
import '../presenter/pokemon_favorites_bloc.dart';

class PokedexView extends StatelessWidget {
  final PokemonPageResponse page;
  final textEditingController = TextEditingController();

  PokedexView({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(builder: (context, state) {
      return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Row(children: [
            const Text(appTitle),
            IconButton(
              onPressed: () => BlocProvider.of<PokemonFavoritesBloc>(context).add(GetFavorites()),
              icon: const Icon(Icons.monitor_heart),
            ),
          ]),
        ),
        body: pokedexGrid(page, context),
        bottomNavigationBar: bottomNavigationContainer(page, context),
      );
    });
  }
}
