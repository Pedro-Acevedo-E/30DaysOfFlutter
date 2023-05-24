import 'package:cached_network_image/cached_network_image.dart';
import 'package:day_16_17_pokedex/app_localizations_context.dart';
import 'package:day_16_17_pokedex/utils/type_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../navigation/navigation_bloc.dart';
import '../../../navigation/navigation_event.dart';
import '../../../utils/constants/constants.dart';
import '../models/pokemon_info.dart';
import '../presenter/pokemon_favorites_bloc.dart';

class PokemonDetailsView extends StatelessWidget {
  final PokemonInfo pokemon;

  const PokemonDetailsView({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Row(children: [
          IconButton(
              onPressed: () => BlocProvider.of<NavigationBloc>(context).add(PreviousEvent()),
              icon: const Icon(Icons.arrow_back),
          ),
          const Text(appTitle),
          IconButton(
            onPressed: () => BlocProvider.of<PokemonFavoritesBloc>(context).add(AddToFavorites(pokemon: pokemon)),
            icon: const Icon(Icons.heart_broken),
          ),
        ]),
      ),
      body: Container(
        color: TypeColor.getColor(pokemon.types[0].type.name).withOpacity(0.2),
        child: ListView(
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
                    Text(pokemon.name.capitalize(), style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                    CachedNetworkImage(
                      imageUrl: pokemon.imageUrl,
                      placeholder: (context, url) => LoadingAnimationWidget.bouncingBall(color: Colors.red.withOpacity(0.6), size: 70),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                    Text(pokemon.genera != null ? pokemon.genera! : "", style: const TextStyle(fontSize: 20)),
                    const SizedBox(height: 20),
                    getTypes(context),
                    const SizedBox(height: 20),
                    Row(
                        children: [
                          const Spacer(flex: 1),
                          Expanded(
                              flex: 20,
                              child: Text(pokemon.flavorText != null ? pokemon.flavorText! : "", style: const TextStyle(fontSize: 20))
                          ),
                          const Spacer(flex: 1),
                        ]
                    ),
                    const SizedBox(height: 20),
                    Row(
                        children: [
                          const Spacer(flex: 5),
                          Expanded(
                              flex: 25,
                              child: Text(context.loc.pokedex_number(pokemon.id), style: const TextStyle(fontSize: 20))
                          ),
                          const Spacer(flex: 1),
                          Expanded(
                              flex: 20,
                              child: Text(context.loc.pokemon_height(pokemon.height / 10), style: const TextStyle(fontSize: 20))
                          ),
                          const Spacer(flex: 1),
                        ]
                    ),
                    const SizedBox(height: 20),
                    getAbilities(context),
                    const SizedBox(height: 20),
                    const Text("Moves: ", style: TextStyle(fontSize: 20)),
                    Container(
                      decoration: BoxDecoration(color: TypeColor.getColor(pokemon.types[0].type.name).withOpacity(0.5), borderRadius: const BorderRadius.all(Radius.circular(20))),
                      height: 200,
                      width: 300,
                      child: getMoves(),
                    ),
                    const SizedBox(height: 20),
                    const Text("Stats: ", style: TextStyle(fontSize: 20)),
                    Container(
                      decoration: BoxDecoration(color: TypeColor.getColor(pokemon.types[0].type.name).withOpacity(0.5), borderRadius: const BorderRadius.all(Radius.circular(20))),
                      height: 150,
                      width: 300,
                      child: getStats(),
                    ),
                    const SizedBox(height: 20),
                  ]
              ),
            ]
        )),
      
    );
  }

  Widget getTypes(BuildContext context) {
    List<Widget> list = [];
    list.add(const Spacer());
    list.add(Text(context.loc.types, style: const TextStyle(fontSize: 20)));
    for(var i = 0; i < pokemon.types.length; i++) {
      list.add(
          Container(
              width: 80,
              color: TypeColor.getColor(pokemon.types[i].type.name),
              child: Center(child: Text(pokemon.types[i].type.name, style: const TextStyle(fontSize: 20)))
          )
      );
    }
    list.add(const Spacer());
    return Row(children: list);
  }

  Widget getAbilities(BuildContext context) {
    List<Widget> list = [];
    list.add(const Spacer());
    list.add(Text(context.loc.pokemon_abilities, style: const TextStyle(fontSize: 20)));
    for(var i = 0; i < pokemon.abilities.length; i++) {
      list.add(
          SizedBox(
              width: 100,
              child: Center(child: Text(pokemon.abilities[i].ability.name, style: const TextStyle(fontSize: 20)))
          )
      );
    }
    list.add(const Spacer());
    return Row(children: list);
  }

  Widget getMoves() {
    List<Widget> list = [];
    for(var i = 0; i < pokemon.moves.length; i++) {
      list.add(
          SizedBox(
              width: 110,
              child: Center(child: Text(pokemon.moves[i].move.name, style: const TextStyle(fontSize: 20)))
          )
      );
    }
    return ListView(children: list);
  }

  Widget getStats() {
    List<Widget> list = [];
    for(var i = 0; i < pokemon.stats.length; i++) {
      list.add(
          SizedBox(
              width: 400,
              child: Center(child: Text("${pokemon.stats[i].stat.name}: ${pokemon.stats[i].baseStat}", style: const TextStyle(fontSize: 20)))
          )
      );
    }
    return Column(children: list);
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
