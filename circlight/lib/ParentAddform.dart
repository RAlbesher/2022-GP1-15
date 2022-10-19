import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'firebase_options.dart';
import 'package:cool_alert/cool_alert.dart';

class ParentAddform extends StatefulWidget {
  @override
  _ParentAddFormState createState() => _ParentAddFormState();
}

class _ParentAddFormState extends State<ParentAddform> {
  final formKey = GlobalKey<FormState>(); //key for form
  String name = "";
  TextEditingController parentName = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController IDNo = TextEditingController();
  TextEditingController nationality = TextEditingController();
  TextEditingController jobTitle = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController altphoneNumber = TextEditingController();

  final userRef = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
                  Text(
                    "                           إنشاء حساب ولي الامر ",
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 20, color: Color(0xFF363F93)),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextFormField(
                      //to take text from user input
                      controller: parentName,
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(labelText: "اسم ولي الامر"),

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
                      controller: username,
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(labelText: "اسم المستخدم"),
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
                      controller: email,
                      textAlign: TextAlign.right,
                      decoration:
                          InputDecoration(labelText: "البريد الالكتروني"),
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
                      //to take text from user input
                      controller: IDNo,
                      textAlign: TextAlign.right,
                      decoration:
                          InputDecoration(labelText: "رقم الهوية /الإقامة"),
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
                      controller: nationality,
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(labelText: "الجنسية"),
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
                      controller: jobTitle,
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(labelText: "الوظيفة "),
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
                      controller: phoneNumber,
                      textAlign: TextAlign.right,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(labelText: "رقم الجوال"),
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
                    child: TextFormField(
                      //to take text from user input
                      controller: altphoneNumber,
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        labelText: "رقم جوال قريب ",
                      ),
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
                  Container(
                    child: Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          child: Text("          إضافه        "),
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              await addParent();
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

  addParent() async {
    await userRef.collection("Parent").add({
      'Name': parentName.text,
      'Username': username.text,
      'Email': email.text,
      'NationalID': IDNo.text,
      'Password': IDNo.text,
      'PhoneNumber': phoneNumber.text,
      'AltPhoneNumber': altphoneNumber.text,
      'Nationality': nationality.text,
      'JobTitle': jobTitle.text,
      'LateStatus': false,
    });
    CoolAlert.show(
      context: context,
      type: CoolAlertType.success,
      text: "لقد تمت عمليه الاضافه بنجاح ",
    );
  }
}
/*

addStudent(colID) {
  final userRef = FirebaseFirestore.instance.collection("Parent");
  userRef.doc(colID).collection("Studet").add({
    "BloodType": "lamaalmajhad",
    "Class": "lamaalmajhad@outlook.com",
    "Name": "lama school",
    "Nationality": "False",
    "StudentID": "first student",
    "UserName": "سعودي",
  });
}*/
