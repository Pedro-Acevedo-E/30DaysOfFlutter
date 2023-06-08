import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getPeople() async {
  List people = [];
  CollectionReference collectionReferencePeople = db.collection('people');  //El nombre de aqui debe coincidir con el nombre de la coleccion
  QuerySnapshot queryPeople = await collectionReferencePeople.get(); //Nos traera TODOS los documentos que tenga la collecion people

  for (var element in queryPeople.docs) {
    final Map<String, dynamic> data = element.data() as Map<String, dynamic>;
    final person = {
      "name": data['name'],
      "uid": element.id,
    };
    people.add(person);
  }
  return people;
}

Future<void> addPeople(String name) async {
  await db.collection('people').add({"name" : name});
}

Future<void> updatePeople(String newName, String id) async {
  await db.collection('people').doc(id).set({"name": newName});
}

Future<void> deletePeople(String id) async {
  await db.collection('people').doc(id).delete();
}


/*
Example

{
  "people":
  [
    {
      "name": "pablo"
    },
    {
      "name": "maria"
    },
    {
      "name": "pedro"
    },
  ]
}

 */