import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:adobe_xd/adobe_xd.dart';
//import 'package:flutter/src/widgets/framework.dart';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:encryptor/encryptor.dart';

class Aftershift {
  //get doc id
  String Email = ""; //
  String APassword = ""; //
  String SchoolName = ""; //
  String Username = ""; //
  Aftershift({
    Email,
    APassword,
    SchoolName,
    Username,
  });

  UpdateAftershift(DocId, Field, Updated) async {
    CollectionReference Aftershift =
        FirebaseFirestore.instance.collection("Afternoonshift");
    bool IsUpdated = false;

    switch (Field) {
      case "Email":
        await Aftershift.doc(DocId).update({
          'Email': Updated,
        });
        break;
      case "Password":
        await Aftershift.doc(DocId).update({
          'Password': Updated,
        });
        break;

      case "SchoolName":
        await Aftershift.doc(DocId).update({
          'SchoolName': Updated,
        });
        break;

      case "UserName":
        await Aftershift.doc(DocId).update({
          'UserName': Updated,
        });
        break;
    }
    return IsUpdated;
  }

  addAfternoonshift(Email, APassword, SchoolName, UserName) async {
    CollectionReference Aftershift =
        FirebaseFirestore.instance.collection("Afternoonshift");
    //for hashing
    var randompass = Random().nextInt(10000) + 10000000000000000;
    await FirebaseAuth.instance.currentUser!
        .updatePassword(APassword.toString());
    String stringValue = randompass.toString();
    var digest = sha1.convert(utf8.encode(stringValue)).toString();
    await FirebaseFirestore.instance
        .collection("Afternoonshift")
        .doc(FirebaseAuth.instance.currentUser!.uid.toString())
        .set({"Password": digest.toString()}, SetOptions(merge: true));
    //end of hashing
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: Email, password: digest)
        .then((value) {
      Aftershift.doc(value.user!.uid.toString()).set({
        'Email': Email,
        'Password': APassword,
        'SchoolName': SchoolName,
        'UserName': UserName,
      });
      FirebaseFirestore.instance.collection("Users").doc(value.user!.uid).set({
        "Email": Email,
        "userId": value.user!.uid.toString(),
        "userRole": "Afternoonshift"
      });
    });
  }
} //End of class
