import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _users = List.filled(100, "kilo loco");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: Colors.white70,
            appBar: AppBar(
              bottom: const TabBar(tabs: [Text('List'), Text('Grid')]),
            ),
            body:
            TabBarView(children: [_contentListView(), _contentGridView()]),
          )),
    );
  }

  Widget _contentListView() {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 10),
      itemCount: _users.length,
      itemBuilder: (context, index) => Card(
        margin: const EdgeInsets.all(20),
        child: Container(
          color: Colors.blue.withOpacity(0.3),
          height: 150, //Control size of box
          child: ListTile(
              title: Center(child: Text(index.toString()),),
              onTap: () => debugPrint("hello $index"),
            ),
        ),
      ),
    );
  }

  Widget _contentGridView() {
    return GridView.builder(
        itemCount: _users.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), //number of cards per row (number of columns)
        itemBuilder: (context, index) =>
            Card(
              margin: const EdgeInsets.all(10), //control separation between cards
              color: Colors.blue.withOpacity(0.5), //Card background
                child: GridTile(
                    child: InkResponse(   //This allows you to tap a gridTile
                      enableFeedback: true,
                      child: Center(
                        child: Text(_users[index]),
                      ),
                      onTap: () => debugPrint("hello $index"),
                    ),
                )
            )
    );
  }
}

//Useful delegate options for gridview
/*
GridView.builder(
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            // number of items on a row
            crossAxisCount: 52,
            // horizontal spacing between items
            crossAxisSpacing: 3,
            // vertical spacing between items
            mainAxisSpacing: 5,
          ),
          itemBuilder: (BuildContext context, int index) {
            // your list of objects here
            return blocks();
          },
        ),
 */