import 'package:day_16_17_pokedex/bloc/navigation_bloc.dart';
import 'package:day_16_17_pokedex/views/pokedex_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_navigator.dart';
import 'bloc/pokemon_bloc.dart';
import 'bloc/pokemon_event.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.red,
          primarySwatch: Colors.red,

      ),
      home: MultiBlocProvider(providers: [
        BlocProvider(
            create: (context) =>
            NavigationBloc()..add(GoToPageEvent(page: "https://pokeapi.co/api/v2/pokemon/?limit=24&offset=0")))
      ], child: const AppNavigator()),
    );
  }
}