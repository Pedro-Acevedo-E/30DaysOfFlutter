import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors.dart';
import '../services/firebase_service.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final FirebaseRemoteConfig firebaseRemoteConfig = FirebaseRemoteConfig.instance;

  @override
  void initState() {
    super.initState();
    firebaseRemoteConfig.onConfigUpdated.listen((event) async {
      await firebaseRemoteConfig.fetchAndActivate();
      setState(() {});
    });
    firebaseRemoteConfig.fetchAndActivate();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background(firebaseRemoteConfig.getString("RGB")),
      appBar: AppBar(title: const Text('Firebase')),
      body: FutureBuilder(
        future: getPeople(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: ListView.builder(
                shrinkWrap: true,
                  padding: const EdgeInsets.all(20.0),
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      onDismissed: (direction) async {
                        await deletePeople(snapshot.data?[index]['uid']);
                        snapshot.data?.removeAt(index);
                      },
                      confirmDismiss: (direction) async {
                        bool result = false;
                        result = await showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Are you sure you want to delete ${snapshot.data?[index]['name']}?"),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        return Navigator.pop(context, false);
                                      },
                                      child: const Text("Cancel", style: TextStyle(color: Colors.red),),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      return Navigator.pop(context, true);
                                    },
                                    child: const Text("Yes"),
                                  ),
                                ],
                              );
                            }
                        );
                        return result;
                      },
                      background: Container(
                        color: Colors.red,
                        child: const Icon(Icons.delete),
                      ),
                      direction: DismissDirection.endToStart,
                      key: Key(snapshot.data?[index]['uid']),
                      child: Card(
                        color: Colors.green.withOpacity(0.8),
                        shadowColor: Colors.black,
                        elevation: 5,
                        child: ListTile(
                          title: Center(
                            child: Text(
                                snapshot.data?[index]['name'] != null ? snapshot
                                    .data![index]['name'] : ""),
                          ),
                          onTap: (() async {
                            await Navigator.pushNamed(
                                context, '/edit', arguments: {
                              "name": snapshot.data?[index]['name'],
                              "uid": snapshot.data?[index]['uid'],
                            });
                            setState(() {});
                          }),
                        ),
                      ),
                    );
                  }
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }),
      ),
      floatingActionButton: Row(children: [
        const Spacer(),
        FloatingActionButton(
          heroTag: "btn refresh",
          child: const Icon(Icons.refresh),
          onPressed: () {
            setState(() {
              getPeople();
            });
          },
        ),
        const SizedBox(width: 10,),
        FloatingActionButton(
          heroTag: "btn add",
          child: const Icon(Icons.add),
          onPressed: () async {
            await Navigator.pushNamed(context, '/add');
            setState(() {});
          },
        ),
      ],)
    );
  }
}