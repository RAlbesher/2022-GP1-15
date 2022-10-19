//import 'dart:html';

//import 'package:circlight/ReadData.dart';
//import 'package:circlight/ReadData.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:adobe_xd/adobe_xd.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:circlight/create_parent_profile.dart';
import 'package:firebase_core/firebase_core.dart' show Firebase;
import 'firebase_options.dart';
import 'package:flutter/src/widgets/framework.dart';

class EditTry2 extends StatefulWidget {
  const EditTry2({super.key});

  @override
  State<EditTry2> createState() => _EditTry();
}

class _EditTry extends State<EditTry2> {
  final formKey = GlobalKey<FormState>();
  final userRef = FirebaseFirestore.instance;

  TextEditingController parentName = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        //final ReadData Read = new ReadData();
        body: StreamBuilder<List<Parent>>(
            stream: readParents(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text("e");
              } else if (snapshot.hasData) {
                final parents = snapshot.data!;
                return ListView(
                  children: parents.map(buildParent).toList(),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      );

  Stream<List<Parent>> readParents() => FirebaseFirestore.instance
      .collection("users")
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Parent.fromJson(doc.data())).toList());

  Widget buildParent(Parent parent) => ListTile(
        leading: CircleAvatar(child: Text('${parent.Nationality} ')),
        title: Text(parent.name),
      );
}

class Parent {
  final String name;
  final String Nationality;

  Parent({required this.name, required this.Nationality});
  Map<String, dynamic> toJson() => {
        'name': name,
        'Nationality': Nationality,
      };

  static Parent fromJson(Map<String, dynamic> json) => Parent(
        name: json['name'],
        Nationality: json['Nationality'],
      );
}
