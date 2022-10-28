import 'package:circlight/Pages/Parent.dart'; //for parent class
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:circlight/Pages/Student.dart'; //for parent class
import 'package:flutter/services.dart';
import 'firebase_options.dart';

import 'package:flutter/cupertino.dart';

class StudentAddform extends StatefulWidget {
  final String documentId;

  StudentAddform({required this.documentId});

  @override
  _StudentAddFormState createState() => _StudentAddFormState();
}

class _StudentAddFormState extends State<StudentAddform> {
  final formKey = GlobalKey<FormState>(); //key for form

  Student Studentx = new Student(
    Name: "",
    StudentID: "",
    Class: "",
    SNationalID: "",
    SNationality: "",
    SUserName: "",
    SBloodType: "",
  );
  String currentID = "";

  List<String> docIDs = [];
  TextEditingController studentName = TextEditingController();
  TextEditingController Studentusername = TextEditingController();
  TextEditingController StudentIDNo = TextEditingController();
  TextEditingController StudentNationality = TextEditingController();
  TextEditingController Studentclass = TextEditingController();
  TextEditingController StudentBloodType = TextEditingController();

  final userRef = FirebaseFirestore.instance;
  CollectionReference student =
      FirebaseFirestore.instance.collection("Student");
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    String CurrentID = widget.documentId;

    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Color(0xFFffffff),
        body: Container(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Form(
            key: formKey, //key for form
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.04),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      "                         إنشاء حساب الطالب  ",
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 20, color: Color(0xFF363F93)),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextFormField(
                      //to take text from user input
                      controller: studentName,
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                          labelText: " اسم الطالب ", hintText: " اسم الطالب "),

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
                      //to take text from user input
                      controller: Studentusername,
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                          labelText: "اسم المستخدم", hintText: "اسم المستخدم"),
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
                      //to take text from user input
                      controller: StudentIDNo,
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                          labelText: "رقم الهوية /الإقامة",
                          hintText: "رقم الهوية /الإقامة"),
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[0-9]{10}$').hasMatch(value!))
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
                      //to take text from user input
                      controller: StudentNationality,
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                          labelText: "الجنسية", hintText: "الجنسية"),
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
                      //to take text from user input
                      controller: Studentclass,
                      textAlign: TextAlign.right,

                      decoration: InputDecoration(
                          labelText: " الصف ", hintText: " الصف "),
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
                      //to take text from user input
                      controller: StudentBloodType,
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                          labelText: "فصيله الدم", hintText: "فصيله الدم"),
                      validator: (value) {
                        if (value!.isEmpty)
                          return "أرجو منك تعبئه الحقل الفارغ";
                        else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Container(
                    child: Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          child: Text("          إضافه        "),
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              await Studentx.addStudent(
                                  CurrentID,
                                  studentName.text,
                                  Studentusername.text,
                                  StudentIDNo.text,
                                  StudentNationality.text,
                                  Studentclass.text,
                                  StudentBloodType.text);

                              showCupertinoDialog(
                                  context: context, builder: CreateDialog);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 54, 165, 244),
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                          ),
                        )),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  Widget CreateDialog(BuildContext context) => CupertinoAlertDialog(
        title: Text("إضافة ولي الأمر", style: TextStyle(fontSize: 18)),
        content: Text(
          "تم إضافة المعلومات بنجاح",
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
