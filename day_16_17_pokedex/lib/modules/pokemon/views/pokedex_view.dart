import 'package:day_16_17_pokedex/utils/widgets/pokedex_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../navigation/navigation_bloc.dart';
import '../../../navigation/navigation_state.dart';
import '../../../utils/constants/constants.dart';
import '../../../utils/widgets/botom_navigation_container.dart';
import '../models/pokemon_page_response.dart';

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
          title:  const Text(appTitle),
        ),
        body: pokedexGrid(page, context),
        bottomNavigationBar: bottomNavigationContainer(page, context),
      );
    });
  }
}
