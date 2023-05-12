import 'package:day_15_bloc_navigation/post_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_navigator.dart';
import 'nav_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (context) => NavCubit()
              ),
              BlocProvider(
                create: (context) => PostsBloc()..add(LoadPostsEvent()),
              )
            ],
            child: const AppNavigator())
    );
  }
}
