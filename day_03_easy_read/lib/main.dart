import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _fontSize = 40;
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  textInputAction: TextInputAction.done,
                  style: TextStyle(fontSize: _fontSize),
                  maxLines: null,
                  decoration: const InputDecoration(hintText: 'Insert Text Here'),
                ),
              ),
              Row(children: [
                  Slider(
                    value: _fontSize,
                    onChanged: sliderChange,
                    min: 30,
                    max: 200,
                  ),
                  const Spacer(),
                  Padding(
                      padding: const EdgeInsets.all(5),
                      child: FloatingActionButton(
                        onPressed: clearText,
                        tooltip: 'Clear',
                        child: const Icon(Icons.delete),
                      ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void sliderChange(double newSize) {
    setState(() {
      _fontSize = newSize;
    });
  }

  void clearText() {
    setState(() {
      controller.text = "";
    });
  }
}
