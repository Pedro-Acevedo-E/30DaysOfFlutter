import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/navigation_bloc.dart';

class InitialView extends StatelessWidget {
  const InitialView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(builder: (context, state) {
      return Scaffold(
          appBar: AppBar(
            title: const Text('Pokedex'),
          ),
          body: ElevatedButton(
            onPressed: () => BlocProvider.of<NavigationBloc>(context).add(GoToPageEvent(page: "https://pokeapi.co/api/v2/pokemon/?limit=24&offset=0")),
            child: const Center(child: Text("Open pokedex")),
          )
      );
    });
  }
}
