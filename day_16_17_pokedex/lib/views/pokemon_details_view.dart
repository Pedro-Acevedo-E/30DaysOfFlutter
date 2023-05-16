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
      body: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
                    Text(pokemon.name.capitalize(), style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                    Image.network(pokemon.imageUrl),
                    Text(pokemon.genera != null ? pokemon.genera! : "", style: const TextStyle(fontSize: 20)),
                    const SizedBox(height: 20),
                    getTypes(),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Spacer(flex: 3),
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
                          const Spacer(flex: 8),
                          Expanded(
                              flex: 20,
                              child: Text("Pokedex number: ${pokemon.id.toString()}", style: const TextStyle(fontSize: 20))
                          ),
                          Expanded(
                              flex: 20,
                              child: Text("Height: ${(pokemon.height / 10).toString()}m", style: const TextStyle(fontSize: 20))
                          ),
                          const Spacer(flex: 1),
                        ]
                    ),
                    const SizedBox(height: 20),
                    getAbilities(),
                    const SizedBox(height: 20),
                    const Text("Moves: ", style: TextStyle(fontSize: 20)),
                    Container(
                      decoration: const BoxDecoration(color: Color.fromRGBO(193, 199, 195, 1), borderRadius: BorderRadius.all(Radius.circular(20))),
                      height: 200,
                      width: 300,
                      child: getMoves(),
                    ),
                    const SizedBox(height: 20),
                    const Text("Stats: ", style: TextStyle(fontSize: 20)),
                    Container(
                      decoration: const BoxDecoration(color: Color.fromRGBO(193, 199, 195, 1), borderRadius: BorderRadius.all(Radius.circular(20))),
                      height: 150,
                      width: 300,
                      child: getStats(),
                    ),
                    const SizedBox(height: 20),
                  ]),
            ),
    );
  }

  Widget getTypes() {
    List<Widget> list = [];
    list.add(const Spacer());
    list.add(const Text("Types: ", style: TextStyle(fontSize: 20)));
    for(var i = 0; i < pokemon.types.length; i++) {
      list.add(
          Container(
              width: 100,
              color: pokemon.getColor(pokemon.types[i].type.name),
              child: Center(child: Text(pokemon.types[i].type.name, style: const TextStyle(fontSize: 20)))
          )
      );
    }
    list.add(const Spacer());
    return Row(children: list);
  }

  Widget getAbilities() {
    List<Widget> list = [];
    list.add(const Spacer());
    list.add(const Text("Abilities: ", style: TextStyle(fontSize: 20)));
    for(var i = 0; i < pokemon.abilities.length; i++) {
      list.add(
          SizedBox(
              width: 110,
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
              width: 110,
              child: Center(child: Text("${pokemon.stats[i].stat.name}: ${pokemon.stats[i].baseStat}", style: const TextStyle(fontSize: 20)))
          )
      );
    }
    return ListView(children: list);
  }

}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
