import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "",
      home:
      Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.arrow_back),
          title: const Text("Share"),
          backgroundColor: Colors.pink,
        ),
        body: Stack(
          children: <Widget> [
            const Image(
              image: AssetImage("assets/background_space.jpg"),
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Center(
              child: Container(
                height: 100,
                color: const Color.fromRGBO(0, 0, 0, 0.5),
                child: const Center(
                  child: Text("Naughty",
                  style: TextStyle(fontSize: 40,
                  color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

