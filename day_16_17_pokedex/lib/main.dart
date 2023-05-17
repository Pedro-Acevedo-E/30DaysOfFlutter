import 'package:day_16_17_pokedex/bloc/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_navigator.dart';
import 'bloc/navigation_event.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
            NavigationBloc()..add(GoToPageEvent(page: "https://pokeapi.co/api/v2/pokemon/?limit=24&offset=0")))
      ], child: const AppNavigator()),
    );
  }
}