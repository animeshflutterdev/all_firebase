import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FireStoreDb extends StatelessWidget {
  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Firebase firestore crud".toUpperCase()),
          TextFormField(
            controller: name,
          ),
          StreamBuilder(
              initialData: _read,
              builder: (_, snapshot) {
                // if (snapshot.hasData) {
                  return Text(snapshot.data.toString());
                // }
              }),
          ElevatedButton(onPressed: _add, child: Text('Add')),
          ElevatedButton(onPressed: _read, child: Text('Read')),
          ElevatedButton(onPressed: _update, child: Text('Update')),
          ElevatedButton(onPressed: _delete, child: Text('Delete')),
        ],
      ),
    );
  }

  _add() {
    final docUser =
        FirebaseFirestore.instance.collection('collectionPath').doc('my-id');
    final json = {
      "Name": name.text.toString(),
    };
    docUser.set(json);
  }

  _read() => FirebaseFirestore.instance
      .collection('collectionPath')
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());

  _update() {}

  _delete() {}
}
