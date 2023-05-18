import 'package:flutter/material.dart';

class TypeColor {
  static Color getColor(String type) {
    switch (type) {
      case "grass":
        {
          return Colors.green;
        }
      case "fire":
        {
          return Colors.red;
        }
      case "water":
        {
          return Colors.blue;
        }
      case "bug":
        {
          return const Color.fromRGBO(167, 183, 35, 1);
        }
      case "normal":
        {
          return const Color.fromRGBO(176, 172, 136, 1);
        }
      case "poison":
        {
          return const Color.fromRGBO(164, 62, 158, 1);
        }
      case "fighting":
        {
          return const Color.fromRGBO(193, 34, 57, 1);
        }
      case "flying":
        {
          return const Color.fromRGBO(168, 145, 236, 1);
        }
      case "ground":
        {
          return const Color.fromRGBO(222, 193, 107, 1);
        }
      case "rock":
        {
          return const Color.fromRGBO(182, 158, 49, 1);
        }
      case "ghost":
        {
          return const Color.fromRGBO(112, 85, 155, 1);
        }
      case "steel":
        {
          return const Color.fromRGBO(183, 185, 208, 1);
        }
      case "electric":
        {
          return const Color.fromRGBO(249, 207, 48, 1);
        }
      case "psychic":
        {
          return const Color.fromRGBO(251, 85, 132, 1);
        }
      case "ice":
        {
          return const Color.fromRGBO(154, 214, 223, 1);
        }
      case "dragon":
        {
          return const Color.fromRGBO(112, 55, 255, 1);
        }
      case "dark":
        {
          return const Color.fromRGBO(117, 87, 76, 1);
        }
      case "fairy":
        {
          return const Color.fromRGBO(230, 158, 172, 1);
        }
      default:
        {
          return Colors.grey;
        }
    }
  }
}