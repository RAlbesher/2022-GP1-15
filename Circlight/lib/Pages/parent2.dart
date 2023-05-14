import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:encryptor/encryptor.dart';

class parent2 {
  String Name = " "; //

  String Email = ""; //

  String PUserName = " "; //
  String PNationalID; //

  String PNationality = " "; //
  String PJobTitle = " "; //
  String PPhoneNumber = ""; //
  String PAltPhoneNumber = ""; //
  String PRelativeRelation = "";
  String Password = "";
  String State = "";
  bool? PfirstTime = true;
  List<String> search = [];
  parent2({
    required this.Name,
    required this.Email,
    required this.PUserName,
    required this.PNationalID,
    required this.PJobTitle,
    required this.PPhoneNumber,
    required this.PAltPhoneNumber,
    required this.PNationality,
    required this.PRelativeRelation,
    required this.Password,
    required this.State,
    this.PfirstTime,
  });

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

      case "State":
        await Parents.doc(DocId).update({
          'State': Updated,
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
    // Parents.add({
    //   'Name': PN,comment all this
    //   'UserName': PUserName,
    //   'Email': Email,
    //   'NationalID': PID,
    //   'Password': digest,
    //   'PhoneNumber': ParenPhoneNo,
    //   'AltPhoneNumber': AltPhoneNum,
    //   'Nationality': Nationality,
    //   'JobTitle': JobT,
    //   'LateStatus': false,
    //   "RelativeRelation": PRelativeRelation,
    //   'Search': search,
    //   'PfirstTime': false,
    // });
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: Email, password: randompass)
        .then((value) => Parents.doc(value.user!.uid.toString()).set({
              'Name': PN,
              'UserName': PUserName,
              'Email': Email,
              'NationalID': PID,
              'Password': randompass,
              'PhoneNumber': ParenPhoneNo,
              'AltPhoneNumber': AltPhoneNum,
              'Nationality': Nationality,
              'JobTitle': JobT,
              'LateStatus': false,
              "RelativeRelation": PRelativeRelation,
              'Search': search,
              'PfirstTime': false,
            }));
    //end of hashing
  }

// to delete the students
  DeleteParent(String DocId) async {
    CollectionReference Parents =
        FirebaseFirestore.instance.collection("Parent");
    await Parents.doc(DocId).delete();
  }
} //END OF CLASS
