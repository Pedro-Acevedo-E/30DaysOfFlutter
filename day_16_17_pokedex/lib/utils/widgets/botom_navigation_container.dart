import 'package:day_16_17_pokedex/utils/constants/constants.dart';
import 'package:day_16_17_pokedex/utils/widgets/page_selector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../modules/pokemon/models/pokemon_page_response.dart';
import '../../navigation/navigation_bloc.dart';
import '../../navigation/navigation_event.dart';

Widget bottomNavigationContainer(PokemonPageResponse page, BuildContext context) {
  return Container(
    color: pokedexColor,
    child: Row(
        children: [
          const Spacer(flex: 1),
          Expanded(
            flex: 6,
            child: IconButton(
              onPressed: page.previous != null ? () =>  BlocProvider.of<NavigationBloc>(context).add(GoToPageEvent(page: page.previous!)) : () {} ,
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          Expanded(
            flex: 6,
            child:  pageSelector(page.count, context),
          ),
          Expanded(
              flex: 6,
              child: IconButton(
                onPressed: page.next != null ? () =>  BlocProvider.of<NavigationBloc>(context).add(GoToPageEvent(page: page.next!)) : () {} ,
                icon: const Icon(Icons.arrow_forward),
              )
          ),
          const Spacer(flex: 1),
        ]
    ),
  );
}