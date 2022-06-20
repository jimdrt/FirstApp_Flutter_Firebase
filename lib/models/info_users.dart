import "package:flutter/material.dart";
import 'package:cloud_firestore/cloud_firestore.dart';


class MoviesInformation extends StatefulWidget {
  const MoviesInformation({Key? key}) : super(key: key);

  @override
  State<MoviesInformation> createState() => _MoviesInformationState();
}

class _MoviesInformationState extends State<MoviesInformation> {

  final Stream<QuerySnapshot> moviesStream =
      FirebaseFirestore.instance.collection('users').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: moviesStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            return ListTile(
              title: Text(data['name']),
              subtitle: Image.network(data['avatar']),
            );
          }).toList(),
        );
      },
    );
  }
}
