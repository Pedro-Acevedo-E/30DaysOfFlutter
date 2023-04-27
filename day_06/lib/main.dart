import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final imagePaths = [
    "assets/image1.jpg",
    "assets/image2.jpg",
    "assets/image3.jpg",
    "assets/image4.jpg",
    "assets/image5.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CarouselSlider(
                    options: CarouselOptions(autoPlay: true),
                    items: imagePaths.map((imagePath) {
                      return Builder(builder: (context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,//get the width of the device
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          child: Image.asset(imagePath),
                        );
                      });
                    }).toList(),
                ),
              ],
            ),
          ),
      ),
    );
  }
}
