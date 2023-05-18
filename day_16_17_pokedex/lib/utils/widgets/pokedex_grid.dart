import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../modules/pokemon/models/pokemon_page_response.dart';
import '../../navigation/navigation_bloc.dart';
import '../../navigation/navigation_event.dart';
import '../type_colors.dart';

Widget pokedexGrid(PokemonPageResponse page, BuildContext context) {
  return GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
    itemCount: page.pokemonListings.length,
    itemBuilder: (context, index) {
      return GestureDetector(
        onTap: () => BlocProvider.of<NavigationBloc>(context).add(GoToDetailsEvent(id: page.pokemonListings[index].id)),
        child: Card(
          margin: const EdgeInsets.all(5),
          color: Colors.grey.withOpacity(0.2),
          child: GridTile(
            child: Stack(
              children: [
                Center(
                  child: SizedBox(
                      height: 100,
                      child: Opacity(opacity: 0.2, child: Image.asset('assets/pokeball_icon.png'))),
                ),
                Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 100,
                          child: CachedNetworkImage(
                            imageUrl: page.pokemonListings[index].imageUrl,
                            placeholder: (context, url) => LoadingAnimationWidget.bouncingBall(color: Colors.red.withOpacity(0.6), size: 70),
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                          ),
                        ),

                        Text(page.pokemonListings[index].name)
                      ],
                    ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}