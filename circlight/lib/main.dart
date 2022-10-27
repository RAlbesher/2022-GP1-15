import 'package:circlight/Pages/AdminHome.dart';
import 'package:circlight/Pages/ManageParent.dart';
import 'package:circlight/Pages/ManageStudent.dart';
import 'package:circlight/Pages/ParentAddform.dart';
import 'package:circlight/Pages/Reassign.dart';
import 'package:circlight/Pages/StudentAddForm.dart';
import 'package:circlight/Pages/UpdateParent.dart';
import 'package:circlight/Pages/UpdateStudent.dart';
import 'package:circlight/Pages/create_parent_profile.dart';

import 'package:circlight/Pages/displayParent.dart';
import 'package:circlight/Pages/displayStudent.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Pages/firebase_options.dart';

Future main() async {
//start of firebase connection
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //end firebase connection

  runApp(MaterialApp(
    home: Paretdisplay(),
  ));
}
