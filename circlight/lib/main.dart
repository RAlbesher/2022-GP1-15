import 'package:circlight/Pages/ManageParent.dart';
import 'package:circlight/Pages/ParentAddform.dart';
import 'package:circlight/Pages/Reassign.dart';
import 'package:circlight/Pages/UpdateParent.dart';
import 'package:circlight/Pages/UpdateStudent.dart';

import 'package:circlight/Pages/displayParent.dart';
import 'package:circlight/Pages/displayStudent.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:circlight/Pages/firebase_options.dart';

import 'package:circlight/Pages/Nav.dart';

Future main() async {
//start of firebase connection
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //end firebase connection

  runApp(MaterialApp(
    home: Nav(TabValue: 0, documentId: ""),
  ));
}
