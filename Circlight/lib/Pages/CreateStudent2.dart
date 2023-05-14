import 'package:circlight/Pages/editStudent.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:circlight/Pages/header_widget.dart';
import 'Nav.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'Parent.dart';
import 'constants.dart';
import 'displayParent.dart';
import 'dart:math';
import 'package:share_plus/share_plus.dart';
import 'package:country_picker/country_picker.dart';

import 'package:circlight/Pages/ListRequest.dart';
import 'package:circlight/Pages/Nav.dart';
import 'package:circlight/Pages/NavParent.dart';
import 'package:circlight/Pages/Request.dart';
import 'package:circlight/Pages/RequestDelegator.dart';
import 'package:circlight/Pages/Student.dart';
import 'package:circlight/Pages/constants.dart';

import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui' as ui;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '../storage_service.dart';
import 'AdminPRequest.dart';

class CreateStudent2 extends StatefulWidget {
  var index;
  var Blood;
  var Class;
  var Name;
  var username;
  var SID;
  var ID;
  var nationality;
  var phone1;
  var phone2;
  var job;
  var documentId;
  var header;

  CreateStudent2(
      {super.key,
      this.index,
      this.Class,
      this.Blood,
      this.ID,
      this.Name,
      this.username,
      this.SID,
      this.nationality,
      this.job,
      required this.documentId,
      this.header});

  @override
  State<CreateStudent2> createState() => _CreateStudent2();
}

class _CreateStudent2 extends State<CreateStudent2>
    with TickerProviderStateMixin {
  final Relation = ["-", "أم", "أب", "أخت", "أخ", "خالة", "خال", "عمة", "عم"];

  TextEditingController? emailAddressController1;
  TextEditingController? emailAddressController2;
  TextEditingController? emailAddressController3;

  final _unfocusNode = FocusNode();
  final firebase_storage.FirebaseStorage storage2 =
      firebase_storage.FirebaseStorage.instance;
  TextEditingController studentName = TextEditingController();
  TextEditingController Studentusername = TextEditingController();
  TextEditingController StudentIDNo = TextEditingController();
  TextEditingController StudentNationality = TextEditingController();
  TextEditingController StudentNationalID = TextEditingController();
  TextEditingController Studentclass = TextEditingController();
  TextEditingController StudentBloodType = TextEditingController();

  List<String> listStudentName = [];
  List<String> listStudentId = [];
  List<String> NamesArray = [];
  var ErrorColor = true;
  bool isSTWrong = false;
  bool isSTCorrect = false;
  Student Studentx = new Student(
    Name: "",
    Class: "",
    SNationalID: "",
    SNationality: "",
    SUserName: "",
    SBloodType: "",
  );
  var ChoosenNames = [];
  var fileName;
  var path;
  var k = Random().nextInt(10000) + 10000000000000000;
  late String Numvalue = "-";
  final ClassNum = ["-", "1", "2", "3", "4", "5", "6"];
  final Blood = ["-", "O+", "A+", "B+", "AB+", "O-", "A-", "B-", "AB-"];
  late var blood = "-";
  bool isWrong = false;
  List<String> SIDArray = [];
  String DelegationNames = "";
  bool isCorrect = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController emailEditingController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _Name2 = TextEditingController();
  TextEditingController StudentUsername = TextEditingController();
  TextEditingController _Title = TextEditingController();
  late TextEditingController controller;
  var Url;
  bool Other = false;
  bool onError = false;
  var Type2;
  bool showFile = false;
  int Index = 0;
  var STID = "";

  late FixedExtentScrollController scrollController;
  late String value = "-";
  //var ParentID = firebaseAuth.currentUser.uid;
  // var ParentID = FirebaseAuth.instance.currentUser!.uid;
  var ParentID = "G2tniHX0FfIB7dQWV616";
  var FileNa = "";
  var StratIndex;
  var CC = 0;
  final Reason = ["-", "غياب", "ظرف صحي", "أخرى"];
  int _changedNumber = 0;
  var StName;
  int _selectedNumber = 1;
  TextEditingController _Name = TextEditingController();
  var FileName = [];
  List<String> UsernameList = [];
  Future GetStudents() async {
    await FirebaseFirestore.instance.collection("Student").get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            //DelegatorList.add(document["UserName"]);
            UsernameList.add(document["UserName"]);
          }),
        );
  }

  bool isshowadd = true;

  List<String> docUserName = [];
  Future getUserName() async {
    await FirebaseFirestore.instance.collection("Parent").get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            docUserName.add(document["UserName"]);
            print(document["UserName"]);
          }),
        );
  }

  int NumIndex = 0;
  var isAdded = true;
  final Storage storage = Storage();
  var AdminID = "nXEWTcyL1hhilCZGWhO6rEmVGFt1";
  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: Reason[Index]);
    scrollController = FixedExtentScrollController(initialItem: Index);
    emailAddressController1 = TextEditingController();
    emailAddressController2 = TextEditingController();
    //  controller = TextEditingController(text: Relation[Index]);
    controller = TextEditingController(text: ClassNum[NumIndex]);

    emailAddressController3 = TextEditingController();
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    emailAddressController1?.dispose();
    emailAddressController2?.dispose();
    emailAddressController3?.dispose();
    super.dispose();
  }

  var PID = "G2tniHX0FfIB7dQWV616";
  final _key = GlobalKey<FormState>();
  final key2 = GlobalKey<FormState>();
  final key3 = GlobalKey<FormState>();
  final key4 = GlobalKey<FormState>();
  final key5 = GlobalKey<FormState>();
  final key6 = GlobalKey<FormState>();
  final key7 = GlobalKey<FormState>();
  final key8 = GlobalKey<FormState>();

  Parent parentx = new Parent(
      Name: "",
      Email: "",
      PUserName: "",
      PNationalID: "",
      PJobTitle: "",
      PPhoneNumber: "",
      PAltPhoneNumber: "",
      PNationality: "",
      Password: "",
      PRelativeRelation: "");
  List<String> docEmails = [];
  Future getEmail() async {
    await FirebaseFirestore.instance.collection("Parent").get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            // print(document["Email"]);
            docEmails.add(document["Email"]);
          }),
        );
  }

  Request ReqParent2 = new Request(
      Type: "", Content: "", Date: "", ParentID: "", Title: "", Status: "");
  Future getParentsList(PID) async {
    listStudentName.clear();

    await FirebaseFirestore.instance.collection("Student").get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            if (document["ParentId"] == PID) {
              // print(document.reference.id);
              // print("parentids are${listParentId}");
              // print("pppppppppppppppppppppppp");
              // print(document["Name"]);
              listStudentName.add(document["Name"]);
            }
          }),
        );
  }

  bool issahre = false;

  @override
  Widget build(BuildContext context) {
    GetStudents();
    if (CC == 0) {
      getParentsList("G2tniHX0FfIB7dQWV616");
    }
    CC += 1;
    getUserName();
    getEmail();
    print("&YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY");
    print(ParentID);
    return Scaffold(
      extendBodyBehindAppBar: true,
      key: scaffoldKey,
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        // backgroundColor: Color(0x44000000),
        title: Text(
          "",
          textAlign: TextAlign.start,
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => Nav(
                            TabValue: 21,
                            documentId: widget.documentId,
                          )));
            },
            icon: Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.white,
            ),
            color: Color.fromARGB(255, 202, 21, 21),
          ),
        ],
      ),
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 180,
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/images/formbackground.png',
                            width: double.infinity,
                            height: 180,
                            fit: BoxFit.cover,
                          ),
                          Align(
                            alignment: AlignmentDirectional(-0.06, 0.77),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 12, 0, 0),
                              child: Text(
                                "إنشاء معلومات الطالب",
                                style: FlutterFlowTheme.of(context)
                                    .bodyText2
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                      fontSize: 22,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.86, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                            child: Text(
                              ' ',
                              style: FlutterFlowTheme.of(context).bodyText2,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Form(
                      key: _key,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                        child: ListView(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: [
                            Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 20, right: 20, top: 0, bottom: 0),
                                  child: Stack(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(bottom: 20),
                                        child: Directionality(
                                            textDirection: ui.TextDirection.rtl,
                                            child: TextFormField(
                                              controller: studentName,
                                              onChanged: (value) {
                                                //  _key.currentState?.validate();
                                              },
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      139, 46, 41, 95),
                                                  fontSize: 14),
                                              decoration: InputDecoration(
                                                prefixIcon: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 12,
                                                          right: 28,
                                                          left: 5),
                                                  child: Column(children: [
                                                    Image.asset(
                                                      "assets/icons/name.png",
                                                      width: 20,
                                                      height: 20,
                                                      color: Color.fromARGB(
                                                          139, 46, 41, 95),
                                                    )
                                                  ]),
                                                ),
                                                alignLabelWithHint: true,
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.never,
                                                contentPadding:
                                                    EdgeInsets.fromLTRB(
                                                        30, 5, 10, 5),
                                                labelText: "أدخل أسم الطالب",
                                                labelStyle: TextStyle(
                                                    color: Color(0xFF2E295F),
                                                    fontSize: 14),
                                                hintText: " اسم الطالب ",
                                                hintStyle: TextStyle(
                                                    color: Colors.grey.shade400,
                                                    fontSize: 14),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color.fromARGB(
                                                        139, 46, 41, 95),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                  borderSide: BorderSide(
                                                    color: Color(0xFF2E295F),
                                                    width: 0.5,
                                                  ),
                                                ),
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color.fromARGB(
                                                        139, 46, 41, 95),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                              ),
                                              validator: (value) {
                                                if (value!.isEmpty)
                                                  return "أرجو منك تعبئه الحقل الفارغ ";
                                                else {
                                                  return null;
                                                }
                                              },
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Form(
                      key: key2,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                                left: 20, right: 20, top: 0, bottom: 0),
                            child: Stack(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(bottom: 20),
                                  child: Directionality(
                                      textDirection: ui.TextDirection.rtl,
                                      child: TextFormField(
                                        onChanged: (val) =>
                                            key2.currentState?.validate(),
                                        controller: Studentusername,
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(139, 46, 41, 95),
                                            fontSize: 14),
                                        decoration: InputDecoration(
                                          prefixIcon: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 12, right: 28, left: 5),
                                            child: Column(children: [
                                              Icon(
                                                Icons.person,
                                                size: 22,
                                                color: Color.fromARGB(
                                                    139, 46, 41, 95),
                                              ),
                                            ]),
                                          ),
                                          alignLabelWithHint: true,
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.never,
                                          contentPadding:
                                              EdgeInsets.fromLTRB(30, 5, 10, 5),
                                          labelText: "اسم المستخدم",
                                          labelStyle: TextStyle(
                                              color: Color(0xFF2E295F),
                                              fontSize: 14),
                                          hintText: " أدخل اسم المستخدم",
                                          hintStyle: TextStyle(
                                              color: Colors.grey.shade400,
                                              fontSize: 14),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  139, 46, 41, 95),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            borderSide: BorderSide(
                                              color: Color(0xFF2E295F),
                                              width: 0.5,
                                            ),
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  139, 46, 41, 95),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty)
                                            return "أرجو منك تعبئه الحقل الفارغ ";
                                          else {
                                            for (var i = 0;
                                                i < docUserName.length;
                                                i++) {
                                              if (value == docUserName[i]) {
                                                return "اسم المستخدم مستخدم مسبقا ";
                                              }
                                            }
                                            return null;
                                          }
                                        },
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    Form(
                      key: key6,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                                left: 20, right: 20, top: 0, bottom: 0),
                            child: Stack(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(bottom: 0),
                                  child: Directionality(
                                    textDirection: ui.TextDirection.rtl,
                                    child: TextFormField(
                                      onChanged: (val) =>
                                          key6.currentState?.validate(),
                                      controller: StudentNationalID,
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(139, 46, 41, 95),
                                          fontSize: 14),
                                      maxLength: 10,
                                      decoration: InputDecoration(
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 12, right: 28, left: 5),
                                          child: Column(children: [
                                            Image.asset(
                                              "assets/icons/ID.png",
                                              width: 15,
                                              height: 15,
                                              color: Color.fromARGB(
                                                  139, 46, 41, 95),
                                            ),
                                          ]),
                                        ),
                                        alignLabelWithHint: true,
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.never,
                                        contentPadding:
                                            EdgeInsets.fromLTRB(30, 5, 10, 5),
                                        labelText: "رقم الهوية /الإقامة",
                                        labelStyle: TextStyle(
                                            color: Color(0xFF2E295F),
                                            fontSize: 14),
                                        hintText: "أدخل رقم الهوية /الإقامة",
                                        hintStyle: TextStyle(
                                            color: Colors.grey.shade400,
                                            fontSize: 14),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color:
                                                Color.fromARGB(139, 46, 41, 95),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          borderSide: BorderSide(
                                            color: Color(0xFF2E295F),
                                            width: 0.5,
                                          ),
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color:
                                                Color.fromARGB(139, 46, 41, 95),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                      ),
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
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Form(
                      key: key7,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                                left: 20, right: 20, top: 0, bottom: 0),
                            child: Stack(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(bottom: 0),
                                  child: Directionality(
                                    textDirection: ui.TextDirection.rtl,
                                    child: TextFormField(
                                      onTap: () {
                                        showCountryPicker(
                                          exclude: [""],
                                          context: context,
                                          showPhoneCode:
                                              false, // optional. Shows phone code before the country name.
                                          onSelect: (Country country) {
                                            StudentNationality.text = country
                                                .displayNameNoCountryCode;
                                            print(
                                                'Select country: ${country.displayName}');
                                          },
                                        );
                                      },
                                      readOnly: true,
                                      onChanged: (val) =>
                                          key7.currentState?.validate(),
                                      controller: StudentNationality,
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(139, 46, 41, 95),
                                          fontSize: 14),
                                      decoration: InputDecoration(
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 12, right: 28, left: 5),
                                          child: Column(children: [
                                            Image.asset(
                                              "assets/icons/Nationality.png",
                                              width: 15,
                                              height: 15,
                                              color: Color.fromARGB(
                                                  139, 46, 41, 95),
                                            ),
                                          ]),
                                        ),
                                        alignLabelWithHint: true,
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.never,
                                        contentPadding:
                                            EdgeInsets.fromLTRB(30, 5, 10, 5),
                                        labelText: "الجنسية",
                                        labelStyle: TextStyle(
                                            color: Color(0xFF2E295F),
                                            fontSize: 14),
                                        hintText: "ماهي جنسيتك؟",
                                        hintStyle: TextStyle(
                                            color: Colors.grey.shade400,
                                            fontSize: 14),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color:
                                                Color.fromARGB(139, 46, 41, 95),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          borderSide: BorderSide(
                                            color: Color(0xFF2E295F),
                                            width: 0.5,
                                          ),
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color:
                                                Color.fromARGB(139, 46, 41, 95),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty)
                                          return "أرجو منك تعبئه الحقل الفارغ ";
                                        else {
                                          return null;
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    ///
                    ///
                    ///
                    ///
                    ///
                    Center(
                      child: new Wrap(
                          spacing: 5.0,
                          runSpacing: 5.0,
                          direction:
                              Axis.vertical, // main axis (rows or columns)
                          children: <Widget>[
                            CupertinoButton(
                              child: Expanded(
                                child: Container(
                                  width: 360,
                                  margin: EdgeInsets.only(right: 0),
                                  // padding:
                                  //width: 300,
                                  // padding: EdgeInsets.only(right: 4),
                                  //   EdgeInsets.symmetric(horizontal: 120),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                      color: ErrorColor
                                          ? Color.fromARGB(139, 46, 41, 95)
                                          : Color.fromARGB(255, 221, 62, 51),
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(18)),
                                  ),
                                  alignment: Alignment.center,
                                  child: Flexible(
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          child: Row(
                                            children: <Widget>[
                                              SizedBox(
                                                width: 9,
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                // padding: EdgeInsets.only(right: 4),
                                                child: Positioned(
                                                  left: 0,
                                                  child: Icon(
                                                    Icons
                                                        .arrow_circle_down_rounded,
                                                    // Icons.arrow_downward_outlined,
                                                    color: Color.fromARGB(
                                                        139, 46, 41, 95),
                                                    size: 16,
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Container(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  padding: EdgeInsets.only(
                                                      left: 0,
                                                      top: 11,
                                                      bottom: 11),
                                                  width: 22,

                                                  //  padding: EdgeInsets.only(right: 120),
                                                  child: Text(
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Color.fromARGB(
                                                            139, 46, 41, 95)),
                                                    Numvalue,
                                                    maxLines: 2,
                                                    // textAlign: TextAlign.left,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 200,
                                              ),
                                              Row(children: [
                                                Text(
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 17,
                                                      color: Color.fromARGB(
                                                          139, 46, 41, 95)),
                                                  'صف الطالب',
                                                  maxLines: 2,
                                                  textAlign: TextAlign.right,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Image.asset(
                                                    "assets/icons/Class.png",
                                                    width: 15,
                                                    height: 15,
                                                    color: Color.fromARGB(
                                                        139, 46, 41, 95)),
                                              ]),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Container(
                                        height: 200.0,
                                        color: Colors.white,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            CupertinoButton(
                                              child: Text(
                                                "إلغاء",
                                                style: GoogleFonts.poppins(
                                                  fontSize: 17,
                                                  color: Color(0xffA7A7A7),
                                                ),
                                              ),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                            Expanded(
                                              child: CupertinoPicker(
                                                scrollController:
                                                    scrollController,
                                                looping: false,
                                                itemExtent: 64,
                                                backgroundColor: Colors.white,
                                                onSelectedItemChanged: (index) {
                                                  print(index);

                                                  widget.index = index;
                                                  print(widget.index);
                                                  final item =
                                                      ClassNum[widget.index];
                                                  widget.index = index;
                                                  controller.text = item;
                                                  Numvalue = item;
                                                },
                                                children: ClassNum.map(
                                                    (item) => Center(
                                                            child: Text(
                                                          item,
                                                          style: TextStyle(
                                                              fontSize: 20),
                                                        ))).toList(),
                                              ),
                                            ),
                                            CupertinoButton(
                                              child: Text("موافق",
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 17,
                                                      color: const Color(
                                                          0xff0da6c2))),
                                              onPressed: () {
                                                scrollController =
                                                    FixedExtentScrollController(
                                                        initialItem:
                                                            _changedNumber);
                                                //scrollController.dispose();
                                                setState(() {
                                                  _selectedNumber =
                                                      _changedNumber;
                                                });
                                                Navigator.pop(context);
                                                /*  parentx.UpdateParent(
                                              widget.documentId,
                                              "RelativeRelation",
                                              value);*/
                                              },
                                            ),
                                          ],
                                        ),
                                      );
                                    });
                              },
                            ),
                          ]),
                    ),

                    ///
                    ///
                    ///
                    ///
                    ///
                    ///
                    ///
                    ///
                    ///
                    ///
                    Center(
                      child: new Wrap(
                          spacing: 5.0,
                          runSpacing: 5.0,
                          direction:
                              Axis.vertical, // main axis (rows or columns)
                          children: <Widget>[
                            CupertinoButton(
                              child: Expanded(
                                child: Container(
                                  width: 360,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                      color: ErrorColor
                                          ? Color.fromARGB(139, 46, 41, 95)
                                          : Color.fromARGB(255, 221, 62, 51),
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(18)),
                                  ),
                                  alignment: Alignment.center,
                                  child: Flexible(
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          child: Row(
                                            children: <Widget>[
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                padding:
                                                    EdgeInsets.only(right: 4),
                                                child: Positioned(
                                                  left: 0,
                                                  child: Icon(
                                                    Icons
                                                        .arrow_circle_down_rounded,
                                                    // Icons.arrow_downward_outlined,
                                                    color: Color.fromARGB(
                                                        139, 46, 41, 95),
                                                    size: 16,
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  padding: EdgeInsets.only(
                                                      right: 190,
                                                      top: 11,
                                                      bottom: 11),
                                                  child: Text(
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Color.fromARGB(
                                                          139, 46, 41, 95),
                                                    ),
                                                    blood,
                                                    maxLines: 2,
                                                    // textAlign: TextAlign.left,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 30,
                                              ),
                                              Row(children: [
                                                Text(
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 14,
                                                    color: Color.fromARGB(
                                                        139, 46, 41, 95),
                                                  ),
                                                  'فصيلة الدم ',
                                                  maxLines: 2,
                                                  textAlign: TextAlign.right,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Image.asset(
                                                  "assets/icons/Blood.png",
                                                  width: 15,
                                                  height: 15,
                                                  color: Color.fromARGB(
                                                      139, 46, 41, 95),
                                                ),
                                              ]),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Container(
                                        height: 200.0,
                                        color: Colors.white,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            CupertinoButton(
                                              child: Text("لغاء",
                                                  style: TextStyle(
                                                      color: Color(0xffA7A7A7),
                                                      fontSize: 16)),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                            Expanded(
                                              child: CupertinoPicker(
                                                scrollController:
                                                    scrollController,
                                                looping: false,
                                                itemExtent: 64,
                                                backgroundColor: Colors.white,
                                                onSelectedItemChanged: (index) {
                                                  print(index);

                                                  widget.index = index;

                                                  final item =
                                                      Blood[widget.index];
                                                  widget.index = index;
                                                  controller.text = item;
                                                  blood = item;
                                                },
                                                children:
                                                    Blood.map((item) => Center(
                                                            child: Text(
                                                          item,
                                                          style: TextStyle(
                                                              fontSize: 20),
                                                        ))).toList(),
                                              ),
                                            ),
                                            CupertinoButton(
                                              child: Text("موافق",
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 17,
                                                      color: const Color(
                                                          0xff0da6c2))),
                                              onPressed: () {
                                                scrollController =
                                                    FixedExtentScrollController(
                                                        initialItem:
                                                            _changedNumber);
                                                //scrollController.dispose();
                                                setState(() {
                                                  _selectedNumber =
                                                      _changedNumber;
                                                });
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ],
                                        ),
                                      );
                                    });
                              },
                            ),
                          ]),
                    ),

                    ///
                    ///
                    ///
                    ///

                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(22, 4, 22, 16),
                      child: FFButtonWidget(
                        onPressed: () async {
                          print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
                          _key.currentState!.validate();
                          key2.currentState!.validate();

                          key6.currentState!.validate();
                          key7.currentState!.validate();

                          if (_key.currentState!.validate()) {
                            setState(() {
                              issahre = true;
                              isshowadd = false;
                            });
                            isAdded = false;
                            var connectivityResult =
                                await (Connectivity().checkConnectivity());
                            if (connectivityResult == ConnectivityResult.wifi) {
                              await Studentx.addStudent(
                                widget.documentId,
                                studentName.text,
                                Studentusername.text,
                                StudentNationalID.text,
                                StudentNationality.text,
                                Numvalue,
                                blood,
                                "gqvxZab1CsHCgT9kZgel",
                              );

                              showCupertinoDialog(
                                  context: context, builder: CreateDialog);
                              // I am connected to a mobile network.
                            } else if (connectivityResult ==
                                ConnectivityResult.mobile) {
                              await Studentx.addStudent(
                                widget.documentId,
                                studentName.text,
                                Studentusername.text,
                                StudentNationalID.text,
                                StudentNationality.text,
                                Numvalue,
                                blood,
                                "gqvxZab1CsHCgT9kZgel",
                              );

                              showCupertinoDialog(
                                  context: context, builder: CreateDialog);

                              // I am connected to a mobile network.
                            } else {
                              await showCupertinoDialog(
                                  context: context, builder: CreateDialog6);
                            }
                          }
                        },
                        text: 'أضافة',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 40,
                          color: const Color(0xff0da6c2),
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Outfit',
                                    color: Colors.white,
                                  ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    Stack(
                      children: [],
                    ),
                    SizedBox(
                      height: 40,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget CreateDialog6(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      title: Text("عذرًا",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 18,
              color: Color.fromRGBO(31, 31, 31, 1),
              fontWeight: FontWeight.bold)),
      content: Text(
        "لا يوجد اتصال بالانترنت",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 14),
      ),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                // showno = false;
              });
            },
            child: Text("موافق",
                style: TextStyle(
                    color: const Color(0xff0da6c2),
                    fontWeight: FontWeight.bold))),
      ],
    );
  }

  Widget CreateDialog(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      title: Text("إضافة طالب",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 18,
              color: Color.fromRGBO(31, 31, 31, 1),
              fontWeight: FontWeight.bold)),
      content: Text(
        "تم إضافة المعلومات بنجاح",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 14),
      ),
      actions: <Widget>[
        TextButton(
            onPressed: () => Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (context) => Nav(
                          TabValue: 10,
                          documentId: widget.documentId,
                        ))),
            child: Text("موافق",
                style: TextStyle(
                  color: const Color(0xff0da6c2),
                  fontWeight: FontWeight.bold,
                ))),
      ],
    );
  }
}
