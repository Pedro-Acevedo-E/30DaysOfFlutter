import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

Color background(String json) {
  final color = ColorModel.fromJson(
    jsonDecode(json) as Map<String, dynamic>,
  );
  //return const Color.fromRGBO(21,76,121, 0.8);
  return Color.fromRGBO(color.red, color.green, color.blue, color.opacity);

  /*
  switch(color) {
    case "cyan":
      return Colors.cyan;
    case "red":
      return Colors.red;
    case "blue":
      return Colors.blue;
    case "green":
      return Colors.green;
    case "orange":
      return Colors.orange;
    case "yellow":
      return Colors.yellow;
    default:
      return Colors.white;
  }

   */
}

class ColorModel {
  ColorModel({required this.red, required this.green, required this.blue, required this.opacity});

  ColorModel.fromJson(Map<String, dynamic> json)
      : red = json['red'],
        green = json['green'],
        blue = json['blue'],
        opacity = json['opacity'];


  final int red;
  final int green;
  final int blue;
  final double opacity;
}