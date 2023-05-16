import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  final Object error;

  const ErrorView({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
      ),
      body: Text(error.toString()),
    );
  }
}
