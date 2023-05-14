import 'package:circlight/Pages/NavParent.dart';
import 'package:circlight/Pages/ReqMissing.dart';
import 'package:circlight/Pages/RequestDone.dart';
import 'package:circlight/Pages/Student.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'PreviewReqParent.dart';
import 'RequestDelegator.dart';

class ListReqq extends StatefulWidget {
  const ListReqq({Key? key}) : super(key: key);

  @override
  _ListRequest createState() => _ListRequest();
}

class _ListRequest extends State<ListReqq> with TickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  CollectionReference request =
      FirebaseFirestore.instance.collection('Student');
  CollectionReference Parent = FirebaseFirestore.instance.collection('Parent');
  List<String> docPname = [];
  List<String> StudentName = [];
  List<String> ParentName = [];
  List<String> StudentName5 = [];
  List<String> ParentName2 = [];
  List<String> ParentName5 = [];
  List<String> ParentID = [];
  List<String> ParentID2 = [];
  List<String> ParentID3 = [];
  List<String> StudentName2 = [];
  List<String> StudentName3 = [];
  List<String> StudentName4 = [];
  int CountStudent = -1;
  int SnapCount = 0;
  int ParentCount = -1;
  int count = 0;
  bool ShowRequest = false;
  String Show = "true";
  TextEditingController Namex = TextEditingController();
  CollectionReference ColStudent =
      FirebaseFirestore.instance.collection('Student');
  // String ParentId = "CTUnwiWUxilSbQtIrQcr";
  //var ParentId = FirebaseAuth.instance.currentUser!.uid.toString();
  var ParentId = "oskKOnpcSXgPfMC6gbMq4gBLcwi2";
  var DelegatorActive = "";
  List<bool> IsSwitch = [];
  var CountSwitch = 0;
  var IsIDExists = false;
  List<String> DelegatorID = [];

  RequestDelegator Req = new RequestDelegator(
      DName: "",
      Dusername: "",
      isAccepted: "false",
      isActive: "false",
      SID: "");
  var ID;
  String Active = "";
  String Accepted = "";
  late bool IsAct = true;
  var IsSwitched;
  var status = false;
  int CountItem = 9;
  bool SShow = true;

  bool isNull = true;
  String CurID = "";
  String RID = "";
  TextEditingController PaID = TextEditingController();
  bool NoRequest1 = false;
  bool NoRequest2 = false;
  String IDS = "";
  late AnimationController _ColorAnimationController;
  late AnimationController _TextAnimationController;
  late Animation _colorTween, _iconColorTween, _icon2ColorTween;
  late Animation<Offset> _transTween;
  CollectionReference reques =
      FirebaseFirestore.instance.collection('Requests');

  CollectionReference Reqparent2 =
      FirebaseFirestore.instance.collection('RequestParent');
  var noReq = -1;
  List<String> Pervious = [];
  /* PerviousRequest() {
    Pervious.clear();
    Reqparent2.get().then((snapshot) => snapshot.docs.forEach((document) {
          String PID2 = ParentID[count];

          if (document['Status'] == "Accepted" && PID2 == ParentId) {
            Pervious.add("value");
          } else if (document['Status'] == "rejected" && PID2 == ParentId) {
            Pervious.add("value");
          }
        }));
  }*/
/*
  var TopRequests = [];
  WaitingRequest() {
    TopRequests.clear();
    var Count = -1;
    Reqparent2.get().then((snapshot) => snapshot.docs.forEach((document) {
          Count += 1;
          String PID2 = ParentID[Count];

          if (document["Status"] == "Missing" && PID2 == ParentId) {
            TopRequests.add("Value");
            print("ppppppppppppppppppppppp");
            print(PID2);
          }
          if (document["Status"] == "InProgress" && PID2 == ParentId) {
            TopRequests.add("Value");
            print("33333333333333333333333");
            print(PID2);
          }
        }));
  }

  ParentRequest() async {
    var Count = -1;
    await WaitingRequest();
    Reqparent2.get().then((snapshot) => snapshot.docs.forEach((document) {
          Count += 1;

          ShowRequest = true;
          print("hhhhhhhhhhhhhhh");
          print(Count);
          print(document['Status']);
          String str = document['Content'];
          int endIndex = 0;
          int startIndex = 0;
          String result = "..";

          if (str.length > 30) {
            endIndex = 20;
          } else if (str.length > 25) {
            endIndex = 20;
          } else {
            endIndex = str.length;
          }

          result = result + str.substring(startIndex, endIndex);
          var Stat = "";

          String PID2 = ParentID[Count];
          print(ParentID[Count]);

          if (document['Status'] == "Accepted" &&
              PID2 == ParentId &&
              TopRequests.isEmpty == true) {
            Stat = "مقبول";
            ShowRequest = false;
            setState(() {
              NoRequest1 = false;
            });
          } else if (document['Status'] == "rejected" &&
              PID2 == ParentId &&
              TopRequests.isEmpty == true) {
            Stat = "مرفوض";
            ShowRequest = false;
            setState(() {
              NoRequest1 = false;
            });
          } else if (document['Status'] == "Missing" && PID2 == ParentId) {
            Stat = "ناقص";
            //  ShowRequest = true;
            setState(() {
              NoRequest1 = true;
              //  NoRequestDone = false;
              setState(() {
                noReq = 1;
              });
            });
          } else if (document['Status'] == "InProgress" && PID2 == ParentId) {
            Stat = "تحت المعالجة";
            //  ShowRequest = true;
            print("aaaaaaaaaaaaaaaaaaaaaaaaaa");

            setState(() {
              NoRequest1 = true;
              setState(() {
                noReq = 0;
              });
            });
          }
          if (PID2 != ParentId) {
            // ShowRequest = false;
            setState(() {
              NoRequest1 = true;
            });
          }
          //find substring
          var RID = document.reference.id;
        }));
  }

  ParentRequest2() async {
    await PerviousRequest();
    var Count = -1;

    Reqparent2.get().then((snapshot) => snapshot.docs.forEach((document) {
          Count += 1;

          ShowRequest = true;

          String str = document['Content'];
          int endIndex = 0;
          int startIndex = 0;
          String result = "..";
          var PID2 = ParentID3[Count];
          //  print("nmnmnmnmnmnmnm");
          //  print(PID2);

          if (str.length > 30) {
            endIndex = 20;
          } else if (str.length > 25) {
            endIndex = 20;
          } else {
            endIndex = str.length;
          }
          if (PID2 != ParentId) {
            ShowRequest = false;
          }

          result = result + str.substring(startIndex, endIndex);
          var Stat = "";
          //  String PID2 = ParentID[index];
          if (document['Status'] == "Accepted" && PID2 == ParentId) {
            Stat = "مقبول";
            ShowRequest = true;
            setState(() {
              NoRequest2 = true;
            });
          } else if (document['Status'] == "rejected" && PID2 == ParentId) {
            Stat = "مرفوض";
            ShowRequest = true;
            setState(() {
              NoRequest2 = true;
            });
          } else if (document['Status'] == "Missing" &&
              PID2 == ParentId &&
              Pervious.isEmpty == true) {
            Stat = "ناقص";
            ShowRequest = false;
            setState(() {
              NoRequest2 = false;
            });
          } else if (document['Status'] == "InProgress" &&
              PID2 == ParentId &&
              Pervious.isEmpty == true) {
            Stat = "تحت المعالجة";
            ShowRequest = false;
            setState(() {
              NoRequest2 = false;
            });
          }

          //find substring
          var RID = document.reference.id;
        }));
  }
*/
  Future<bool> CheckForStudent(SID, RID) async {
    var ID;
    var bol = true;
    List<String> IsActive = [];

    reques.get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            var equal = false;

            if (RID == document.reference.id) {
              equal = false;
            } else if (RID != document.reference.id) {
              equal = true;
            }
            if (equal) {
              if (document["StudentID"] == SID) {
                if (document["IsActive"] == "true" &&
                    document["isAccepted"] == "true" &&
                    document["DelegatorActive"] == "true") {
                  IsIDExists = true;
                  bol = false;
                }
              }
            }
          }),
        );

    if (!bol) {
      return Future.value(true);
    } else {
      return Future.value(false);
    }
    // return Future.value(false);
  }

  var SID;

  var CurrentID;
  late TabController _tabController;
  var SCount = 0;
  String Name = "";
  @override
  void initState() {
    _ColorAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 0));
    _colorTween = ColorTween(begin: Colors.transparent, end: Colors.white)
        .animate(_ColorAnimationController);
    _iconColorTween = ColorTween(begin: Colors.grey, end: Colors.grey)
        .animate(_ColorAnimationController);
    _icon2ColorTween =
        ColorTween(begin: Colors.white, end: const Color(0xff42c98d))
            .animate(_ColorAnimationController);

    _TextAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 0));

    _transTween = Tween(begin: Offset(-10, 40), end: Offset(-10, 0))
        .animate(_TextAnimationController);
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  final _selectedColor = const Color(0xff0da6c2);

  @override
  Widget build(BuildContext context) {
    String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    /* WaitingRequest();
    ParentRequest();

    ParentRequest2();*/
    DateTime today = DateTime.now();
    String dateStr =
        "${today.year}-${today.month}-${today.day} ${today.hour}:${today.minute}";

    return Scaffold(
      /* appBar: AppBar(
        elevation: 1.5,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: _iconColorTween.value,
        ),
        automaticallyImplyLeading: false,
        title: Text(
          "قائمه الطلبات ",
          textAlign: TextAlign.start,
          style: TextStyle(color: _iconColorTween.value),
        ),
        centerTitle: true,
        actions: [],
        titleSpacing: 0.0,
      ),*/
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
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
                            color: Colors.black26,
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
                            bottomLeft: Radius.circular(35),
                            bottomRight: Radius.circular(35),
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(0),
                          ),
                          child: Image.asset(
                            'assets/images/CirclightHeader.png',
                            width: 500.3,
                            height: 85,
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
                                        30, 36, 23, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            " ",
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 16,
                                                    color: Color.fromARGB(
                                                        255, 222, 58, 47)),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                CupertinoPageRoute(
                                                    builder: (context) =>
                                                        NavParent(
                                                          TabValue: 23,
                                                          documentId:
                                                              FirebaseAuth
                                                                  .instance
                                                                  .currentUser!
                                                                  .uid
                                                                  .toString(),
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
                                ],
                              ),
                            ),
                          ],
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
                                        50, 40, 0, 6),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "قائمة الطلبات",
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white),
                                        ),
                                      ],
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
              Row(children: [
                SizedBox(
                  height: 80,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                  child: Align(
                    // alignment: Alignment(-0.85, -0.45),
                    child: Container(
                      height: 41.0,
                      width: 41.0,
                      child: FittedBox(
                        child: FloatingActionButton(
                          onPressed: () {
                            Navigator.of(context).push(CupertinoPageRoute(
                                builder: (context) => NavParent(
                                      TabValue: 22,
                                    )));
                          },
                          elevation: 0,
                          child: Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.4),
                                  blurRadius: 6,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(90),
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xff0da6c2),
                                  Color(0xff0da6c2),
                                  Color(0xff0da6c2),
                                  Color(0xff0da6c2),
                                ],
                              ),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                              child: Center(
                                  child: Icon(
                                Icons.add,
                                size: 22,
                                color: Colors.white,
                              )),
                            ),
                          ),
                          backgroundColor: Color.fromARGB(0, 255, 253, 253),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: 340,
                  //height: 230,
                  padding: EdgeInsets.only(right: 5, top: 0, left: 5),
                  child: Padding(
                    padding: EdgeInsets.only(right: 5, top: 0, left: 5),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          //  searchname = value;
                        });
                      },
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                          hintText: "..بحث",
                          hintStyle: TextStyle(color: Colors.grey.shade600),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey.shade400,
                            size: 20,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.all(8),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade300)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade300))),
                    ),
                  ),
                ),
              ]),
              SizedBox(
                height: 7,
              ),
              Row(children: [
                SizedBox(
                  width: 90,
                ),
                SizedBox(
                  width: 220,
                ),
                Align(
                  alignment: Alignment(0.91, 0.9),
                  child: Text(
                    "الطلبات الحالية",
                    textAlign: TextAlign.left,
                    style: FlutterFlowTheme.of(context).title2.override(
                          fontFamily: 'Outfit',
                          color: Color(0xFF29294D),
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ]),
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("RequestParent")
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    final snap = snapshot.data!.docs;

                    return FutureBuilder(
                      future: Future.wait([GetNames(snap)]),
                      builder: (context, snapshot) {
                        if (snapshot.data?.length != 0) {
                          /* WaitingRequest();
                          ParentRequest();
                          print("================");
                          print(NoRequest1);*/
                          return /*NoRequest1
                              ?*/
                              Align(
                                  child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            primary: false,
                            itemCount: snap.length,
                            itemBuilder: (context, index) {
                              ShowRequest = true;

                              String str = snap[index]['Content'];
                              int endIndex = 0;
                              int startIndex = 0;
                              String result = "";

                              if (str.length > 30) {
                                result = "..";
                                endIndex = 20;
                              } else if (str.length > 25) {
                                result = "..";

                                endIndex = 20;
                              } else {
                                endIndex = str.length;
                              }

                              result =
                                  result + str.substring(startIndex, endIndex);
                              var Stat = "";

                              String PID2 = ParentID[index];
                              if (snap[index]['Status'] == "Accepted" &&
                                  PID2 == ParentId) {
                                Stat = "مقبول";
                                ShowRequest = false;
                              } else if (snap[index]['Status'] == "rejected" &&
                                  PID2 == ParentId) {
                                Stat = "مرفوض";
                                ShowRequest = false;
                              } else if (snap[index]['Status'] == "Missing" &&
                                  PID2 == ParentId) {
                                Stat = "ناقص";
                                ShowRequest = true;
                              } else if (snap[index]['Status'] ==
                                      "InProgress" &&
                                  PID2 == ParentId) {
                                Stat = "تحت المعالجة";
                                ShowRequest = false;
                              }
                              if (PID2 != ParentId) {
                                ShowRequest = false;
                              }
                              //find substring
                              var RID = snap[index].reference.id;

                              return ShowRequest
                                  ? Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 12, 16, 0),
                                      child: Container(
                                          width: 330,
                                          height: 90,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 3,
                                                color: Color(0x25000000),
                                                offset: Offset(0, 2),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  CupertinoPageRoute(
                                                      builder: (context) =>
                                                          NavParent(
                                                            TabValue: 19,
                                                            documentId: RID,
                                                          )));
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: 365,
                                                  child: Stack(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(11, 4,
                                                                    4, 0),
                                                        child: Text(
                                                          snap[index]["Date"],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color:
                                                                    Colors.grey,
                                                                fontSize: 9,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1.01, 0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(8,
                                                                      8, 4, 8),
                                                          child: Container(
                                                            width: 3,
                                                            height: 90,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFF2E295F),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.90, -0.89),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0,
                                                                      10,
                                                                      0,
                                                                      10),
                                                          child: Text(
                                                            snap[index]
                                                                ['Title'],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .title2
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: Color(
                                                                      0xFF101213),
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.90, -0.18),
                                                        child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        20,
                                                                        0,
                                                                        0),
                                                            child:
                                                                Wrap(children: [
                                                              Text(
                                                                result,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText2
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: Color(
                                                                          0xFF57636C),
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child:
                                                                    Image.asset(
                                                                  "assets/icons/Content.png",
                                                                  width: 16.5,
                                                                  height: 16.5,
                                                                  color: Color(
                                                                      0xFF57636C),
                                                                ),
                                                              )
                                                            ])),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.90, 0.74),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      9, 0, 0),
                                                          child: Wrap(
                                                              children: [
                                                                Text(
                                                                  Stat,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: Color(
                                                                            0xff0da6c2),
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  " حالة الطلب",
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: Color(
                                                                            0xFF57636C),
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                      ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  child: Image
                                                                      .asset(
                                                                    "assets/images/status.png",
                                                                    width: 16,
                                                                    height: 16,
                                                                  ),
                                                                )
                                                              ]),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(7, 30,
                                                                    0, 0),
                                                        child: Icon(
                                                          Icons
                                                              .chevron_left_rounded,
                                                          color:
                                                              Color(0xFF57636C),
                                                          size: 20,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )),
                                    )
                                  : SizedBox(
                                      height: 0,
                                    );
                            },
                          )); /**
                              : Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      180, 20, 20, 20),
                                  child: Text("لا توجد طلبات"));*/
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ); /////////////
                  } else {
                    return const Text("");
                  }
                },
              ),
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("RequestParent")
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    final snap = snapshot.data!.docs;

                    return FutureBuilder(
                      future: Future.wait([GetNames(snap)]),
                      builder: (context, snapshot) {
                        if (snapshot.data?.length != 0) {
                          /*WaitingRequest();
                          ParentRequest();
                          print("================");
                          print(NoRequest1);*/
                          return Align(
                              child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            primary: false,
                            itemCount: snap.length,
                            itemBuilder: (context, index) {
                              ShowRequest = true;

                              String str = snap[index]['Content'];
                              int endIndex = 0;
                              int startIndex = 0;
                              String result = "";

                              if (str.length > 30) {
                                result = "..";
                                endIndex = 20;
                              } else if (str.length > 25) {
                                result = "..";

                                endIndex = 20;
                              } else {
                                endIndex = str.length;
                              }

                              result =
                                  result + str.substring(startIndex, endIndex);
                              var Stat = "";

                              String PID2 = ParentID[index];
                              if (snap[index]['Status'] == "Accepted" &&
                                  PID2 == ParentId) {
                                Stat = "مقبول";
                                ShowRequest = false;
                              } else if (snap[index]['Status'] == "rejected" &&
                                  PID2 == ParentId) {
                                Stat = "مرفوض";
                                ShowRequest = false;
                              } else if (snap[index]['Status'] == "Missing" &&
                                  PID2 == ParentId) {
                                Stat = "ناقص";
                                ShowRequest = false;
                              } else if (snap[index]['Status'] ==
                                      "InProgress" &&
                                  PID2 == ParentId) {
                                Stat = "تحت المعالجة";
                                ShowRequest = true;
                              }
                              if (PID2 != ParentId) {
                                ShowRequest = false;
                              }
                              //find substring
                              var RID = snap[index].reference.id;

                              return ShowRequest
                                  ? Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 12, 16, 0),
                                      child: Container(
                                          width: 330,
                                          height: 90,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 3,
                                                color: Color(0x25000000),
                                                offset: Offset(0, 2),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  CupertinoPageRoute(
                                                      builder: (context) =>
                                                          NavParent(
                                                            TabValue: 28,
                                                            documentId: RID,
                                                          )));
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: 365,
                                                  child: Stack(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(11, 4,
                                                                    4, 0),
                                                        child: Text(
                                                          snap[index]["Date"],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color:
                                                                    Colors.grey,
                                                                fontSize: 9,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1.01, 0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(8,
                                                                      8, 4, 8),
                                                          child: Container(
                                                            width: 3,
                                                            height: 90,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFF2E295F),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.90, -0.89),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0,
                                                                      10,
                                                                      0,
                                                                      10),
                                                          child: Text(
                                                            snap[index]
                                                                ['Title'],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .title2
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: Color(
                                                                      0xFF101213),
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.90, -0.18),
                                                        child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        20,
                                                                        0,
                                                                        0),
                                                            child:
                                                                Wrap(children: [
                                                              Text(
                                                                result,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText2
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: Color(
                                                                          0xFF57636C),
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child:
                                                                    Image.asset(
                                                                  "assets/icons/Content.png",
                                                                  width: 16.5,
                                                                  height: 16.5,
                                                                  color: Color(
                                                                      0xFF57636C),
                                                                ),
                                                              )
                                                            ])),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.90, 0.74),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      9, 0, 0),
                                                          child: Wrap(
                                                              children: [
                                                                Text(
                                                                  Stat,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: Color(
                                                                            0xff0da6c2),
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  " حالة الطلب",
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: Color(
                                                                            0xFF57636C),
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                      ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  child: Image
                                                                      .asset(
                                                                    "assets/images/status.png",
                                                                    width: 16,
                                                                    height: 16,
                                                                  ),
                                                                )
                                                              ]),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(7, 30,
                                                                    0, 0),
                                                        child: Icon(
                                                          Icons
                                                              .chevron_left_rounded,
                                                          color:
                                                              Color(0xFF57636C),
                                                          size: 20,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )),
                                    )
                                  : SizedBox(
                                      height: 0,
                                    );
                            },
                          ));
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ); /////////////
                  } else {
                    return const Text("");
                  }
                },
              ),

              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment(0.91, 0.4),
                child: Text(
                  "الطلبات السابقة",
                  textAlign: TextAlign.left,
                  style: FlutterFlowTheme.of(context).title2.override(
                        fontFamily: 'Outfit',
                        color: Color(0xFF29294D),
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),

              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("RequestParent")
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    final snap = snapshot.data!.docs;

                    return FutureBuilder(
                      future: Future.wait([GetNames3(snap)]),
                      builder: (context, snapshot) {
                        if (snapshot.data?.length != 0) {
                          // ParentRequest2();
                          return /*NoRequest2
                              ?*/
                              Align(
                                  child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            primary: false,
                            itemCount: snap.length,
                            itemBuilder: (context, index) {
                              ShowRequest = true;

                              String str = snap[index]['Content'];
                              int endIndex = 0;
                              int startIndex = 0;
                              var PID2 = ParentID3[index];
                              String result = "";

                              if (str.length > 30) {
                                result = "..";
                                endIndex = 20;
                              } else if (str.length > 25) {
                                result = "..";

                                endIndex = 20;
                              } else {
                                endIndex = str.length;
                              }

                              result =
                                  result + str.substring(startIndex, endIndex);
                              var Stat = "";
                              //  String PID2 = ParentID[index];
                              if (snap[index]['Status'] == "Accepted" &&
                                  PID2 == ParentId) {
                                Stat = "مقبول";
                                ShowRequest = true;
                              } else if (snap[index]['Status'] == "rejected" &&
                                  PID2 == ParentId) {
                                Stat = "مرفوض";
                                ShowRequest = true;
                              } else if (snap[index]['Status'] == "Missing" &&
                                  PID2 == ParentId) {
                                Stat = "ناقص";
                                ShowRequest = false;
                              } else if (snap[index]['Status'] ==
                                      "InProgress" &&
                                  PID2 == ParentId) {
                                Stat = "تحت المعالجة";
                                ShowRequest = false;
                              }

                              //find substring
                              var RID = snap[index].reference.id;

                              return ShowRequest
                                  ? Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 12, 16, 0),
                                      child: Container(
                                          width: 330,
                                          height: 90,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 3,
                                                color: Color(0x25000000),
                                                offset: Offset(0, 2),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  CupertinoPageRoute(
                                                      builder: (context) =>
                                                          NavParent(
                                                            TabValue: 28,
                                                            documentId:
                                                                snap[index]
                                                                    .reference
                                                                    .id,
                                                          )));
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: 365,
                                                  child: Stack(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(11, 4,
                                                                    4, 0),
                                                        child: Text(
                                                          snap[index]["Date"],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color:
                                                                    Colors.grey,
                                                                fontSize: 9,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1.01, 0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(8,
                                                                      8, 4, 8),
                                                          child: Container(
                                                            width: 3,
                                                            height: 90,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFF2E295F),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.90, -0.89),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0,
                                                                      10,
                                                                      0,
                                                                      10),
                                                          child: Text(
                                                            snap[index]
                                                                ['Title'],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .title2
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: Color(
                                                                      0xFF101213),
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.90, -0.18),
                                                        child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        20,
                                                                        0,
                                                                        0),
                                                            child:
                                                                Wrap(children: [
                                                              Text(
                                                                result,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText2
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: Color(
                                                                          0xFF57636C),
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child:
                                                                    Image.asset(
                                                                  "assets/icons/Content.png",
                                                                  width: 16.5,
                                                                  height: 16.5,
                                                                  color: Color(
                                                                      0xFF57636C),
                                                                ),
                                                              )
                                                            ])),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.90, 0.74),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      9, 0, 0),
                                                          child: Wrap(
                                                              children: [
                                                                Text(
                                                                  Stat,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: Color(
                                                                            0xff0da6c2),
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  " حالة الطلب",
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: Color(
                                                                            0xFF57636C),
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                      ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  child: Image
                                                                      .asset(
                                                                    "assets/images/status.png",
                                                                    width: 16,
                                                                    height: 16,
                                                                  ),
                                                                )
                                                              ]),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(7, 30,
                                                                    0, 0),
                                                        child: Icon(
                                                          Icons
                                                              .chevron_left_rounded,
                                                          color:
                                                              Color(0xFF57636C),
                                                          size: 20,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )),
                                    )
                                  : SizedBox(
                                      height: 0,
                                    );
                            },
                          )); /*
                              : Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      180, 20, 20, 20),
                                  child: Text("لا توجد طلبات"));*/
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ); /////////////
                  } else {
                    return const Text("");
                  }
                },
              ),
              SizedBox(
                height: 50,
              ),
              //

              //

              Row(children: [
                SizedBox(
                  width: 15,
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget CreateDialog5(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      title: const Text(' حذف التفويض   ',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold)),
      content: const Text('هل انت متأكد انك تريد حذف التفويض ؟',
          textAlign: TextAlign.center,
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.pop(context);

              Req.DeleteRequests(RID);
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

  Future GetNames(snap) async {
    List<String> StudentID = [];

    try {
      for (var i = 0; snap[i] != null; i++) {
        SnapCount += 1;
        StudentID.add(snap[i]["StudentID"]);
        //  print("sdsdsdsd");
        //  print(snap[i]["StudentID"]);
      }
    } catch (error) {}

    for (var j = 0; j < StudentID.length; j++) {
      await request.doc(StudentID[j]).get().then((value) {
        count = 1;

        StudentName.add(value["Name"]);
        //   print(value["ParentId"]);
        ParentID.add(value["ParentId"]);
        for (var i = 0; i < StudentName.length; i++) {}
      });
    }

    for (var j = 0; j < ParentID.length; j++) {
      await Parent.doc(ParentID[j]).get().then((value) {
        count = 1;

        ParentName.add(value["Name"] + value["NationalID"]);
      });
    }

    for (var j = 0; j < ParentID.length; j++) {
      //  print("ssssssssssssssssssssssssssssssss");
      //    print(ParentID[j]);
    }
  }

  Future GetNames2(snap) async {
    List<String> StudentID2 = [];

    try {
      for (var i = 0; snap[i] != null; i++) {
        //  SnapCount += 1;
        StudentID2.add(snap[i]["StudentID"]);
        //  print("sdsdsdsd");
        //  print(snap[i]["StudentID"]);
      }
    } catch (error) {}

    for (var j = 0; j < StudentID2.length; j++) {
      await request.doc(StudentID2[j]).get().then((value) {
        // count = 1;

        StudentName2.add(value["Name"]);
        ParentID2.add(value["ParentId"]);
        //   for (var i = 0; i < StudentName2.length; i++) {}
      });
    }

    for (var j = 0; j < ParentID.length; j++) {
      await Parent.doc(ParentID[j]).get().then((value) {
        ParentName2.add(value["Name"] + value["NationalID"]);
      });
    }

    /* for (var j = 0; j < ParentID.length; j++) {
      //  print("ssssssssssssssssssssssssssssssss");
      //    print(ParentID[j]);
    }*/
  }

  ///
  ///
  ///
  ///
  ///
  Future GetNames3(snap) async {
    List<String> StudentID3 = [];

    try {
      for (var i = 0; snap[i] != null; i++) {
        //  SnapCount += 1;
        StudentID3.add(snap[i]["StudentID"]);
        //  print("sdsdsdsd");
        //  print(snap[i]["StudentID"]);
      }
    } catch (error) {}

    for (var j = 0; j < StudentID3.length; j++) {
      await request.doc(StudentID3[j]).get().then((value) {
        // count = 1;

        StudentName5.add(value["Name"]);
        //print(value["ParentId"]);
        ParentID3.add(value["ParentId"]);
        //   for (var i = 0; i < StudentName2.length; i++) {}
      });
    }

    for (var j = 0; j < ParentID.length; j++) {
      await Parent.doc(ParentID[j]).get().then((value) {
        ParentName5.add(value["Name"] + value["NationalID"]);
      });
    }

    /* for (var j = 0; j < ParentID.length; j++) {
      //  print("ssssssssssssssssssssssssssssssss");
      //    print(ParentID[j]);
    }*/
  }

  ///
  Widget CreateDialog33(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      title: const Text("!تنبيه",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold)),
      content: const Text(
          'يوجد لهذا الطالب  مفوض مفعل الرجاء إلغاء التفعيل لتفويض  آخر ',
          textAlign: TextAlign.center,
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("موافق",
                style: TextStyle(
                    color: Color.fromARGB(255, 197, 24, 24),
                    fontWeight: FontWeight.bold))),
      ],
    );
  }

  Future Fill() async {
    await FirebaseFirestore.instance.collection("Requests").get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            var bol;
            if (document["IsActive"] == "true" &&
                document["isAccepted"] == "true") {
              bol = true;
              IsSwitch.add(bol);
            } else if (document["IsActive"] == "false" &&
                document["isAccepted"] == "true") {
              bol = false;
              IsSwitch.add(bol);
            }

            //  count += 1;
          }),
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
