import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<StatefulWidget> createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {
  late final WebViewController controller;

  @override
  void initState() {
    controller = WebViewController()
      ..loadRequest(Uri.parse('https://flutter.dev'));
    super.initState();
  }
//WebViewWidget(controller: controller)
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: const Text("My website"),
          ),
        body: WebViewWidget(controller: controller),
        bottomNavigationBar: Container(
          color: Theme.of(context).colorScheme.secondary,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20, right: 20),
            child: ButtonBar(
              children: [
                navigationButton(Icons.chevron_left, goBack),
                navigationButton(Icons.chevron_right, goForward),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget navigationButton(IconData icon, Function() onPressed) {
        return IconButton(onPressed: onPressed, icon: Icon(icon), color: Colors.white);
  }

  void goBack() async {
    if(await controller.canGoBack()) {
      controller.goBack();
    }
  }

  void goForward() async {
    if(await controller.canGoForward()) {
    controller.goForward();
    }
  }
}

