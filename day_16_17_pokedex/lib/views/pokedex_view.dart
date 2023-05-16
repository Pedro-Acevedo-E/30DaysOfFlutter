import 'package:day_16_17_pokedex/models/pokemon_page_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/navigation_bloc.dart';

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
          title: const Text('Pokedex'),
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemCount: page.pokemonListings.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => BlocProvider.of<NavigationBloc>(context).add(GoToDetailsEvent(id: page.pokemonListings[index].id)),
              child: Card(
                margin: const EdgeInsets.all(5),
                color: page.pokemonListings[index].typeColor.withOpacity(0.5),
                child: GridTile(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 100,
                          child: Image.network(page.pokemonListings[index].imageUrl, errorBuilder: (context, exception, stackTrace) {
                            return const Text("Image not found");
                          }),
                      ),

                      Text(page.pokemonListings[index].name)
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: Container(
          color: Colors.red,
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
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: TextField(
                        controller: textEditingController,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onSubmitted: (text) =>  BlocProvider.of<NavigationBloc>(context).add(GoToPageEvent(page: "https://pokeapi.co/api/v2/pokemon/?limit=24&offset=${int.parse(text)*24}")),
                        decoration: InputDecoration(labelText: "Total Pages: ${(page.count~/24).toString()}"),
                      ),
                    )
                ),
                Expanded(
                  flex: 5,
                  child: IconButton(
                    onPressed: page.next != null ? () =>  BlocProvider.of<NavigationBloc>(context).add(GoToPageEvent(page: page.next!)) : () {} ,
                    icon: const Icon(Icons.arrow_forward),
                  )
                ),
                const Spacer(flex: 1),
              ]
          ),
        ),
      );
    });
  }
}
