import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Screenshot(
                        controller: _screenshotController,
                        child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                children: [
                                  Image.asset('images/codepassionately.png'),
                                  const Text(
                                    'Code Passionately',
                                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            )),
                      ),
                      TextButton(
                        onPressed: _takeScreenshot,
                        child: const Text('Take Screenshot and Share'),
                      )
                    ]))));
  }

  void _takeScreenshot() async {
    final directory = (await getApplicationDocumentsDirectory ()).path; //from path_provide package
    String fileName = "${DateTime.now()}.png";
    var path = directory;

    await _screenshotController.captureAndSave(
        path, //set path where screenshot will be saved
        fileName: fileName
    );
    //final imageFile = await _screenshotController.capture();

    Share.shareXFiles([XFile("$path/$fileName")], text: "Shared from #SexyFlutterApp");
  }
}