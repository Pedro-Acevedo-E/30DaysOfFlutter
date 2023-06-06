import 'package:flutter/material.dart';
import 'package:flutter_firebase/services/firebase_service.dart';

class EditNamePage extends StatefulWidget {
  const EditNamePage({super.key});

  @override
  State<StatefulWidget> createState() => _EditNamePage();
}

class _EditNamePage extends State<EditNamePage> {
  final controller = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    controller.text = arguments['name'];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Edit name'),),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            const SizedBox(height: 20,),
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'Insert new name',
              ),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () async {
                await updatePeople(controller.text, arguments['uid']).then((_) {
                  Navigator.pop(context);
                });
              },
              child: const Text('Update'),
            ),
          ]),
        ),
      ),
    );
  }
}