import 'package:flutter/material.dart';
import 'package:flutter_firebase/services/firebase_service.dart';

class AddNamePage extends StatefulWidget {
  const AddNamePage({super.key});

  @override
  State<StatefulWidget> createState() => _AddNamePage();
}

class _AddNamePage extends State<AddNamePage> {
  final controller = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Add name'),),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              const SizedBox(height: 20,),
              TextField(
                controller: controller,
                decoration: const InputDecoration(
                  hintText: 'Enter Name',
                ),
              ),
              const SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: () async {
                    await addPeople(controller.text).then((_) {
                      Navigator.pop(context);
                    });
                  },
                  child: const Text('Add'),
              ),
            ]),
          ),
      ),
    );
  }
}

//Then se ejecuta cuando el Future termina