//import 'package:cool_alert/cool_alert.dart';

//import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:adobe_xd/adobe_xd.dart';
//import 'package:flutter/src/widgets/framework.dart';

class Student {
  String Name = " "; //

  String StudentID = ""; //

  String Class = " "; //
  String SNationalID; //

  String SNationality = " "; //
  String SUserName = " "; //
  String SBloodType = ""; //

  Student({
    required this.Name,
    required this.StudentID,
    required this.Class,
    required this.SNationalID,
    required this.SNationality,
    required this.SUserName,
    required this.SBloodType,
  });

  UpdateStudent(DocId, Name, StudentID, SUserName, SNationalID, SNationality,
      Class, SBloodType) async {
    CollectionReference StudentS =
        FirebaseFirestore.instance.collection("Student");
    await StudentS.doc(DocId).update({
      'Name': Name,
      'UserName': SUserName,
      'StudentID': StudentID,
      'NationalID': SNationalID,
      'Nationality': SNationality,
      'Class': Class,
      'BloodType': SBloodType
    });
  }

  DeleteStudent(DocId) async {
    CollectionReference Parents =
        FirebaseFirestore.instance.collection("Student");
    await Parents.doc(DocId).delete();
  }

  addStudent(
    DocId,
    Name,
    SUserName,
    StudentID,
    SNationality,
    Class,
    SBloodType,
  ) async {
    final Parents = FirebaseFirestore.instance;
    await Parents.collection("Student").doc(DocId).set({
      "ParentId": DocId,
      'Name': Name,
      'UserName': SUserName,
      'StudentID': StudentID,
      'NationalID': SNationalID,
      'Nationality': SNationality,
      'Class': Class,
      'BloodType': SBloodType
    });
  }
}//END OF CLASS
