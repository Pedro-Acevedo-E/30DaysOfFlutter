import 'package:day_16_17_pokedex/models/pokemon_page_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/navigation_bloc.dart';
import '../bloc/navigation_event.dart';
import '../bloc/navigation_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

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
          title: const Text("Pokedex"),
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
        ),
      );
    });
  }

  Widget pageSelector(int count, BuildContext context) {
    final pages = List.generate(count~/24, (int index) => index);
    return PopupMenuButton(
        color: Colors.red.withOpacity(0.8),
        constraints: const BoxConstraints(maxHeight: 300, minWidth: 100),
        initialValue: 1,
        onSelected: (int item) {
          BlocProvider.of<NavigationBloc>(context).add(GoToPageEvent(page: "https://pokeapi.co/api/v2/pokemon/?limit=24&offset=${(item)*24}"));
        },
        itemBuilder: (BuildContext context) => pageItems(pages),
        child: const Icon(Icons.reorder)
    );

  }

  List<PopupMenuItem<int>> pageItems(List<int> items) {
    List<PopupMenuItem<int>> list = [];
    for(var i = 0; i < items.length; i++) {
      list.add(
          PopupMenuItem<int>(
            value: items[i],
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Text("Page ${items[i] + 1}"),
            ),
          )
      );
    }
    return list;
  }
}
