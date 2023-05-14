import 'package:circlight/Pages/ListRequest.dart';
import 'package:circlight/Pages/Nav.dart';
import 'package:circlight/Pages/NavParent.dart';
import 'package:circlight/Pages/Request.dart';
import 'package:circlight/Pages/RequestDelegator.dart';
import 'package:circlight/Pages/Student.dart';
import 'package:circlight/Pages/constants.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

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

class PRequest extends StatefulWidget {
  const PRequest({Key? key}) : super(key: key);

  @override
  _PRequest createState() => _PRequest();
}

class _PRequest extends State<PRequest> {
  TextEditingController? emailAddressController1;
  TextEditingController? emailAddressController2;
  TextEditingController? emailAddressController3;
  TextEditingController StudentName = TextEditingController();
  TextEditingController OtherController = TextEditingController();
  TextEditingController _Type = TextEditingController();
  TextEditingController Content = TextEditingController();
  final _unfocusNode = FocusNode();
  final firebase_storage.FirebaseStorage storage2 =
      firebase_storage.FirebaseStorage.instance;
  List<String> listStudentName = [];
  List<String> listStudentId = [];
  List<String> NamesArray = [];
  bool isSTWrong = false;
  bool isSTCorrect = false;
  var isPathNotNull = false;
  RequestDelegator Req = new RequestDelegator(
      DName: "",
      Dusername: "",
      isAccepted: "Waiting",
      isActive: "false",
      SID: "");
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
  var ErrorColor = true;
  bool isWrong = false;
  bool ShowAll = true;
  List<String> SIDArray = [];
  String DelegationNames = "";
  bool isCorrect = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var showErr = true;
  TextEditingController emailEditingController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _Name2 = TextEditingController();
  TextEditingController StudentUsername = TextEditingController();
  TextEditingController _Title = TextEditingController();
  late TextEditingController controller;
  var Url;
  var ParentID = FirebaseAuth.instance.currentUser!.uid.toString();
  var PID = FirebaseAuth.instance.currentUser!.uid.toString();

  var showError = false;
  TextEditingController DelegatortName = TextEditingController();

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
  var FileNa = "";
  var StratIndex;
  TextEditingController Delegatorsername = TextEditingController();
  var delName = null;
  var delUserName = null;
  var stUserName = null;
  var CC = 0;
  final Reason = ["-", "غياب", "ظرف صحي", "أخرى"];
  int _changedNumber = 0;
  var StName;
  int _selectedNumber = 1;

  List<String> DelegatorList = [];
  TextEditingController _Name = TextEditingController();
  TextEditingController _NName = TextEditingController();
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

  Future GetDelegators() async {
    await FirebaseFirestore.instance.collection("Delegator").get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            //DelegatorList.add(document["UserName"]);
            DelegatorList.add(document["UserName"]);
          }),
        );
  }

  final Storage storage = Storage();
  var AdminID = "nXEWTcyL1hhilCZGWhO6rEmVGFt1";
  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: Reason[Index]);
    scrollController = FixedExtentScrollController(initialItem: Index);
    emailAddressController1 = TextEditingController();
    emailAddressController2 = TextEditingController();

    emailAddressController3 = TextEditingController();
  }

  final formKeyDelegator = GlobalKey<FormState>();
  final formk = GlobalKey<FormState>();
  @override
  void dispose() {
    _unfocusNode.dispose();
    emailAddressController1?.dispose();
    emailAddressController2?.dispose();
    emailAddressController3?.dispose();
    super.dispose();
  }

  final _key = GlobalKey<FormState>();
  final key2 = GlobalKey<ScaffoldState>();
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
              listStudentName.add("ID" +
                  " " +
                  document["NationalID"] +
                  " " +
                  "" +
                  document["Name"] +
                  " ");
            }
          }),
        );
  }

  @override
  Widget build(BuildContext context) {
    GetStudents();
    if (CC == 0) {
      getParentsList(PID);
    }
    GetDelegators();
    CC += 1;
    String x = "";
    int m = DelegatorList.length;
    for (var i = 0; i < DelegatorList.length; i++) {
      x = DelegatorList[i];
    }

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
              /* Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => NavParent(
                            TabValue: 17,
                          )));*/
              Navigator.pop(context);
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
                      height: 210,
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/images/formbackground.png',
                            width: double.infinity,
                            height: 230,
                            fit: BoxFit.cover,
                          ),
                          Align(
                            alignment: AlignmentDirectional(-0.06, 0.74),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 12, 0, 0),
                              child: Text(
                                'إنشاء طلب ',
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
                                EdgeInsetsDirectional.fromSTEB(16, 12, 0, 0),
                            child: Text(
                              ' ',
                              style: FlutterFlowTheme.of(context).bodyText2,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Form(
                        key: formKeyDelegator,
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
                                        left: 20,
                                        right: 20,
                                        top: 0,
                                        bottom: 15),
                                    child: Stack(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(bottom: 0),
                                          child: Directionality(
                                              textDirection:
                                                  ui.TextDirection.rtl,
                                              child: TextFormField(
                                                controller: _Name,
                                                onChanged: (value) {
                                                  setState(() {
                                                    onError = false;
                                                  });
                                                },
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        139, 46, 41, 95),
                                                    fontSize: 14),
                                                decoration: InputDecoration(
                                                  prefixIcon: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 28),
                                                    child: Icon(
                                                      Icons.title,
                                                      color: Color.fromARGB(
                                                          139, 46, 41, 95),
                                                      size: 22,
                                                    ),
                                                  ),
                                                  alignLabelWithHint: true,
                                                  floatingLabelBehavior:
                                                      FloatingLabelBehavior
                                                          .never,
                                                  contentPadding:
                                                      EdgeInsets.fromLTRB(
                                                          30, 5, 10, 5),
                                                  labelText: 'عنوان الطلب',
                                                  labelStyle: TextStyle(
                                                      color: Color(0xFF2E295F),
                                                      fontSize: 14),
                                                  hintText: 'أدخل عنوان الطلب',
                                                  hintStyle: TextStyle(
                                                      color:
                                                          Colors.grey.shade400,
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
                                                validator: (String? value) {
                                                  if (value == "") {
                                                    setState(() {
                                                      onError = true;
                                                    });
                                                    return "أرجو منك تعبئه الحقل الفارغ ";
                                                  }

                                                  if (value != null) {
                                                    setState(() {
                                                      onError = false;
                                                    });
                                                    return null;
                                                  }
                                                  return null;
                                                },
                                              )),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )),
                    Form(
                      key: _key,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        child: ListView(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 18, right: 18, bottom: 0),
                                  child: InkWell(
                                    //height: 80,
                                    onTap: () {
                                      showModalBottomSheet<void>(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Stack(children: [
                                            /*  InkWell(
                                                child: Container(
                                                  padding: EdgeInsets.all(5),
                                                  width: 90,
                                                  height: 40,
                                                  child: Text(
                                                    "الجميع",
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        color: const Color(
                                                            0xff0da6c2),
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                                //height: 80,
                                                onTap: () {
                                                  print(
                                                      "lllllllllllllmmmmmmmmmmmmmmmmmaaaaaaaaaaaaaaa");

                                                  for (var x
                                                      in listStudentName) {
                                                    setState(() {
                                                      ChoosenNames.add(x);
                                                    });
                                                  }
                                                  Navigator.pop(context);
                                                }),*/

                                            /* Padding(
                                                padding: EdgeInsets.only(
                                                    top: 0, bottom: 20),
                                                child: Align(
                                                  alignment:
                                                      Alignment(-0.93, -0.9),
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      print(
                                                          "lllllllllllllmmmmmmmmmmmmmmmmmaaaaaaaaaaaaaaa");

                                                      for (var x
                                                          in listStudentName) {
                                                        setState(() {
                                                          ChoosenNames.add(x);
                                                        });
                                                        print(x);
                                                      }
                                                      Navigator.pop(context);
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      elevation: 0.0,
                                                      primary: Colors.red
                                                          .withOpacity(0),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    2),
                                                              ),
                                                              side: BorderSide(
                                                                  color: Colors
                                                                      .white)),
                                                    ),
                                                    child: Text(
                                                      "الجميع",
                                                      style: TextStyle(
                                                          fontSize: 25,
                                                          color: const Color(
                                                              0xff0da6c2),
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ),
                                                )),*/
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 10, bottom: 0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    //color: Colors.red,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100)),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        textAlign:
                                                            TextAlign.center,
                                                        "الابناء",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    ]),
                                              ),
                                            ),
                                            Align(
                                                alignment:
                                                    Alignment(-0.93, -0.99),
                                                child: ListTile(
                                                  leading: Material(
                                                    //  color: Colors.green,
                                                    child: InkWell(
                                                      onTap: () {
                                                        for (var x
                                                            in listStudentName) {
                                                          setState(() {
                                                            ChoosenNames.add(x);
                                                          });
                                                        }
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text(
                                                        "الجميع",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color: const Color(
                                                                0xFF11AAB8),
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ), // the arrow back icon
                                                    ),
                                                  ),
                                                )),
                                            Stack(children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: 20, bottom: 0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      //  color: Colors.blue,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100)),
                                                  child: Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 60),
                                                      child: Align(
                                                        alignment: Alignment(
                                                            0.91, -1.9),
                                                        child: ListView.builder(
                                                            itemCount:
                                                                listStudentName
                                                                    .length,
                                                            itemBuilder:
                                                                (BuildContext
                                                                        context,
                                                                    int index2) {
                                                              return Stack(
                                                                children: [
                                                                  //   Text("اسم الطلاب"),
                                                                  Wrap(
                                                                      children: [
                                                                        ListTile(
                                                                          onTap:
                                                                              () {
                                                                            // await assignParentToStudent(studentId: snap[index].id, parentId: listParentId[index2]);

                                                                            // print("Executed after 5 seconds");

                                                                            setState(() {
                                                                              Studentx.Name = listStudentName[index2];
                                                                              var bol = true;
                                                                              for (var x in ChoosenNames) {
                                                                                if (x == listStudentName[index2]) {
                                                                                  bol = false;
                                                                                  break;
                                                                                }
                                                                              }
                                                                              if (bol) {
                                                                                ChoosenNames.add(listStudentName[index2]);
                                                                                if (!ChoosenNames.isEmpty) {
                                                                                  setState(() {
                                                                                    ErrorColor = true;
                                                                                    showError = false;
                                                                                  });
                                                                                }
                                                                              }
                                                                            });
                                                                            /* print(
                                                                "ffffffffffffffffffffffff");
                                                            print(
                                                                Studentx.Name);*/
                                                                            Navigator.pop(context);

                                                                            //  print(snap[index])
                                                                            //  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                                                          },
                                                                          title:
                                                                              Container(
                                                                            width:
                                                                                367.6,
                                                                            height:
                                                                                65.3,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              boxShadow: [
                                                                                BoxShadow(
                                                                                  blurRadius: 4,
                                                                                  color: Color(0x33000000),
                                                                                  offset: Offset(0, 2),
                                                                                )
                                                                              ],
                                                                              borderRadius: BorderRadius.circular(10),
                                                                            ),
                                                                            child:
                                                                                Stack(
                                                                              children: [
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0.78, 0),
                                                                                  child: Text(
                                                                                    listStudentName[index2],
                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                          fontFamily: 'Outfit',
                                                                                          color: Color(0xFF101213),
                                                                                          fontSize: 16,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0.94, 0.08),
                                                                                  child: Container(
                                                                                    width: 3,
                                                                                    height: 42,
                                                                                    decoration: BoxDecoration(
                                                                                      color: Color(0xFF29294D),
                                                                                      borderRadius: BorderRadius.circular(20),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ])
                                                                ],
                                                              );
                                                            }),
                                                      )),
                                                ),
                                              )
                                            ]),
                                          ]);
                                        },
                                      );
                                      if (ChoosenNames.isNotEmpty) {
                                        setState(() {
                                          ErrorColor = true;
                                          showError = false;
                                        });
                                      }
                                    },
                                    child: Container(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            //  color: Colors.blue,
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                        padding: EdgeInsets.only(
                                          left: 0,
                                        ),
                                        child: Row(children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                // color: Colors.blue,
                                                borderRadius:
                                                    BorderRadius.circular(100)),
                                            child: Center(
                                              child: Container(
                                                  //   color: Colors.blue,

                                                  padding:
                                                      EdgeInsets.only(left: 5),
                                                  width: 245,
                                                  height: 50,
                                                  margin: EdgeInsets.all(0),
                                                  //  color: Colors.green,
                                                  child: SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Wrap(
                                                          spacing: 0,
                                                          children: <Widget>[
                                                            ...ChoosenNames.map(
                                                                (email) => Wrap(
                                                                        spacing:
                                                                            4,
                                                                        runSpacing:
                                                                            0,
                                                                        children: [
                                                                          Padding(
                                                                              padding: EdgeInsets.all(4),
                                                                              child: Transform(
                                                                                  transform: new Matrix4.identity()..scale(0.75),
                                                                                  child: new Chip(
                                                                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                      labelPadding: EdgeInsets.only(left: 7, right: 3),
                                                                                      avatar: CircleAvatar(
                                                                                        backgroundColor: Colors.white70,
                                                                                        child: Text(email[0].toUpperCase()),
                                                                                      ),
                                                                                      label: Text(
                                                                                        email,
                                                                                        style: TextStyle(
                                                                                          color: Colors.white,
                                                                                        ),
                                                                                      ),
                                                                                      backgroundColor: Color(0xff0da6c2),
                                                                                      elevation: 6.0,
                                                                                      shadowColor: Colors.grey[60],
                                                                                      padding: EdgeInsets.all(8.0),
                                                                                      onDeleted: () {
                                                                                        setState(() {
                                                                                          for (var i = 0; i < ChoosenNames.length; i++) {
                                                                                            if (email == ChoosenNames[i]) {
                                                                                              ChoosenNames.removeAt(i);
                                                                                            }
                                                                                          }
                                                                                        });
                                                                                      })))
                                                                        ])).toList(
                                                                growable: true),
                                                          ]))),
                                            ),
                                          ),
                                          Wrap(
                                            spacing: 1,
                                            children: [
                                              Container(
                                                  child: Padding(
                                                padding: EdgeInsets.only(
                                                    top: 0, bottom: 0),
                                                child: RichText(
                                                  textAlign: TextAlign.right,
                                                  text: TextSpan(
                                                    children: [
                                                      /*   WidgetSpan(
                                                            child: Icon(
                                                              Icons
                                                                  .arrow_drop_down_circle,
                                                              size: 22,
                                                              color:
                                                                  Color.fromARGB(
                                                                      139,
                                                                      46,
                                                                      41,
                                                                      95),
                                                            ),
                                                          ),
                                                          WidgetSpan(
                                                              child: SizedBox(
                                                            width: 190,
                                                          )),*/
                                                      TextSpan(
                                                        text:
                                                            " اسم المستخدم للطالب ",
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xFF2E295F),
                                                            fontSize: 13),
                                                      ),
                                                      WidgetSpan(
                                                        child: Icon(
                                                          Icons.person,
                                                          size: 18,
                                                          color: Color.fromARGB(
                                                              139, 46, 41, 95),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ))
                                            ],
                                          ),
                                        ]),

                                        ///
                                        ///
                                        ///
                                        ///
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 1,
                                          color: ErrorColor
                                              ? Color.fromARGB(139, 46, 41, 95)
                                              : Color.fromARGB(
                                                  255, 221, 62, 51),
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(18)),
                                      ),
                                    ),
                                  ),
                                ),
                                showError
                                    ? Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            243, 5, 0, 5),
                                        child: Text(
                                          "أرجو منك تعبئه الحقل الفارغ ",
                                          textAlign: TextAlign.right,
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle2
                                              .override(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w100,
                                                fontFamily: 'Outfit',
                                                color: Color.fromARGB(
                                                    255, 221, 62, 51),
                                              ),
                                        ))
                                    : Text(""),
                                ////
                                ///
                                ///
                                ///
                                ///
                              ],
                            ),

                            // Padding(padding: padding)

                            /*  FutureBuilder(
                                future: storage.listFiles(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<firebase_storage.ListResult>
                                        snapshot) {
                              
                                  if (snapshot.connectionState ==
                                          ConnectionState.done &&
                                      snapshot.hasData) {
                                

                                    return Container(
                                      // padding: const EdgeInsets.symmetric(
                                      //     horizontal: 20),
                                      height: 50,
                                      color: Colors.red,
                                      child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          shrinkWrap: true,
                                          itemCount:
                                              snapshot.data!.items.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Padding(
                                              padding: const EdgeInsets.all(8),
                                              child: ElevatedButton(
                                                  onPressed: () {},
                                                  child: Text(snapshot.data!
                                                      .items[index].name)),
                                            );
                                          }),


                                    );
                                  } else if (snapshot.connectionState ==
                                          ConnectionState.waiting ||
                                      !snapshot.hasData) {
                             
                                    return Text("SS");
                                  }
                                  return SizedBox(
                                    height: 0,
                                    width: 0,
                                  );
                                })*/
                          ],
                        ),
                      ),
                    ),
                    Form(
                      key: formk,
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
                                        minLines: 3,
                                        maxLines: 5,
                                        keyboardType: TextInputType.multiline,
                                        textInputAction: TextInputAction.next,
                                        onChanged: (value) {
                                          setState(() {
                                            onError = false;
                                          });
                                        },
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(139, 46, 41, 95),
                                            fontSize: 14),
                                        controller: Content,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                            top: 30.0,
                                            bottom: 10,
                                          ),
                                          prefixIcon: Padding(
                                            padding: const EdgeInsets.all(
                                                defaultPadding),
                                            child: Icon(
                                              Icons.message,
                                              color: Color.fromARGB(
                                                  139, 46, 41, 95),
                                              size: 22,
                                            ),
                                          ),
                                          alignLabelWithHint: true,
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.never,
                                          labelText: 'محتوى الطلب',
                                          labelStyle: TextStyle(
                                              color: Color(0xFF2E295F),
                                              fontSize: 14),
                                          hintText: 'أدخل محتوى الطلب',
                                          hintStyle: TextStyle(
                                              color: Color.fromARGB(
                                                  139, 46, 41, 95),
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
                                              color: Color.fromARGB(
                                                  139, 46, 41, 95),
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
                                        validator: (String? value) {
                                          if (value == "") {
                                            setState(() {
                                              onError = true;
                                            });
                                            return "أرجو منك تعبئه الحقل الفارغ ";
                                          }

                                          if (value != null) {
                                            setState(() {
                                              onError = false;
                                            });
                                            return null;
                                          }
                                          return null;
                                        },
                                      )),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(22, 4, 22, 0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          final results = await FilePicker.platform.pickFiles(
                            allowMultiple: false,
                            type: FileType.custom,
                            allowedExtensions: ['png', 'jpg', "pdf"],
                          );
                          if (results == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('No file selected.'),
                              ), // SnackBar
                            );
                            return null;
                          }
                          path = results.files.single.path!;
                          fileName = results.files.single.name;

                          FileNa = fileName;
                          StratIndex = FileNa.length - 3;
                          Type2 = FileNa.substring(StratIndex);
                          print(
                              "[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[object]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]");
                          print(Type2);
                          setState(() {
                            showFile = true;
                            showErr = true;
                          });
                          print("===============================");
                        },
                        text: ' رفع ملف',
                        icon: Icon(
                          Icons.upload_file,
                          color: Colors.white,
                          size: 15,
                        ),
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 50,
                          color: Color.fromARGB(255, 203, 205, 206),
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Outfit',
                                    color: Colors.white,
                                  ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    // Padding(padding: padding)
                    showFile
                        ? Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 23, 5),
                            child: Positioned(
                                right: 0.0,
                                child: Text(
                                  FileNa + " تم إضافة الملف ",
                                  textAlign: TextAlign.right,
                                  style: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontSize: 14,
                                        fontFamily: 'Outfit',
                                        color:
                                            Color.fromARGB(255, 102, 169, 104),
                                      ),
                                )))
                        : Text(""),
                    showErr
                        ? showFile
                            ? Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 23, 5),
                                child: Positioned(
                                    right: 0.0,
                                    child: Text(
                                      FileNa + " تم إضافة الملف ",
                                      textAlign: TextAlign.right,
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontSize: 14,
                                            fontFamily: 'Outfit',
                                            color: Color.fromARGB(
                                                255, 102, 169, 104),
                                          ),
                                    )))
                            : Text("")
                        : Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(310, 5, 0, 5),
                            child: Text(
                              "الرجاء أرفاق ملف ",
                              textAlign: TextAlign.right,
                              style: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Outfit',
                                    color: Color.fromARGB(255, 221, 62, 51),
                                  ),
                            )),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(22, 4, 22, 16),
                      child: FFButtonWidget(
                        onPressed: () async {
                          formKeyDelegator.currentState!.validate();
                          formk.currentState!.validate();
                          _key.currentState!.validate();
                          print("88888888888888888888ssss");
                          print(path);
                          if (path == null) {
                            setState(() {
                              showErr = false;
                            });
                          }
                          setState(() {
                            if (ChoosenNames.isEmpty) {
                              showError = true;
                              ErrorColor = false;
                            }
                          });
                          if (FileNa == "") {
                            showErr = false;
                          }
                          if (path != null) {
                            setState(() {
                              isPathNotNull = true;
                            });
                          }

                          if (formKeyDelegator.currentState != null &&
                              formk.currentState!.validate() &&
                              formk.currentState != null &&
                              formKeyDelegator.currentState!.validate() &&
                              ErrorColor &&
                              isPathNotNull) {
                            var connectivityResult =
                                await (Connectivity().checkConnectivity());
                            if (connectivityResult == ConnectivityResult.wifi) {
                              showCupertinoDialog(
                                  context: context, builder: CreateDialog3);
                              // I am connected to a mobile network.
                            } else if (connectivityResult ==
                                ConnectivityResult.mobile) {
                              showCupertinoDialog(
                                  context: context, builder: CreateDialog3);
                            } else {
                              await showCupertinoDialog(
                                  context: context, builder: CreateDialog6);
                            }

                            await FirebaseFirestore.instance
                                .collection("Student")
                                .get()
                                .then(
                                  (snapshot) =>
                                      snapshot.docs.forEach((document) async {
                                    //print(
                                    //    "this field is??????????????????????");
                                    //  print(Studentx.Name);
                                    if (PID == document["ParentId"]) {
                                      for (var v in ChoosenNames) {
                                        var SName = "ID" +
                                            " " +
                                            document["NationalID"] +
                                            " " +
                                            "" +
                                            document["Name"] +
                                            " ";
                                        if (SName == v) {
                                          SIDArray.add(document.reference.id);
                                          NamesArray.add(document['Name']);
                                          /*   print(
                                                  "666666666666666666666666666");*/
                                          StName = document['Name'];
                                          // print("777777777777777");

                                          //  IsIDExists = false;
                                        }
                                      }
                                    }
                                  }),
                                );
                            var Count = NamesArray.length;
                            if (NamesArray.length == 1) {
                              DelegationNames = "لطالب ";
                              for (var A in NamesArray) {
                                DelegationNames += A + "  ";
                              }
                            } else {
                              DelegationNames = "لطلاب  ";
                              for (var A in NamesArray) {
                                if (Count != 1) {
                                  DelegationNames += A + " و ";
                                  Count -= 1;
                                } else {
                                  DelegationNames += A + " ";
                                }
                              }
                            }
                          }
                        },
                        text: 'إرسال',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 50,
                          color: const Color(0xFF11AAB8),
                          textStyle: FlutterFlowTheme.of(context)
                              .subtitle2
                              .override(
                                  fontFamily: 'Outfit',
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),

                    Stack(
                      children: [],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget CreateDialog3(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      title: const Text(' طلب ',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color.fromRGBO(31, 31, 31, 1),
              fontWeight: FontWeight.bold)),
      content: Text(" هل تريد إرسال الطلب ؟",
          textAlign: TextAlign.center,
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('إلغاء'),
        ),
        TextButton(
            onPressed: () async {
              DateTime today = DateTime.now();
              String dateStr =
                  "${today.year}-${today.month}-${today.day} ${today.hour}:${today.minute}";
              var Type = "-";
              Type = value;
              if (Type == "أخرى") {
                Type = _Type.text;
              }

              String DownloadURL = "";
              print("this is the fattttten");
              if (path != null) {
                storage
                    .uploadFile(path, fileName, "06YH3Ox5AvO4eUYahk54")
                    .then((value) => print("Donnne!!!!!!!!"));

                //  await Future.delayed(const Duration(microseconds: 2), () async {
                print("this is the betweeeeennnnn storage and url");
                print(path);
                print("thiss is file name " + fileName);
                DownloadURL = await storage2
                    .ref("Files/06YH3Ox5AvO4eUYahk54/$fileName")
                    .getDownloadURL();
              }
//}
              // print(storage.downloadURL(fileName, "06YH3Ox5AvO4eUYahk54"));
              print("this is the lennngthhh");
              print(NamesArray.length);
              print(SIDArray.length);
              for (var i = 0;
                  i < NamesArray.length && i < SIDArray.length;
                  i++) {
                print("hhhhhhh");
                ReqParent2.AddRequestParent(
                  _Name.text,
                  "InProgress",
                  Content.text,
                  SIDArray[i],
                  dateStr,
                  "-",
                  DownloadURL,
                  Type2,
                );
              }

              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => NavParent(
                            TabValue: 17,
                          )));
            },
            child: const Text("موافق",
                style: TextStyle(
                    color: const Color(0xFF11AAB8),
                    fontWeight: FontWeight.w600))),
      ],
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
      title: Text("تسجيل حساب",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 18,
              color: Color.fromRGBO(31, 31, 31, 1),
              fontWeight: FontWeight.bold)),
      content: Text(
        "تم تسجبل حسابك بنجاح بإمكانك الدخول لحسابك ",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 14),
      ),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("موافق",
                style: TextStyle(
                    color: const Color(0xff57d77a),
                    fontWeight: FontWeight.bold))),
      ],
    );
  }
}
