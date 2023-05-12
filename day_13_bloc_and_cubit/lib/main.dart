import 'package:day_13_bloc_and_cubit/posts_cubit.dart';
import 'package:day_13_bloc_and_cubit/posts_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final postCubit = PostsCubit();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: BlocProvider<PostsCubit>(
            create: (context) => postCubit, child: PostsView(postCubit: postCubit)));
  }
}

/*This is a manual posts implementation
  Check https://github.com/Kilo-Loco/30DaysOfFlutter/tree/main/day13_bloc_and_cubit/lib to see automatic implementation with loading bar

  On line 24 you can use
    create: (context) => PostsCubit()..getPosts(), child: PostsView()));
  To call getPosts on creation instance
 */