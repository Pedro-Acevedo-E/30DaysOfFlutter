import 'package:flutter/material.dart';
import 'data_service.dart';
import 'models.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _dataService = DataService();
  Response? _response;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Builder(builder: (_) {
          if (_response != null) {
            return Column(children: [
              Text("Count = ${_response!.count.toString()}"),
              Text("Next = ${_response?.next != null ? _response!.next : "null"}"),
              Text("Previous = ${_response?.previous != null ? _response!.previous : "null"}"),
              getTextWidgets(_response!.results)]
            );
          } else {
            return ElevatedButton(
              onPressed: _makeRequest,
              child: const Text('Make Request'),
            );
          }
        }),
        appBar: AppBar(title: const Text("Request example")),
      ),
    );
  }

  void _makeRequest() async {
    final response = await _dataService.makeRequestToApi();
    setState(() => _response = response);
  }

  Widget getTextWidgets(List<Pokemon> strings) {
    List<Widget> list = <Widget>[];
    for(var i = 0; i < strings.length; i++){
      list.add(
        Row(children: [
          Text("Name: ${strings[i].name}"),
          Text("URL: ${strings[i].url}"),
        ])
      );
    }
    return Column(children: list);
  }
}
