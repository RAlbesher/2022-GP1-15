import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:circlight/TryReadUpdate.dart';
import 'package:firebase_core/firebase_core.dart' show Firebase;
import 'firebase_options.dart';

class Parent {
  String Name = " "; //

  String Email = ""; //

  String PUserName = " "; //
  String PNationalID; //

  String PNationality = " "; //
  String PJobTitle = " "; //
  String PPhoneNumber = ""; //
  String PAltPhoneNumber = ""; //

  Parent(
      {required this.Name,
      required this.Email,
      required this.PUserName,
      required this.PNationalID,
      required this.PJobTitle,
      required this.PPhoneNumber,
      required this.PAltPhoneNumber,
      required this.PNationality});
  /*
  Map<String, dynamic> toJson() => {
        'Name': Name,
        'Email': Email,
        'UserName': PUserName,
        'NationalID': PNationalID,
        'Nationality': PNationality,
        'JobTitle': PJobTitle,
        'PhoneNumber': PPhoneNumber,
        'AltPhoneNumber': PAltPhoneNumber
      };*/
/*
  static Parent fromJson(Map<String, dynamic> json) => Parent(
      Name: json['Name'],
      Email: json['Email'],
      PUserName: json['UserName'],
      PNationalID: json['NationalID'],
      PNationality: json['Nationality'],
      PJobTitle: json['JobTitle'],
      PPhoneNumber: json['PhoneNumber'],
      PAltPhoneNumber: json['AltPhoneNumber']);*/

  //String DocID = "H7P2rU79FU1e6x7MvMP1";
  //ماجربت اذا تضبط ولا لا لسى؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟
  UpdateParent(DocId, parentName) async {
    final userRef = FirebaseFirestore.instance;
    await userRef
        .collection("Parent")
        .doc(DocId)
        .set({'Name': parentName.text});
  }
}//END OF CLASS
