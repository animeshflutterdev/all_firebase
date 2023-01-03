import 'package:flutter/material.dart';

import 'firestore_firebase/firestore_db.dart';

class FirebaseOperations extends StatelessWidget {
  const FirebaseOperations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: const Text('Firebase Email Password Auth'),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => FireStoreDb(),
              ),
            );
          },
        )
      ],
    );
  }
}
