import 'package:flutter/material.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _users = List.filled(500, "kilo loco");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
          length: 3,
          child: Scaffold(
            backgroundColor: Colors.white70,
            appBar: AppBar(
              title: const TabBar(tabs: [Text('List'), Text('Laggy Grid'), Text('Better grid')]),
            ),
            body:
            TabBarView(children: [_contentListView(), _contentGridView(), _contentResponsiveGridView()]),
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
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5), //number of cards per row (number of columns)
        itemBuilder: (context, index) =>
            Container(
              margin: const EdgeInsets.all(10), //control separation between cards
              color: Colors.blue.withOpacity(0.5), //Card background
                child: GridTile(
                      child: InkResponse(
                        child: Center(
                          child: Text(index.toString()),
                        ),
                        onTap: () => debugPrint("hello $index"),
                      ),
                )
            )
    );
  }

  Widget _contentResponsiveGridView() {
    return ResponsiveGridList(
      horizontalGridMargin: 10,
      verticalGridMargin: 10,
      //minItemWidth: 100,
      minItemWidth: 80,
      minItemsPerRow: 5,
      children: userList(),
    );
  }

  List<Widget> userList() {
    List<Widget> list = <Widget>[];
    for(var i = 0; i < _users.length; i++) {
      list.add(
          Container(
            //margin: const EdgeInsets.all(10),
            height: 80,
              color: Colors.blue.withOpacity(0.5), //Card background
              child: GestureDetector(
                  child: Center(
                    child: Text(i.toString()),
                  ),
                  onTap: () => debugPrint("hello $i"),
                ),

          )
      );
    }
    return list;
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