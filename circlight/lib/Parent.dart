//import 'package:cool_alert/cool_alert.dart';

//import 'package:firebase_core/firebase_core.dart';
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
}//END OF CLASS
