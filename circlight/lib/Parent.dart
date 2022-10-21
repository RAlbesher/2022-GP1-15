//import 'package:cool_alert/cool_alert.dart';

//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:adobe_xd/adobe_xd.dart';
//import 'package:flutter/src/widgets/framework.dart';

class Parent {
  String Name = " "; //

  String Email = ""; //

  String PUserName = " "; //
  String PNationalID; //

  String PNationality = " "; //
  String PJobTitle = " "; //
  String PPhoneNumber = ""; //
  String PAltPhoneNumber = ""; //
  String PRelativeRelation = "";

  Parent(
      {required this.Name,
      required this.Email,
      required this.PUserName,
      required this.PNationalID,
      required this.PJobTitle,
      required this.PPhoneNumber,
      required this.PAltPhoneNumber,
      required this.PNationality,
      required this.PRelativeRelation});

  UpdateParent(DocId, Name, UserName, Email, NationalID, Nationality, JobTitle,
      Phone, AltPhone, PRelativeRelation) async {
    CollectionReference Parents =
        FirebaseFirestore.instance.collection("Parent");
    await Parents.doc(DocId).set({
      'Name': Name,
      'UserName': UserName,
      'Email': Email,
      'NationalID': NationalID,
      'Password': NationalID,
      'PhoneNumber': Phone,
      'AltPhoneNumber': AltPhone,
      'Nationality': Nationality,
      'JobTitle': JobTitle,
      'LateStatus': false,
      "RelativeRelation": PRelativeRelation
    });
  }

  addParent(PN, PUserName, Email, PID, ParenPhoneNo, AltPhoneNum, Nationality,
      JobT, PRelativeRelation) async {
    final userRef = await FirebaseFirestore.instance.collection("Parent");

    userRef.add({
      'Name': PN,
      'UserName': PUserName,
      'Email': Email,
      'NationalID': PID,
      'Password': PID,
      'PhoneNumber': ParenPhoneNo,
      'AltPhoneNumber': AltPhoneNum,
      'Nationality': Nationality,
      'JobTitle': JobT,
      'LateStatus': false,
      "RelativeRelation": PRelativeRelation,
    });
  }
/*
  addStudent() {
    final userRef = FirebaseFirestore.instance.collection("Parent");
    userRef.doc().collection("Studet").add({
      "BloodType": "lamaalmajhad",
      "Class": "lamaalmajhad@outlook.com",
      "Name": "lama school",
      "Nationality": "False",
      "StudentID": "first student",
      "UserName": "سعودي",
    });
  }

*/
}//END OF CLASS
