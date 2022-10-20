import 'package:circlight/ManageParent.dart';
import 'package:circlight/ParentAddform.dart';
import 'package:circlight/Reassign.dart';
import 'package:circlight/StudentAddForm.dart';
import 'package:circlight/UpdateParent.dart';

import 'package:circlight/displayParent.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';

Future main() async {
//start of firebase connection
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //end firebase connection

  runApp(MaterialApp(
    home: UpdateParent(),
  ));
}
