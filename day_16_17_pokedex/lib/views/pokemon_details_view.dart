import 'package:flutter/material.dart';
import '../models/pokemon_info.dart';

class PokemonDetailsView extends StatelessWidget {
  final PokemonInfo pokemon;

  const PokemonDetailsView({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
      ),
      body:  SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
                    Text(pokemon.name.capitalize(), style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                    Image.network(pokemon.imageUrl),
                    //const Spacer(),
                    Text(pokemon.genera, style: const TextStyle(fontSize: 20)),
                    getTypes(),
                    Text(pokemon.flavorText, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.normal)),
                    Text(pokemon.genera)
                  ]),
            ),
    );
  }

  Widget getTypes() {
    List<Widget> list = [];
    list.add(const Spacer());
    list.add(const Text("Types: "));
    for(var i = 0; i < pokemon.types.length; i++) {
      list.add(
          Container(
              width: 100,
              color: pokemon.getColor(pokemon.types[i].type.name),
              child: Center(child: Text(pokemon.types[i].type.name))
          )
      );
    }
    list.add(const Spacer());
    return Row(children: list);
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
