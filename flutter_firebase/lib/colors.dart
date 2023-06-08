import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

Color background(String color) {
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
}