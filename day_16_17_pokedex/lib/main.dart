import 'package:day_16_17_pokedex/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'app_navigator.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../navigation/navigation_bloc.dart';
import '../navigation/navigation_event.dart';
import 'modules/pokemon/presenter/pokemon_favorites_bloc.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('favorite_pokemon');
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
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('es'), // Spanish
      ],
      home: MultiBlocProvider(providers: [
        BlocProvider(
            create: (context) =>
            NavigationBloc()..add(GoToPageEvent(page: "https://pokeapi.co/api/v2/pokemon/?limit=$paginationNumber&offset=0"))
        ),
        BlocProvider(
            create: (context) =>
            PokemonFavoritesBloc()
        ),
      ], child: const AppNavigator()),
    );
  }
}