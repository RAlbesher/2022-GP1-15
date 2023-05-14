import 'package:circlight/Pages/Nav.dart';
import 'package:circlight/Pages/NavDelegator.dart';
import 'package:circlight/Pages/RequestDelegator.dart';
import 'package:circlight/Pages/Screens/welcome_screen.dart';
import 'package:circlight/flutter_flow/flutter_flow_icon_button.dart';
import 'package:circlight/flutter_flow/flutter_flow_theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:circlight/Pages/viewprofileDelegator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'Delegator.dart';

class DelegatorHome extends StatefulWidget {
  DelegatorHome({Key? key}) : super(key: key);

  // late String userId;

  @override
  _DelegatorHome createState() => _DelegatorHome();
}

class _DelegatorHome extends State<DelegatorHome> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  CollectionReference request =
      FirebaseFirestore.instance.collection('Student');
  CollectionReference Parent = FirebaseFirestore.instance.collection('Parent');
  List<String> docPname = [];
  List<String> StudentName = [];
  List<String> ParentName = [];
  List<String> ParentID = [];
  int CountStudent = -1;
  int SnapCount = 0;
  int ParentCount = -1;
  // var NoRequest = false;
  var DelegatorID = FirebaseAuth.instance.currentUser!.uid.toString();
  // var DelegatorID = "F18QfhnW1ROaOW3ojQ2iNBSrmsE2";
  TextEditingController NName = TextEditingController();

  CollectionReference NameDelegator =
      FirebaseFirestore.instance.collection('Delegator');
  getDelegatorName() async {
    await NameDelegator.doc(DelegatorID).get().then((value) {
      setState(() {
        NName..text = value["Name"];
      });
    });
  }

  int count = 0;
  bool ShowRequest = false;
  RequestDelegator Req = new RequestDelegator(
      DName: "",
      Dusername: "",
      isAccepted: "false",
      isActive: "false",
      SID: "");
  var ID;

  get userName => userName;
  CollectionReference ReqDel =
      FirebaseFirestore.instance.collection('Requests');
  var CountWaiting = 0;
  var Waiting = [];
  /* WaitingRequest() {
    Waiting.clear();
    ReqDel.get().then((snapshot) => snapshot.docs.forEach((document) {
          if (document["isAccepted"] == "Waiting" &&
              document["DelegatorID"] == DelegatorID) {
            Waiting.add("Waiting");
          }
        }));
  }

  DelRequest() async {
    await WaitingRequest();
    ReqDel.get().then((snapshot) => snapshot.docs.forEach((document) {
          //ShowRequest = !snap[index]["isAccepted"];

          if (document["isAccepted"] == "Waiting" &&
              document["DelegatorID"] == DelegatorID) {
            ShowRequest = true;
            setState(() {
              CountWaiting = 1;
              NoRequest = true;
            });
          } else if (document["isAccepted"] == "false" &&
              document["DelegatorID"] == DelegatorID &&
              Waiting.isEmpty == true) {
            ShowRequest = false;
            setState(() {
              NoRequest = false;
            });
          } else if (document["isAccepted"] == "true" &&
              document["DelegatorID"] == DelegatorID &&
              Waiting.isEmpty == true) {
            ShowRequest = false;
            setState(() {
              NoRequest = false;
            });
          }
        }));
  }
*/
  @override
  Widget build(BuildContext context) {
    //WaitingRequest();

    // DelRequest();
    getDelegatorName();
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xFFF1F4F8),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(0),
                          ),
                          child: Image.asset(
                            'assets/images/Screenshot_(497).png',
                            width: 421.3,
                            height: 259,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0, -0.71),
                        child: Stack(
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0, 0.01),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 44, 16, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(""),
                                        // InkWell(
                                        //     onTap: () {
                                        //       Navigator.push(
                                        //         context,
                                        //         CupertinoPageRoute(
                                        //           builder: (context) {
                                        //             return SelectUserRoleScreen();
                                        //           },
                                        //         ),
                                        //       );
                                        //     },
                                        //     child: Image.asset(
                                        //       'assets/images/turn-off.png',
                                        //       height: 30,
                                        //       width: 45,
                                        //     )),
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                CupertinoPageRoute(
                                                    builder: (context) =>
                                                        NavDel(
                                                          documentId:
                                                              FirebaseAuth
                                                                  .instance
                                                                  .currentUser!
                                                                  .uid
                                                                  .toString(),
                                                          whichpag: 0,
                                                          index: 1,
                                                          TheValue: '',
                                                          Confirm: false,
                                                          DropDown: false,
                                                          TabValue: 7,
                                                        )));
                                          },
                                          child: Container(
                                            width: 40,
                                            height: 40,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.asset(
                                              'assets/images/userAvatar.png',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24, 16, 16, 0),
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(3.86, 0.74),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    2, 0, 6, 0),
                                            child: Text(
                                              NName.text,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .title1
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: Color(0xBE83DBCC),
                                                    fontSize: 32,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5, 0, 6, 0),
                                            child: Text(
                                              'مرحبا',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .title1
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: Colors.white,
                                                        fontSize: 32,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 12, 20, 12),
                                    child: Container(
                                      width: double.infinity,
                                      height: 120,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 4,
                                            color: Color(0x34090F13),
                                            offset: Offset(0, 2),
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 8, 12, 8),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.98, -0.77),
                                              child: Image.asset(
                                                'assets/icons/Circlight.png',
                                                width: 115,
                                                height: 100,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Expanded(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 4, 0, 0),
                                                    child: Text(
                                                      'Progress',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText2
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: Color(
                                                                    0xFF57636C),
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(295, 6, 0, 0),
                    child: Text(
                      'طلبات التفويض',
                      style: FlutterFlowTheme.of(context).title2.override(
                            fontFamily: 'Outfit',
                            color: Color(0xFF29294D),
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 7,
              ),
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("Requests")
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    final snap = snapshot.data!.docs;
                    return FutureBuilder(
                        future: Future.wait([
                          GetNames(snap),
                        ]),
                        builder: (context, snapshot) {
                          print("lllllllllll=========");

                          if (snapshot.data?.length != 0) {
                            //  WaitingRequest();
                            //  DelRequest();

                            return /* NoRequest
                                ?*/
                                Expanded(
                              child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                primary: false,
                                itemCount: snap.length,
                                itemBuilder: (context, index) {
                                  print(snap[index]["isAccepted"]);
                                  if (snap[index]["DelegatorID"] !=
                                      DelegatorID) {
                                    ShowRequest = false;
                                  } else if (snap[index]["isAccepted"] ==
                                          "false" &&
                                      snap[index]["DelegatorID"] ==
                                          DelegatorID) {
                                    ShowRequest = false;
                                    //  print("111111111111111111");
                                  } else if (snap[index]["isAccepted"] ==
                                          "true" &&
                                      snap[index]["DelegatorID"] ==
                                          DelegatorID) {
                                    ShowRequest = false;
                                    // print("111111111111111111");
                                    //  print("22222222222222222");
                                  } else if (snap[index]["isAccepted"] ==
                                          "Waiting" &&
                                      snap[index]["DelegatorID"] ==
                                          DelegatorID) {
                                    ShowRequest = true;
                                    //  print("111111111111111111");
                                  }

                                  return ShowRequest
                                      ? Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5, 5, 5, 5),
                                          child: Container(
                                            width: 367.6,
                                            height: 58.3,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 4,
                                                  color: Color(0x33000000),
                                                  offset: Offset(0, 2),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Stack(
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -0.65, -0.19),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 4, 0),
                                                    child: InkWell(
                                                        // height: 80,

                                                        onTap: () {
                                                          ID = snap[index]
                                                              .reference
                                                              .id;
                                                          // print(ID);
                                                          Req.UpdateRequest(
                                                              ID,
                                                              "isAccepted",
                                                              "true");
                                                          Req.UpdateRequest(
                                                              ID,
                                                              "DelegatorActive",
                                                              "true");
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                                  snackBar);
                                                        },
                                                        child: Container(
                                                          width: 30,
                                                          height: 30,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        40),
                                                            color: Color(
                                                                0xFF4CD755),
                                                          ),
                                                          child: const Center(
                                                              child: Icon(
                                                            Icons.check,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    250,
                                                                    252,
                                                                    253),
                                                            size: 13,
                                                          )),
                                                        )),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -0.9, -0.19),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 4, 0),
                                                    child: InkWell(
                                                        // height: 80,

                                                        onTap: () {
                                                          ID = snap[index]
                                                              .reference
                                                              .id;

                                                          showCupertinoDialog(
                                                              context: context,
                                                              builder:
                                                                  CreateDialog3);
                                                        },
                                                        child: Container(
                                                          width: 30,
                                                          height: 30,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        40),
                                                            color: Color(
                                                                0xFFE32121),
                                                          ),
                                                          child: const Center(
                                                              child: Icon(
                                                            Icons.close,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    250,
                                                                    252,
                                                                    253),
                                                            size: 13,
                                                          )),
                                                        )),
                                                  ),
                                                ),
                                                Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.73, -0.59),
                                                    child: Text(
                                                        StudentName[index],
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .title2
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: Color(
                                                                      0xFF101213),
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ))),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.77, 0.49),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 4, 0, 0),
                                                    child: Wrap(children: [
                                                      Text(
                                                        ParentName[index],
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText2
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: Color(
                                                                      0xFF57636C),
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    1, 0, 0, 0),
                                                        child: Image.asset(
                                                          "assets/icons/RequestParent.png",
                                                          width: 19,
                                                          height: 19,
                                                          color:
                                                              Color(0xFF57636C),
                                                        ),
                                                      )
                                                    ]),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.94, 0.08),
                                                  child: Container(
                                                    width: 3,
                                                    height: 42,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFF29294D),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ))
                                      : SizedBox(
                                          height: 0,
                                        );
                                },
                              ),
                            );
                            /* : Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        124, 20, 90, 20),
                                    child: Text("لا توجد طلبات"));*/
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        }); /////////////
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
//============================
  /* Future GetNames(snap) async {
    List<String> StudentID = [];

    try {
      for (var i = 0; snap[i] != null; i++) {
        SnapCount += 1;
        StudentID.add(snap[i]["StudentID"]);
      }
    } catch (error) {}

    for (var j = 0; j < StudentID.length; j++) {
      request.doc(StudentID[j]).get().then((value) {
        count = 1;

        StudentName.add(value["Name"]);
        ParentID.add(value["ParentId"]);
        for (var i = 0; i < StudentName.length; i++) {}
      });
    }

    for (var b = 0; b < ParentID.length; b++) {
      Parent.doc(ParentID[b]).get().then((value) {
        count = 1;

        ParentName.add(value["Name"] + " " + value["NationalID"]);
      });
    }
  }*/
  //////////////////////////
  ///
  ///===============

  ///
  ////
  //
  //

  Future GetNames(snap) async {
    List<String> StudentID = [];

    try {
      for (var i = 0; snap[i] != null; i++) {
        SnapCount += 1;
        StudentID.add(snap[i]["StudentID"]);
      }
    } catch (error) {
      //   print("error");
    }

    for (var j = 0; j < StudentID.length; j++) {
      await request.doc(StudentID[j]).get().then((value) {
        count = 1;

        StudentName
          ..add("ID" +
              " " +
              value["NationalID"] +
              " " +
              "الطالب " +
              value["Name"]);
        ParentID.add(value["ParentId"]);
        Parent.doc(value["ParentId"]).get().then((value) {
          //StudentName.add(value.get('Name'));

          //    print("pID");
          //   print(ParentID[j]);

          //  print(StudentName[0]);
          // Access your after your get the data

          ParentName.add("ID" +
              " " +
              value["NationalID"] +
              " " +
              "ولي الأمر " +
              value["Name"]);
          //   print("=============================================");
          //  print(value["Name"]);
          //   print("Starteddd");
        });
        //  print(value["ParentId"]);

        //  print("Starteddd");
      });
    }
//--------------------------------
    //  print("........................................................");
    //  print(ParentID.length);
    /*   for (var j = 0; j < ParentID.length; j++) {
      //   print(ParentID[j]);
   
    }
*/
    // print(StudentName[0]);
  }

  /*Future GetNames(snap) async {
    List<String> StudentID = [];

    try {
      for (var i = 0; snap[i] != null; i++) {
        SnapCount += 1;
        StudentID.add(snap[i]["StudentID"]);
      }
    } catch (error) {
      //   print("error");
    }
    //print("SnapppppppppppppppppppppppppppppppCount");
    print(SnapCount);
    for (var j = 0; j < StudentID.length; j++) {
      await request.doc(StudentID[j]).get().then((value) {
        //StudentName.add(value.get('Name'));
        //   print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
        //   print("StID");
        //   print(StudentID[j]);

        //  print(StudentName[0]);
        // Access your after your get the data
        count = 1;

        StudentName.add(value["Name"]);
        ParentID.add(value["ParentId"]);
        //  print(value["ParentId"]);

        //  print("Starteddd");
        for (var i = 0; i < StudentName.length; i++) {
          //    print("*******************************************");
          print(StudentName[i]);
        }
      });
    }
//--------------------------------
    //  print("........................................................");
    //  print(ParentID.length);
    for (var j = 0; j < ParentID.length; j++) {
      //   print(ParentID[j]);
      await Parent.doc(ParentID[j]).get().then((value) {
        //StudentName.add(value.get('Name'));

        //    print("pID");
        //   print(ParentID[j]);

        //  print(StudentName[0]);
        // Access your after your get the data
        count = 1;

        ParentName.add(value["Name"]);
        //   print("=============================================");
        //  print(value["Name"]);
        //   print("Starteddd");
      });
    }*/

  // print(StudentName[0]);
  //}

  dynamic snackBar = SnackBar(
    duration: const Duration(milliseconds: 1500),
    content: Row(mainAxisAlignment: MainAxisAlignment.end, children: const [
      Text(
        " تم قبول طلب التفويض بنجاح",
        textAlign: TextAlign.right,
        style: TextStyle(
          color: Color(0xffA7A7A7),
        ),
      ),
      Icon(
        FontAwesomeIcons.check,
        size: 16,
        color: Color(0xffA7A7A7),
      ),
    ]),
  );
  Widget DialogAccepted(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      title: const Text(' طلب تفويض',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold)),
      content: const Text("تم قبول طلب التفويض بنجاح",
          textAlign: TextAlign.center,
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pop(
              context,
            );
          },
          child: const Text('موافق',
              style: TextStyle(
                  color: const Color(0xff0da6c2), fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }

  Widget CreateDialog3(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      title: const Text('حذف الطلب',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold)),
      content: const Text('هل انت متأكد انك تريد طلب التفويض هذا؟',
          textAlign: TextAlign.center,
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.pop(context);

              Req.DeleteRequests(ID);
            },
            child: const Text("موافق",
                style: TextStyle(
                    color: Color.fromARGB(255, 197, 24, 24),
                    fontWeight: FontWeight.bold))),
        TextButton(
          onPressed: () {
            Navigator.pop(
              context,
            );
          },
          child: const Text('إلغاء'),
        ),
      ],
    );
  }
}
