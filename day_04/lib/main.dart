import 'package:day_04/flashcard_view.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:day_04/flashcard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Flashcard> flashcards = [
    Flashcard(question: "Who is Luke's father?", answer: "*spoilers*\nDarth Vader"),
    Flashcard(question: "What programming language does flutter use?", answer: "dart"),
    Flashcard(question: "What is 1 + 1", answer: "10"),
    Flashcard(question: "How do you fix a broken pipe?", answer: "Call Mario"),
    Flashcard(question: "What time is it?", answer: "${DateTime.now().hour.toString()} : ${DateTime.now().minute.toString()}"),
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
              SizedBox(
                width: 250,
                height: 250,
                child: FlipCard(
                  front: FlashcardView(text: flashcards[currentIndex].question),
                  back: FlashcardView(text: flashcards[currentIndex].answer),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton.icon(
                      onPressed: showPreviousCard,
                      icon: const Icon(Icons.chevron_left),
                      label: const Text("Prev")
                  ),
                  OutlinedButton.icon(
                      onPressed: showNextCard,
                      icon: const Icon(Icons.chevron_right),
                      label: const Text("Next")
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  void showPreviousCard() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
      });
    }
  }

  void showNextCard() {
    if (currentIndex < flashcards.length - 1) {
      setState(() {
        currentIndex++;
      });
    }
  }
}
