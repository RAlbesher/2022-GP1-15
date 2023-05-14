import 'package:circlight/Pages/Admin.dart';

import 'package:circlight/Pages/Nav.dart';
import 'package:circlight/Pages/NavParent.dart';

import 'package:circlight/Pages/Student.dart';
import 'package:circlight/Pages/constants.dart';

import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui' as ui;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'package:path/path.dart' as Path;

import '../models/user_data.dart';

class AnnounceForm extends StatefulWidget {
  const AnnounceForm({Key? key}) : super(key: key);

  @override
  _AnnounceForm createState() => _AnnounceForm();
}

class _AnnounceForm extends State<AnnounceForm> {
  ////////////////////
  ///
  ///
  ///
  final _unfocusNode = FocusNode();
  //Controllers
  TextEditingController Address = TextEditingController();
  TextEditingController content = TextEditingController();
  TextEditingController sendto = TextEditingController();
  TextEditingController search = TextEditingController();
  //

  @override
  void initState() {
    showUsers();
    super.initState();
    print("init cal");

    super.initState();
  }

  showUsers() {
    try {
      users.clear();
      setState(() {});
      FirebaseFirestore.instance
          .collection("Student")
          .snapshots()
          .listen((event) {
        users.clear();
        setState(() {});
        for (int i = 0; i < event.docs.length; i++) {
          StudentModel dataModel = StudentModel.fromJson(event.docs[i].data());
          users.add(dataModel);
          print(
            users[i].Name.toString(),
          );
        }
        setState(() {});
      });
      setState(() {});
    } catch (e) {}
  }

  Future getParentsList() async {
    listStudentName.clear();
    listStudentParentid.clear();
    await FirebaseFirestore.instance.collection("Student").get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            listStudentName.add(document["Name"]);
            listStudentParentid.add(document['ParentId']);
            listStudentID.add(document['NationalID']);
          }),
        );
  }

  Student Studentx = new Student(
    Name: "",
    Class: "",
    SNationalID: "",
    SNationality: "",
    SUserName: "",
    SBloodType: "",
  );
  var ErrorColor = true;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<FormState>();
  final formKeyDelegator = GlobalKey<FormState>();
  final _key = GlobalKey<FormState>();
  List<String> listParentName = [];
  List<String> listSearch = [];
  List<String> listParentId = [];
  List<String> listStudentName = [];
  List<String> listStudentParentid = [];
  List<String> listStudentID = [];
  List<String> chosenStudent = [];
  List<String> chosenparentID = [];
  bool checkboxParent = false;
  bool ischecked = false;
  String searchname = "";
  bool found = true;
  String ParentId = "";
  File? img;
  String imgurl = '';
  bool isLoadFile = false;
  UploadTask? task;
  var ChoosenNames = [];
  var showError = false;
  //List<String> search = [];

  String? FireUrlForImage;
  bool ispublic = false; // to check if the message is public or not

  uploadImageToStorage(PickedFile? pickedFile) async {
    //conditoin for web
    if (kIsWeb) {
      setState(() {
        isLoadFile = true;
      });
      Reference _reference = FirebaseStorage.instance
          .ref()
          .child('images/${Path.basename(pickedFile!.path)}');
      await _reference
          .putData(
        await pickedFile!.readAsBytes(),
        SettableMetadata(contentType: 'image/jpeg'),
      )
          .whenComplete(() async {
        await _reference.getDownloadURL().then((value) {
          FireUrlForImage = value;
          setState(() {
            isLoadFile = false;
          });
          print("i am download link ==${FireUrlForImage.toString()}");
        });
      });
    } else {
      //else Android and iOS

      uploadFile();
    }
  }

  var CC = 0;
  Future uploadFile() async {
    setState(() {
      isLoadFile = true;
    });
    if (img! == null) return;
    final fileName = Path.basename(img!.path);
    final destination = 'images/$fileName';

    task = FirebaseApi.uploadFile(destination, img!);
    setState(() {});

    if (task == null) return;

    final snapshot = await task!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();

    print('Download-Link: $urlDownload');
    FireUrlForImage = urlDownload;
    setState(() {
      isLoadFile = false;
    });
  }

  Future pickercamera() async {
    await showModalBottomSheet(
        context: context,
        builder: (context) => BottomSheet(
            onClosing: () {},
            builder: (context) => Directionality(
                  textDirection: ui.TextDirection.rtl,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: Icon(Icons.camera),
                        title: Text("الكاميرا"),
                        onTap: () async {
                          Navigator.of(context).pop();
                          final myimg = await ImagePicker()
                              .getImage(source: ImageSource.camera);
                          setState(() {
                            img = File(myimg!.path);
                            print(img);
                            uploadImageToStorage(myimg);
                            //uploadFile();
                          });
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.filter),
                        title: Text("مكتبة الصور"),
                        onTap: () async {
                          Navigator.of(context).pop();
                          final myimg = await ImagePicker()
                              .getImage(source: ImageSource.gallery);
                          setState(() {
                            img = File(myimg!.path);
                            uploadImageToStorage(myimg);
                            // uploadFile();
                            print(img);
                          });
                        },
                      )
                    ],
                  ),
                )));
  }

  List<StudentModel> users = [];

  @override
  Widget build(BuildContext context) {
    if (CC == 0) {
      getParentsList();
    }

    CC += 1;
    CollectionReference Parents =
        FirebaseFirestore.instance.collection("Parent");
    CollectionReference Announ =
        FirebaseFirestore.instance.collection("Announcement");
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
                            TabValue: 19,
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
                                'إنشاء إعلان ',
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
                        key: formKey,
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
                                                  controller: Address,
                                                  onChanged: (val) => formKey
                                                      .currentState
                                                      ?.validate(),
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
                                                    labelText: "العنوان",
                                                    labelStyle: TextStyle(
                                                        color:
                                                            Color(0xFF2E295F),
                                                        fontSize: 14),
                                                    hintText: "أدخل العنوان",
                                                    hintStyle: TextStyle(
                                                        color: Colors
                                                            .grey.shade400,
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
                                                        color:
                                                            Color(0xFF2E295F),
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
                                                  })),
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
                                                        setState(() {
                                                          ispublic = true;
                                                        });
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
                                                                            chosenparentID.add(listStudentParentid[index2]);
                                                                            print("thiss is the student iddddddd" +
                                                                                listStudentParentid[index2]);
                                                                            chosenStudent.add(listStudentName[index2]);
                                                                            print("thiss is the student nammmeee" +
                                                                                listStudentName[index2]);
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

                                                                              print("aaaaaaaaaaaaaaaa");
                                                                              print(listStudentName[index2]);
                                                                            });

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
                                                                                    " ID " + listStudentName[index2] + " " + listStudentID[index2],
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
                                                                        /*
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
                                                                        ),*/
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
                    ///
                    ///
                    ///
                    ///

                    //
                    //

                    ///
                    ///
                    ///
                    ///
                    ///
                    ///
                    ///
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
                                                  controller: content,
                                                  onChanged: (val) => formKey
                                                      .currentState
                                                      ?.validate(),
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          139, 46, 41, 95),
                                                      fontSize: 14),
                                                  decoration: InputDecoration(
                                                    prefixIcon: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                right: 28),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 9,
                                                                  left: 8,
                                                                  top: 10),
                                                          child:
                                                              Column(children: [
                                                            Image.asset(
                                                              "assets/icons/name.png",
                                                              width: 20,
                                                              height: 20,
                                                              color: Color
                                                                  .fromARGB(
                                                                      139,
                                                                      46,
                                                                      41,
                                                                      95),
                                                            )
                                                          ]),
                                                        )),
                                                    alignLabelWithHint: true,
                                                    floatingLabelBehavior:
                                                        FloatingLabelBehavior
                                                            .never,
                                                    contentPadding:
                                                        EdgeInsets.fromLTRB(
                                                            30, 5, 10, 5),
                                                    labelText: "المحتوى",
                                                    labelStyle: TextStyle(
                                                        color:
                                                            Color(0xFF2E295F),
                                                        fontSize: 14),
                                                    hintText: "أدخل المحتوى",
                                                    hintStyle: TextStyle(
                                                        color: Colors
                                                            .grey.shade400,
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
                                                        color:
                                                            Color(0xFF2E295F),
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
                                                  })),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(22, 4, 22, 16),
                      child: FFButtonWidget(
                        onPressed: () {
                          pickercamera();
                        },
                        text: "رفع صورة",
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

                    SizedBox(
                      height: 20,
                    ),
                    // display image
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Container(
                          height: 150,
                          width: 300,
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                              ),
                              color: Colors.black12),
                          child: isLoadFile
                              ? Center(child: CircularProgressIndicator())
                              : img != null
                                  ? kIsWeb
                                      ? Image.network(
                                          img!.path,
                                          fit: BoxFit.cover,
                                        )
                                      : Image.file(
                                          img!,
                                          fit: BoxFit.cover,
                                        )
                                  : Image.network(
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4e2w7sqLN7wNvah3rnc3RbSILIsG7Bfdwa7haC-mEzRmj8bqeseg0241dzcF1W4yGkoU&usqp=CAU",
                                      fit: BoxFit.cover,
                                    )),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    Directionality(
                        textDirection: ui.TextDirection.rtl,
                        child: CheckboxListTile(
                          title:
                              Text("هل ترغب في وضع الإعلان ذا أولوية عالية؟"),
                          value: ischecked,
                          onChanged: (newValue) {
                            setState(() {
                              ischecked = newValue!;
                            });
                          },
                          //  <-- leading Checkbox
                        ) /*CheckboxListTile(
                    title: Text("هل ترغب في جعل الاعلان مهم؟"),
                    value: ischecked,
                    onChanged: (value) {
                      setState(() {
                        ischecked = value!;
                      });
                    },
                  ),*/
                        ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(22, 4, 22, 16),
                      child: FFButtonWidget(
                        onPressed: () async {
                          if (formKey.currentState!.validate() &&
                              formKeyDelegator.currentState!.validate()) {
                            await addannoun(
                              chosenparentID,
                              Address,
                              ischecked,
                              content,
                              ispublic,
                              chosenStudent,
                              FireUrlForImage,
                            );

                            await showCupertinoDialog(
                                context: context, builder: CreateDialog);
                            Navigator.pop(context);
                          }
                        },
                        text: 'إرسال',
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget CreateDialog(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      title: Text("إرسال المحتوى",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 18,
              color: Color.fromRGBO(31, 31, 31, 1),
              fontWeight: FontWeight.bold)),
      content: Text(
        "تم إرسال المحتوى بنجاح",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 14),
      ),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.pop(context);
              /* Navigator.of(context).push(CupertinoPageRoute(
                builder: (context) => Nav(
                  TabValue: 0,
                  documentId: "",
                ),
              ));*/
            },
            child: Text("موافق",
                style: TextStyle(
                    color: Color(0xff0da6c2), fontWeight: FontWeight.bold))),
      ],
    );
  }
}

Future addannoun(chosenparentID, Address, ischecked, content, ispublic,
    chosenStudent, FireUrlForImage) async {
  print("inside the add anouncment function");
  print(ispublic);
  print(chosenStudent.length);
  // print(chosenStudent[0]);
  //print(Address.text);
  //String add = Address.text;
  //print("this is the sdresssss" + add);
  List<String> searchaddress;

  searchaddress = await search(Address.text) as List<String>;
  CollectionReference Announ =
      FirebaseFirestore.instance.collection("Announcement");

  if (ispublic == false) {
    for (var i = 0; i < chosenStudent.length; i++) {
      await Announ.add({
        "Address": Address.text,
        "important": ischecked,
        "message": content.text,
        "ParentID": chosenparentID[i],

        "StudentN": chosenStudent[i],
        "status": "Private",
        "Date": DateTime.now(),
        "image": FireUrlForImage,
        'Search': searchaddress,
        //img
      });
    }
  } else {
    //String add = Address.text;
    //print("this is the sdresssss" + add);
    List<String> searchaddress;

    searchaddress = await search(Address.text) as List<String>;
    await Announ.add({
      "Address": Address.text,
      "important": ischecked,
      "message": content.text,
      "status": "Public",
      "Date": DateTime.now(),
      "image": FireUrlForImage,
      'Search': searchaddress,
      //img
    });
  }
  chosenparentID.clear();
  chosenStudent.clear();
}

Future search(Address) async {
  List<String> search1 = [];
  for (var i = 0; i < Address.length; i++) {
    search1.add(Address.substring(0, i + 1));
  }

  return search1;
}

class FirebaseApi {
  static UploadTask? uploadFile(String destination, File file) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);
      // SettableMetadata(contentType: 'image/jpeg');

      return ref.putFile(
        file,
        //SettableMetadata(contentType: 'image/jpeg'),
      );
    } on FirebaseException catch (e) {
      return null;
    }
  }

  static UploadTask? uploadBytes(String destination, Uint8List data) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);

      return ref.putData(
        data,
        SettableMetadata(contentType: 'image/jpeg'),
      );
    } on FirebaseException catch (e) {
      return null;
    }
  }
}
