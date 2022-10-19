//import 'dart:html';

//import 'package:circlight/ReadData.dart';
//import 'package:circlight/ReadData.dart';
import 'dart:convert';

import 'package:circlight/Parent.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:adobe_xd/adobe_xd.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:circlight/create_parent_profile.dart';
import 'package:firebase_core/firebase_core.dart' show Firebase;
import 'firebase_options.dart';
import 'package:flutter/src/widgets/framework.dart';

class EditTry1 extends StatefulWidget {
  const EditTry1({super.key});

  @override
  State<EditTry1> createState() => _EditTry();
}

class _EditTry extends State<EditTry1> {
  final formKey = GlobalKey<FormState>();
  final userRef = FirebaseFirestore.instance;
  List<String> docIDs = [];
  TextEditingController parentName = TextEditingController();
  TextEditingController parentNationality = TextEditingController();
  TextEditingController parentEmail = TextEditingController();
  TextEditingController parentUserName = TextEditingController();
  TextEditingController ParentNationalID = TextEditingController();
  TextEditingController NationalID = TextEditingController();
  TextEditingController Nationality = TextEditingController();
  TextEditingController JobTitle = TextEditingController();
  //get docIDs
  Future getDocId() async {
    await FirebaseFirestore.instance.collection("Parent").get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            // ignore: avoid_print
            print(document.reference);
            docIDs.add(document.reference.id);
          }),
        );
  }

  @override
  Widget build(BuildContext context) {
    Parent parentx = new Parent(
        Name: "",
        Email: "",
        PUserName: "",
        PNationalID: "",
        PJobTitle: "",
        PPhoneNumber: "",
        PAltPhoneNumber: "",
        PNationality: "");

    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    CollectionReference Parents =
        FirebaseFirestore.instance.collection("Parent1");
    return FutureBuilder<DocumentSnapshot>(
        future: Parents.doc("H7P2rU79FU1e6x7MvMP1").get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            final String jsonString = jsonEncode(data);
            parentx.Name = data["Name"];

            parentx.Email = data["Email"];
            parentx.PUserName = data["UserName"];
            parentx.PNationalID = data["NationalID"];
            parentx.PNationality = data["Nationality"];
            parentx.PJobTitle = data["JobTitle"];
            parentx.PPhoneNumber = data["PhoneNumber"];
            parentx.PAltPhoneNumber = data["AltPhoneNumber"];
          }
          return Scaffold(
              key: _scaffoldKey,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              backgroundColor: Color(0xFFffffff),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: FutureBuilder(
                        future: getDocId(),
                        builder: ((context, snapshot) {
                          return Container(
                            padding: const EdgeInsets.only(left: 40, right: 40),
                            child: Form(
                              key: formKey, //key for form
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: height * 0.04),
                                    Text(
                                      "                           إنشاء حساب ولي الامر ",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color(0xFF363F93)),
                                    ),
                                    SizedBox(
                                      height: height * 0.05,
                                    ),
                                    Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: TextFormField(
                                        controller: parentName
                                          ..text = parentx.Name,
                                        //to take text from user input
                                        textAlign: TextAlign.right,

                                        decoration: InputDecoration(
                                            hintText: "أدخل اسم ولي الامر ",
                                            labelText: "اسم ولي الامر"),
                                        validator: (value) {
                                          if (value!.isEmpty)
                                            return "Please Enter a the empty fields ";
                                          else {
                                            return value;
                                          }
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.05,
                                    ),
                                    Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: TextFormField(
                                        controller: parentUserName
                                          ..text = parentx.PUserName,
                                        //to take text from user input
                                        textAlign: TextAlign.right,

                                        decoration: InputDecoration(
                                            hintText: " أدخل اسم المستخدم",
                                            labelText: "اسم المستخدم"),
                                        validator: (value) {
                                          if (value!.isEmpty)
                                            return "Please Enter a the empty fields ";
                                          else {
                                            return value;
                                          }
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.05,
                                    ),
                                    Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: TextFormField(
                                        controller: parentEmail
                                          ..text = parentx.Email,
                                        //to take text from user input
                                        textAlign: TextAlign.right,

                                        decoration: InputDecoration(
                                            hintText: "البريد الالكتروني ",
                                            labelText: "لبريد الالكتروني "),
                                        validator: (value) {
                                          if (value!.isEmpty)
                                            return "Please Enter a the empty fields ";
                                          else {
                                            return value;
                                          }
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.05,
                                    ),
                                    Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: TextFormField(
                                        controller: NationalID
                                          ..text = parentx.PNationalID,
                                        //to take text from user input
                                        textAlign: TextAlign.right,

                                        decoration: InputDecoration(
                                            hintText:
                                                "أدخل رقم الهوية/الاقامة ",
                                            labelText: "رقم الهوية/ الاقامة"),
                                        validator: (value) {
                                          if (value!.isEmpty)
                                            return "Please Enter a the empty fields ";
                                          else {
                                            return value;
                                          }
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.05,
                                    ),
                                    Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: TextFormField(
                                        controller: Nationality
                                          ..text = parentx.PNationality,
                                        //to take text from user input
                                        textAlign: TextAlign.right,

                                        decoration: InputDecoration(
                                            hintText: "الجنسية",
                                            labelText: "ماهي جنسيتك؟"),
                                        validator: (value) {
                                          if (value!.isEmpty)
                                            return "Please Enter a the empty fields ";
                                          else {
                                            return value;
                                          }
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.05,
                                    ),
                                    Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: TextFormField(
                                        controller: JobTitle
                                          ..text = parentx.PJobTitle,
                                        //to take text from user input
                                        textAlign: TextAlign.right,

                                        decoration: InputDecoration(
                                            hintText: "أدخل الوظيفة",
                                            labelText: "الوظيفة"),
                                        validator: (value) {
                                          if (value!.isEmpty)
                                            return "Please Enter a the empty fields ";
                                          else {
                                            return value;
                                          }
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.05,
                                    ),
                                    Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: TextFormField(
                                        controller: JobTitle
                                          ..text = parentx.PPhoneNumber,
                                        //to take text from user input
                                        textAlign: TextAlign.right,

                                        decoration: InputDecoration(
                                            hintText: "رقم الجوال",
                                            labelText: "أدخل رقم الجوال"),
                                        validator: (value) {
                                          if (value!.isEmpty)
                                            return "Please Enter a the empty fields ";
                                          else {
                                            return value;
                                          }
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.05,
                                    ),
                                    Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: TextFormField(
                                        controller: JobTitle
                                          ..text = parentx.PAltPhoneNumber,
                                        //to take text from user input
                                        textAlign: TextAlign.right,

                                        decoration: InputDecoration(
                                            hintText: " رقم جوال آخر",
                                            labelText: "أدخل رقم حوال آخر"),
                                        validator: (value) {
                                          if (value!.isEmpty)
                                            return "Please Enter a the empty fields ";
                                          else {
                                            return value;
                                          }
                                        },
                                      ),
                                    ),
                                    Container(
                                      child: Align(
                                          alignment: Alignment.center,
                                          child: ElevatedButton(
                                            child: Container(
                                              child: Text(
                                                  "          تحديث        "),
                                              decoration: const BoxDecoration(
                                                gradient: LinearGradient(
                                                    colors: [
                                                      Colors.purple,
                                                      Colors.green,
                                                    ],
                                                    begin: Alignment(-1, -0.7),
                                                    end: Alignment(1, 0.7)),
                                              ),
                                            ),
                                            onPressed: () async {
                                              await userRef
                                                  .collection("Parent")
                                                  .doc("1314")
                                                  .set({
                                                'Name': parentName.text
                                              });

                                              print(parentName.text);
                                            },
                                            style: ElevatedButton.styleFrom(
                                              onPrimary: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(32.0),
                                              ),
                                            ),
                                          )),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ));
        }
            // return Center(child: CircularProgressIndicator());
            ));
  }
}
