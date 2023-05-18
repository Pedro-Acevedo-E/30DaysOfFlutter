import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(children: [
        AppBar(
          title: const Text('Pokedex'),
        ),
        const Spacer(),
        const Center(child: CircularProgressIndicator(),),
        const Spacer(),
      ]),
    );
  }
}
