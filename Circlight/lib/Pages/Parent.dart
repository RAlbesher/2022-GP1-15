import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:encryptor/encryptor.dart';

class Parent {
  String Name = " "; //

  String Email = ""; //

  String PUserName = " "; //
  String PNationalID; //
  String Password;
  String PNationality = " "; //
  String PJobTitle = " "; //
  String PPhoneNumber = ""; //
  String PAltPhoneNumber = ""; //
  String PRelativeRelation = "";
  List<String> search = [];
  Parent(
      {required this.Name,
      required this.Email,
      required this.PUserName,
      required this.PNationalID,
      required this.PJobTitle,
      required this.PPhoneNumber,
      required this.PAltPhoneNumber,
      required this.PNationality,
      required this.Password,
      required this.PRelativeRelation});
  final S = ["متاح", "متأخر"];
  UpdateParent(DocId, Field, Updated) async {
    CollectionReference Parents =
        FirebaseFirestore.instance.collection("Parent");
    bool IsUpdated = false;

    switch (Field) {
      case 'Name':
        await Parents.doc(DocId).update({
          'Name': Updated,
        });
        IsUpdated = true;
        break;
      case "UserName":
        await Parents.doc(DocId).update({
          'UserName': Updated,
        });
        break;
      case "Email":
        await Parents.doc(DocId).update({
          'Email': Updated,
        });
        break;
      case "JobTitle":
        await Parents.doc(DocId).update({
          'JobTitle': Updated,
        });
        break;
      case "PhoneNumber":
        await Parents.doc(DocId).update({
          'PhoneNumber': Updated,
        });
        break;
      case "AltPhoneNumber":
        await Parents.doc(DocId).update({
          'AltPhoneNumber': Updated,
        });
        break;
      case "NationalID":
        await Parents.doc(DocId).update({
          'NationalID': Updated,
        });
        break;
      case "Nationality":
        await Parents.doc(DocId).update({
          'NationalID': Updated,
        });
        break;
      case "RelativeRelation":
        await Parents.doc(DocId).update({
          'RelativeRelation': Updated,
        });
        break;
      case "Password":
        await Parents.doc(DocId).update({
          'Password': Updated,
        });
        break;
    }
    return IsUpdated;
  }

// to add the parent in the firebase
  addParent(PN, PUserName, Email, PID, ParenPhoneNo, AltPhoneNum, Nationality,
      randompass, JobT, PRelativeRelation) async {
    for (var i = 0; i < PN.length; i++) {
      search.add(PN.substring(0, i + 1));
    }
    CollectionReference Parents =
        FirebaseFirestore.instance.collection("Parent");
    //for hashing
    String stringValue = randompass.toString();
    var digest = sha1.convert(utf8.encode(stringValue)).toString();
    //end of hashing
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: Email, password: stringValue)
        .then((value) {
      Parents.doc(value.user!.uid.toString()).set({
        'Name': PN,
        'UserName': PUserName,
        'Email': Email,
        'NationalID': PID,
        'Password': digest,
        'PhoneNumber': ParenPhoneNo,
        'AltPhoneNumber': AltPhoneNum,
        'Nationality': Nationality,
        'JobTitle': JobT,
        'LateStatus': false,
        "RelativeRelation": PRelativeRelation,
        'Search': search,
        'PfirstTime': false,
      });
      FirebaseFirestore.instance.collection("Users").doc(value.user!.uid).set({
        "Email": Email,
        "userId": value.user!.uid.toString(),
        "userRole": "parent"
      });
    });
  }

// to delete the students
  DeleteParent(String DocId) async {
    CollectionReference Parents =
        FirebaseFirestore.instance.collection("Parent");
    await Parents.doc(DocId).delete();
  }

  UpdateParState() {
    FirebaseFirestore.instance
        .collection("Parent")
        .doc(FirebaseAuth.instance.currentUser!.uid.toString())
        .set({"State": S[0]}, SetOptions(merge: true));
  }
} //END OF CLASS
