import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}
//StatefulWidget allows us to remember any user input and values that may change
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<String> restaurants = [
    "McDonalds",
    "Olive Garden",
    "Pizza Hut",
    "Panda Express",
    "Tacos el Poblano",
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('What do you want to eat?',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text(restaurants[currentIndex],
                    style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
                const Padding(padding: EdgeInsets.only(top: 30)),
                ElevatedButton(
                  style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.green)),
                  onPressed: updateIndex,
                  child: const Text("Pick restaurant"),
                ),
            ],),
        ),
      ),
    );
  }
  void updateIndex() {
    final random = Random();
    final index = random.nextInt(restaurants.length);
    setState((){
      currentIndex = index;
    });
  }
}
