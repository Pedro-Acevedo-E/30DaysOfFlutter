import 'package:hive/hive.dart';

class PokeDetails {
  final String name;
  final String url;

  PokeDetails({required this.name, required this.url});
  factory PokeDetails.fromJson(Map<String, dynamic> json) {
    final nameData = json['name'];
    final urlData = json['url'];

    return PokeDetails(name: nameData, url: urlData);
  }
}