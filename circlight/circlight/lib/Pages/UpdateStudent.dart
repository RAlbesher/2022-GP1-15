//import 'dart:html';

//import 'package:circlight/ReadData.dart';
//import 'package:circlight/ReadData.dart';
import 'dart:convert';

import 'package:circlight/Pages/Student.dart';

///import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
////import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import 'package:adobe_xd/adobe_xd.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:circlight/Pages/create_parent_profile.dart';
import 'package:firebase_core/firebase_core.dart' show Firebase;
import 'firebase_options.dart';
import 'package:flutter/src/widgets/framework.dart';

class UpdateStudent extends StatefulWidget {
  final String documentId;

  const UpdateStudent({super.key, required this.documentId});

  @override
  State<UpdateStudent> createState() => _UpdateStudent();
}

class _UpdateStudent extends State<UpdateStudent> {
  final formKey = GlobalKey<FormState>();
  // final userRef = FirebaseFirestore.instance;
  Student Studentx = new Student(
    Name: "",
    StudentID: "",
    Class: "",
    SNationalID: "",
    SNationality: "",
    SUserName: "",
    SBloodType: "",
  );
  CollectionReference Students =
      FirebaseFirestore.instance.collection("Student");
  // final ParentRef = FirebaseFirestore.instance;
  List<String> docIDs = [];

  TextEditingController StudentName = TextEditingController();
  TextEditingController StudID = TextEditingController();
  TextEditingController SClass = TextEditingController();
  TextEditingController STNationalID = TextEditingController();
  TextEditingController STNationality = TextEditingController();
  TextEditingController STUserName = TextEditingController();
  TextEditingController BloodType = TextEditingController();

  String CurrentID = "";

  @override
  Widget build(BuildContext context) {
    CurrentID = widget.documentId;
    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return FutureBuilder<DocumentSnapshot>(
        future: Students.doc(CurrentID).get(),
        builder: ((context, snapshot) {
          try {
            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;
              // final String jsonString = jsonEncode(data);

              Studentx.Name = data["Name"];
              Studentx.StudentID = data["StudentID"];
              Studentx.SUserName = data["UserName"];
              Studentx.Class = data["Class"];
              Studentx.SNationalID = data["NationalID"];
              Studentx.SNationality = data["Nationality"];

              Studentx.SBloodType = data["BloodType"];
            }
          } catch (e) {
            // print("xxxxxxxxxxxxxxxxxxxxxxxx");
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
                                      "                  إنشاء حساب طالب  ",
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
                                        controller: StudentName
                                          ..text = Studentx.Name,
                                        //to take text from user input
                                        textAlign: TextAlign.right,

                                        decoration: InputDecoration(
                                            hintText: "أدخل أسم الطالب",
                                            labelText: " أسم الطالب"),
                                        validator: (value) {
                                          if (value!.isEmpty)
                                            return "أرجو منك تعبئه الحقل الفارغ ";
                                          else {
                                            return null;
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
                                        controller: STUserName
                                          ..text = Studentx.SUserName,
                                        //to take text from user input
                                        textAlign: TextAlign.right,

                                        decoration: InputDecoration(
                                            hintText: " أدخل اسم المستخدم",
                                            labelText: "اسم المستخدم"),
                                        validator: (value) {
                                          if (value!.isEmpty)
                                            return "أرجو منك تعبئه الحقل الفارغ ";
                                          else {
                                            return null;
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
                                        controller: StudID
                                          ..text = Studentx.StudentID,
                                        //to take text from user input
                                        textAlign: TextAlign.right,

                                        decoration: InputDecoration(
                                            hintText:
                                                "أدخل الرقم التعريفي للطالب",
                                            labelText: "الرقم التعريفي"),
                                        validator: (value) {
                                          if (value!.isEmpty ||
                                              !RegExp(r'^[0-9]{10}$')
                                                  .hasMatch(value!))
                                            return "أرجو منك تعبئه الحقل بطريقه صحيحه حيث يتكون من 10 ارقام";
                                          else {
                                            return null;
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
                                        controller: SClass
                                          ..text = Studentx.Class,
                                        //to take text from user input
                                        textAlign: TextAlign.right,

                                        decoration: InputDecoration(
                                            hintText: "أدخل رقم صف الطالب",
                                            labelText: "صف الطالب"),
                                        validator: (value) {
                                          if (value!.isEmpty ||
                                              !RegExp(r'^[0-9]{1}$')
                                                  .hasMatch(value!))
                                            return "الصف يجب أن يكون رقم واحد فقط";
                                          else {
                                            return null;
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
                                        controller: STNationalID
                                          ..text = Studentx.SNationalID,
                                        //to take text from user input
                                        textAlign: TextAlign.right,

                                        decoration: InputDecoration(
                                            hintText: "أدخل رقم الهوية/الإقامة",
                                            labelText: " رقم الهوية/الإقامة"),
                                        validator: (value) {
                                          if (value!.isEmpty ||
                                              !RegExp(r'^[0-9]{10}$')
                                                  .hasMatch(value!))
                                            return "أرجو منك تعبئه الحقل بطريقه صحيحه حيث يتكون من 10 ارقام";
                                          else {
                                            return null;
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
                                        controller: STNationality
                                          ..text = Studentx.SNationality,
                                        //to take text from user input
                                        textAlign: TextAlign.right,

                                        decoration: InputDecoration(
                                            hintText: "ماهي جنسيتك؟",
                                            labelText: "الجنسية"),
                                        validator: (value) {
                                          if (value!.isEmpty)
                                            return "أرجو منك تعبئه الحقل الفارغ ";
                                          else {
                                            return null;
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
                                        controller: BloodType
                                          ..text = Studentx.SBloodType,
                                        //to take text from user input
                                        textAlign: TextAlign.right,

                                        decoration: InputDecoration(
                                            hintText: "ماهي فصيلة دم الطالب؟",
                                            labelText: " فصيلة دم الطالب"),
                                        validator: (value) {
                                          if (value!.isEmpty)
                                            return "أرجو منك تعبئه الحقل الفارغ ";
                                          else {
                                            var Blood = [
                                              "O+",
                                              "A+",
                                              "B+",
                                              "AB+",
                                              "O-",
                                              "A-",
                                              "B-",
                                              "AB-"
                                            ];
                                            var hasFound = false;
                                            for (var i = 0;
                                                i < Blood.length;
                                                i++) {
                                              if (Blood[i] == value) {
                                                hasFound = true;
                                                break;
                                              }
                                            }
                                            if (!hasFound) {
                                              return "أرجو منك تعبئة فصيلة الدم بشكل صحيح   ";
                                            } else {
                                              return null;
                                            }
                                          }
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.05,
                                    ),
                                    Container(
                                      child: Align(
                                          alignment: Alignment.center,
                                          child: ElevatedButton(
                                            child:
                                                Text("          تحديث        "),
                                            onPressed: () async {
                                              if (formKey.currentState!
                                                  .validate()) {
                                                // UpdateStudent(
                                                //                     Class, SBloodType) async {
                                                await Studentx.UpdateStudent(
                                                    CurrentID,
                                                    StudentName.text,
                                                    StudID.text,
                                                    STUserName.text,
                                                    STNationalID.text,
                                                    STNationality.text,
                                                    SClass.text,
                                                    BloodType.text);
                                                showCupertinoDialog(
                                                    context: context,
                                                    builder: CreateDialog);
                                              }
                                            },
                                            style: ElevatedButton.styleFrom(
                                              primary: Color.fromARGB(
                                                  255, 54, 165, 244),
                                              onPrimary: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(32.0),
                                              ),
                                            ),
                                          )),
                                    )
                                    /*
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
                                    )*/
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

  Widget CreateDialog(BuildContext context) => CupertinoAlertDialog(
        title: Text("تحديث معلومات الطالب", style: TextStyle(fontSize: 18)),
        content: Text(
          "تم تحديث المعلومات بنجاح",
          style: TextStyle(fontSize: 14),
        ),
        actions: [
          CupertinoDialogAction(
            child: Text("OK"),
            onPressed: () => Navigator.pop(context),
          )
        ],
      );
}
