import 'dart:convert';

import 'package:circlight/Pages/Parent.dart';
import 'package:circlight/Pages/AdminHome.dart';
import 'package:circlight/Pages/DashBoard.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart'; /////////////
import 'package:flutter/material.dart'; /////////////

import 'package:circlight/Pages/Search.dart';
import 'package:circlight/Pages/Requests.dart';

import 'package:circlight/Pages/announcement.dart';

class UpdateParent extends StatefulWidget {
  final String documentId;

  const UpdateParent({super.key, required this.documentId});

  @override
  State<UpdateParent> createState() => _UpdateParent();
}

class _UpdateParent extends State<UpdateParent> {
  final formKey = GlobalKey<FormState>();
  final userRef = FirebaseFirestore.instance;
  final Relation = ["أم", "أب", "أخت", "أخ", "خالة", "خال", "عمة", "عم"];
  String? value = "أم";

  Parent parentx = new Parent(
      Name: "",
      Email: "",
      PUserName: "",
      PNationalID: "",
      PJobTitle: "",
      PPhoneNumber: "",
      PAltPhoneNumber: "",
      PNationality: "",
      PRelativeRelation: "");
  String CurreID = "";
  CollectionReference Parents = FirebaseFirestore.instance.collection("Parent");
  final ParentRef = FirebaseFirestore.instance;
  List<String> docIDs = [];
  TextEditingController parentName = TextEditingController();
  TextEditingController parentNationality = TextEditingController();
  TextEditingController parentEmail = TextEditingController();
  TextEditingController parentUserName = TextEditingController();
  TextEditingController NationalID = TextEditingController();
  TextEditingController Nationality = TextEditingController();
  TextEditingController JobTitle = TextEditingController();
  TextEditingController Phone = TextEditingController();
  TextEditingController AltPhone = TextEditingController();
  TextEditingController RelativeRelation = TextEditingController();
  //get docIDs
  final PageStorageBucket bucket = PageStorageBucket();
  @override
  Widget build(BuildContext context) {
    String CurrentID = widget.documentId;

    int Tab = 0;
    final List<Widget> Screens = [
      Search(),
      AdminHome(),
      Requests(),
      DashBoard(),
      Announcement(),
    ];

    Widget currentScreen = Announcement();
    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return FutureBuilder<DocumentSnapshot>(
        future: Parents.doc(CurrentID).get(),
        builder: ((context, snapshot) {
          try {
            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;
              final String jsonString = jsonEncode(data);
              parentx.Name = data["Name"];
              //parentx.Name = CurrentID;
              parentx.Email = data["Email"];
              print(data["UserName"]);
              parentx.PUserName = data["UserName"];

              parentx.PNationalID = data["NationalID"];
              parentx.PNationality = data["Nationality"];
              parentx.PJobTitle = data["JobTitle"];

              parentx.PPhoneNumber = data["PhoneNumber"];

              parentx.PAltPhoneNumber = data["AltPhoneNumber"];
              parentx.PRelativeRelation = data["RelativeRelation"];
            }
          } catch (e) {
            // print("xxxxxxxxxxxxxxxxxxxxxxxx");
          }
          return Scaffold(
              key: _scaffoldKey,
              backgroundColor: Color(0xFFffffff),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: ListView(children: [
                      FutureBuilder(
                        builder: ((context, snapshot) {
                          return Container(
                            padding: const EdgeInsets.only(left: 40, right: 40),
                            child: Form(
                              key: formKey, //key for form
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: height * 0.04),
                                  Text(
                                    "                           إنشاء حساب ولي الامر ",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        fontSize: 20, color: Color(0xFF363F93)),
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
                                      controller: parentUserName
                                        ..text = parentx.PUserName,
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
                                      controller: parentEmail
                                        ..text = parentx.Email,
                                      //to take text from user input
                                      textAlign: TextAlign.right,

                                      decoration: InputDecoration(
                                          hintText: "البريد الالكتروني ",
                                          labelText: "البريد الالكتروني "),
                                      validator: (value) {
                                        if (value!.isEmpty ||
                                            !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                                .hasMatch(value!))
                                          return "أرجو منك تعبئه الحقل بطريقه صحيحه ";
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
                                      controller: NationalID
                                        ..text = parentx.PNationalID,
                                      //to take text from user input
                                      textAlign: TextAlign.right,

                                      decoration: InputDecoration(
                                          hintText: "أدخل رقم الهوية/الإقامة ",
                                          labelText: "رقم الهوية/الإقامة"),
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
                                      controller: Nationality
                                        ..text = parentx.PNationality,
                                      //to take text from user input
                                      textAlign: TextAlign.right,
                                      style:
                                          new TextStyle(color: Colors.orange),
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
                                      controller: JobTitle
                                        ..text = parentx.PJobTitle,
                                      //to take text from user input
                                      textAlign: TextAlign.right,

                                      decoration: InputDecoration(
                                          hintText: "أدخل الوظيفة",
                                          labelText: "الوظيفة"),
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
                                      controller: Phone
                                        ..text = parentx.PPhoneNumber,
                                      //to take text from user input
                                      textAlign: TextAlign.right,

                                      decoration: InputDecoration(
                                          hintText: "أدخل رقم الجوال",
                                          labelText: " رقم الجوال"),
                                      validator: (value) {
                                        if (value!.isEmpty ||
                                            !RegExp(r'^(?:[+0][1-9])?[0-9]{10,12}$')
                                                .hasMatch(value!))
                                          return "أرجو منك تعبئه الحقل بطريقه صحيحه";
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
                                    child: Container(
                                      child: Align(
                                        alignment: Alignment.bottomRight,
                                        child: TextFormField(
                                          controller: AltPhone
                                            ..text = parentx.PAltPhoneNumber,
                                          //to take text from user input
                                          textAlign: TextAlign.right,

                                          decoration: InputDecoration(
                                              hintText: " أدخل رقم جوال قريب ",
                                              labelText: " رقم جوال قريب "),
                                          validator: (value) {
                                            if (value!.isEmpty ||
                                                !RegExp(r'^(?:[+0][1-9])?[0-9]{10,12}$')
                                                    .hasMatch(value!))
                                              return "أرجو منك تعبئه الحقل بطريقه صحيحه";
                                            else {
                                              return null;
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.05,
                                  ),
                                  Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Align(
                                      alignment: Alignment.bottomRight,
                                      child: Container(
                                        width: 500,
                                        height: 58,
                                        // margin: EdgeInsets.all(40),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 4),

                                        /* decoration: BoxDecoration(
                                            
                                              border: Border.all(
                                                  color: Color.fromARGB(
                                                      255, 146, 145, 145),
                                                  width: 0.5),
                                              borderRadius:
                                                  BorderRadius.circular(8)),*/
                                        child: DropdownButtonHideUnderline(
                                          child:
                                              DropdownButtonFormField<String>(
                                            decoration: InputDecoration(
                                              labelText: "صلة القرابة",
                                              border: UnderlineInputBorder(),
                                            ),
                                            isExpanded: true,
                                            iconSize: 30,
                                            icon: Icon(Icons.arrow_drop_down,
                                                color: Color.fromARGB(
                                                    255, 157, 159, 157)),
                                            value: value,
                                            items: Relation.map(BuildMenuItem)
                                                .toList(),
                                            onChanged: (value) => setState(
                                                () => this.value = value),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.05,
                                  ),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        onSurface: Colors.transparent,
                                        shadowColor: Colors.transparent,
                                        //make color or elevated button transparent
                                      ),
                                      child: Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 10),
                                              child: Positioned(
                                                left: 0.0,
                                                child: Icon(
                                                  Icons.arrow_back_ios_outlined,
                                                  color: Color(0xffA7A7A7),
                                                  size: 16,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                padding: EdgeInsets.only(
                                                    left: 10, bottom: 10),
                                                child: Text(
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Color(0xffA7A7A7)),
                                                  'FatenAlharbi',
                                                  maxLines: 2,
                                                  textAlign: TextAlign.left,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                padding: EdgeInsets.only(
                                                    right: 10, bottom: 10),
                                                child: Text(
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Color(0xffA7A7A7)),
                                                  'اسم المستخدم',
                                                  maxLines: 2,
                                                  textAlign: TextAlign.right,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                                width: 1.0,
                                                color: Color(0xffA7A7A7)),
                                          ),
                                        ),
                                      ),
                                      onPressed: () {}),
                                  SizedBox(
                                    height: height * 0.05,
                                  ),
                                  Center(
                                    child: Container(
                                      width: 100,
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(colors: [
                                              const Color(0xff0da6c2),
                                              const Color(0xff42c98d),
                                              const Color(0xff57d77a)

                                              //add more colors
                                            ]),
                                            borderRadius:
                                                BorderRadius.circular(18),
                                            boxShadow: <BoxShadow>[
                                              BoxShadow(
                                                  color: Color.fromRGBO(0, 0, 0,
                                                      0.57), //shadow for button
                                                  blurRadius:
                                                      5) //blur radius of shadow
                                            ]),
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.transparent,
                                            onSurface: Colors.transparent,
                                            shadowColor: Colors.transparent,
                                            //make color or elevated button transparent
                                          ),
                                          onPressed: () async {
                                            if (formKey.currentState!
                                                .validate()) {
                                              // Name, UserName, Email, NationalID, Nationality, JobTitle,
                                              //  Phone, AltPhone
                                              //
                                              /*await parentx.UpdateParent(
                                                  CurrentID,
                                                  parentName.text,
                                                  parentUserName.text,
                                                  parentEmail.text,
                                                  NationalID.text,
                                                  Nationality.text,
                                                  JobTitle.text,
                                                  Phone.text,
                                                  AltPhone.text,
                                                  value);*/
                                              showCupertinoDialog(
                                                  context: context,
                                                  builder: CreateDialog);
                                              /*await parentx.DeleteParent(
                                                    "3utSRXLiFJdWE8nc2pEg");*/
                                            }
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                              top: 18,
                                              bottom: 18,
                                            ),
                                            child: Text(" تحديث "),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

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
                          );
                        }),
                      ),
                      /* Container(
                        child: Scaffold(
                          bottomNavigationBar: SizedBox(
                            height: 60,
                            child: BottomAppBar(
                              shape: const CircularNotchedRectangle(),
                              child: Container(height: 50.0),
                            ),
                          ),
                          floatingActionButton: FloatingActionButton(
                            onPressed: () {},
                            elevation: 0,
                            child: Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 6,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(90),
                                gradient: LinearGradient(
                                  colors: [
                                    const Color(0xff0da6c2),
                                    const Color(0xff42c98d),
                                    const Color(0xff57d77a)
                                  ],
                                ),
                              ),
                              child: Icon(Icons.announcement_rounded),
                            ),
                            backgroundColor: Colors.transparent,
                          ),
                          floatingActionButtonLocation:
                              FloatingActionButtonLocation.centerDocked,
                        ),
                      ),*/
                    ])),
                  ],
                ),
              ));
        }
            // return Center(child: CircularProgressIndicator());
            ));
  }

  DropdownMenuItem<String> BuildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
        ),
      );

  Widget CreateDialog(BuildContext context) => CupertinoAlertDialog(
        title: Text("تحديث معلومات ولي الأمر", style: TextStyle(fontSize: 18)),
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

/*
  UpdateParent(DocId) async {
    await Parents.doc(DocId).set({
      'Name': parentName.text,
      'UserName': parentUserName.text,
      'Email': parentEmail.text,
      'NationalID': NationalID.text,
      'Password': NationalID.text,
      'PhoneNumber': Phone.text,
      'AltPhoneNumber': AltPhone.text,
      'Nationality': Nationality.text,
      'JobTitle': JobTitle.text,
      'LateStatus': false,
    });
    CoolAlert.show(
      context: context,
      type: CoolAlertType.success,
      text: "لقد تمت عمليه التحديث بنجاح ",
    );
  }*/
}
