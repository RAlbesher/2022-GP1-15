import 'package:circlight/Pages/Admin.dart';
import 'package:circlight/Pages/Requests.dart';
import 'package:circlight/Pages/Student.dart';
import 'package:circlight/flutter_flow/flutter_flow_icon_button.dart';

import 'package:flutter/cupertino.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../home_page/home_page_widget.dart';
import 'CreateDelegator.dart';
import 'Nav.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

import 'package:circlight/Pages/Parent.dart';

import 'package:circlight/Pages/Nav.dart';
import 'package:flutter/cupertino.dart';

class Delegatordisplay extends StatefulWidget {
  var SName;
  Delegatordisplay({
    super.key,
    this.SName,
  });

  @override
  State<Delegatordisplay> createState() => _Paretdisplay();
}

class _Paretdisplay extends State<Delegatordisplay>
    with TickerProviderStateMixin {
  List<String> StudentName = [];
  List<String> StudentName2 = [];
  List<String> docPname = [];
  var IsIDExists = false;
  int count = 0;
  Future ParentName() async {
    await FirebaseFirestore.instance.collection("Requests").get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            // print(document["Email"]);

            docPname[count] = document["DelegatorName"];
            count += 1;
          }),
        );
  }

  CollectionReference reques =
      FirebaseFirestore.instance.collection('Requests');
  Future<bool> CheckForStudent(SID) async {
    var ID;
    var bol = true;
    List<String> IsActive = [];
    reques.get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            //  print("fffffffffffffffffffffffff");
            //  print("StudentID");
            //  print(document["StudentID"]);
            //   print("SID:");
            //   print(CurID);
            if (document["StudentID"] == SID) {
              print("222222222222222222222");
              if (document["IsActive"] == "true") {
                print("44444444444444444444444444444444");
                IsIDExists = true;
                bol = false;
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

  int SnapCount = 0;
  Student Studentx = new Student(
    Name: "",
    Class: "",
    SNationalID: "",
    SNationality: "",
    SUserName: "",
    SBloodType: "",
  );

  String Active = "";
  late bool IsAct = true;
  bool ShowRequest = false;
  bool isNull = true;
  String CurID = "";
  String RID = "";
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late AnimationController _ColorAnimationController;
  late AnimationController _TextAnimationController;
  late Animation _colorTween, _iconColorTween, _icon2ColorTween;
  late Animation<Offset> _transTween;
  CollectionReference ColStudent =
      FirebaseFirestore.instance.collection('Student');

  var SID;
  Request Req = new Request(
      DName: "", Dusername: "", isAccepted: false, isActive: "false", SID: "");

  var CurrentID;
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

    super.initState();
  }

  bool _scrollListener(ScrollNotification scrollInfo) {
    if (scrollInfo.metrics.axis == Axis.vertical) {
      _ColorAnimationController.animateTo(scrollInfo.metrics.pixels / 350);

      _TextAnimationController.animateTo(
          (scrollInfo.metrics.pixels - 350) / 50);
      return true;
    }

    return false;
  }

  int CountStudent = -1;
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

  @override
  Widget build(BuildContext context) {
    ParentName();
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: NotificationListener<ScrollNotification>(
          onNotification: _scrollListener,
          child: Container(
            height: double.infinity,
            child: Stack(
              children: <Widget>[
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(
                            height: 60,
                          ),
                          /* Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 80, 10, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 180,
                                ),
                                Align(
                                  alignment: Alignment(-0.7, -0.70),
                                  child: Text(
                                    ' مرحبًا نورة البشر',
                                    textAlign: TextAlign.right,
                                    style: FlutterFlowTheme.of(context)
                                        .title1
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: Color(0xFF101213),
                                          fontSize: 32,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () async {
                                    scaffoldKey.currentState!.openDrawer();
                                  },
                                  child: Container(
                                    width: 55,
                                    height: 55,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.asset(
                                      'assets/images/Screenshot_(399).png',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),*/
                          /* (
                            height: 0.2,
                            thickness: 1,
                            color: Color.fromARGB(255, 209, 209, 209),
                          ),*/
                          Container(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 20, left: 0, right: 0, bottom: 10),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment(-0.85, -0.70),
                                    child: Container(
                                      height: 45.0,
                                      width: 45.0,
                                      child: FittedBox(
                                        child: FloatingActionButton(
                                          onPressed: () {
                                            Navigator.of(context)
                                                .push(CupertinoPageRoute(
                                              builder: (context) =>
                                                  CreateDelegator(),
                                            ));
                                          },
                                          elevation: 0,
                                          child: Container(
                                            height: 70,
                                            width: 70,
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.2),
                                                  blurRadius: 6,
                                                ),
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(90),
                                              gradient: LinearGradient(
                                                colors: [
                                                  const Color(0xff0da6c2),
                                                  const Color(0xff57d77a)
                                                ],
                                              ),
                                            ),
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.white,
                                            ),
                                          ),
                                          backgroundColor:
                                              Color.fromARGB(0, 255, 253, 253),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                        right: 2, top: 0, left: 80, bottom: 0),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: 0, left: 20, right: 20),
                                      child: TextField(
                                        textAlign: TextAlign.right,
                                        decoration: InputDecoration(
                                            hintText: "..بحث",
                                            hintStyle: TextStyle(
                                                color: Colors.grey.shade600),
                                            prefixIcon: Icon(
                                              Icons.search,
                                              color: Colors.grey.shade600,
                                              size: 20,
                                            ),
                                            filled: true,
                                            fillColor: Colors.grey.shade100,
                                            contentPadding: EdgeInsets.all(8),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                borderSide: BorderSide(
                                                    color:
                                                        Colors.grey.shade100)),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                borderSide: BorderSide(
                                                    color:
                                                        Colors.grey.shade100))),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Align(
                              alignment: Alignment(0.91, -0.70),
                              child: Text(
                                ' الطلبات المفعلة',
                                textAlign: TextAlign.left,
                                style: FlutterFlowTheme.of(context)
                                    .title2
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: Color(0xFF101213),
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
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
                                      Admin().getAdminID(),
                                      Admin().ParentListView(),
                                      GetStudentName(snap),
                                    ]),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return ListView.builder(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          primary: false,
                                          itemCount: snap.length,
                                          itemBuilder: (context, index) {
                                            //dynamic v = docIDS[index];

                                            //   print("CountStudent");
                                            //   print(CountStudent);
                                            if (CountStudent < SnapCount) {
                                              CountStudent += 1;
                                            }
                                            IsAct = true;
                                            SCount += 1;
                                            RID = snap[index].reference.id;
                                            ShowRequest = false;
                                            // print(
                                            //     "aaaaaaaaaaaaaaaaaaaaaaaaaaa");
                                            Active = snap[index]["IsActive"];
                                            // print(RID);
                                            //   print(
                                            //      "+++++++++++++++++++++++++++");
                                            //print(IsAct);
                                            if (Active == "Pending") {
                                              IsAct = false;
                                              //print(RID);
                                              //print("MMMMMMMMMMMMMMM");
                                              //print(Active);
                                              // print(IsAct);
                                              if (Active == "true") {
                                                Req.UpdateRequest(
                                                    RID, "IsActive", "false");
                                              }
                                            }
                                            if (snap[index]["IsActive"] ==
                                                "false") {
                                              ShowRequest = false;
                                            } else if (snap[index]
                                                    ["IsActive"] ==
                                                "true") {
                                              ShowRequest = true;
                                            }
                                            return ShowRequest
                                                ? Container(
                                                    height: 70,
                                                    width: double.infinity,
                                                    margin:
                                                        const EdgeInsets.only(
                                                            bottom: 1),
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: Colors.white,
                                                      border: Border(
                                                        bottom: BorderSide(
                                                            color:
                                                                Colors.black12),
                                                      ),
                                                    ),
                                                    child: Stack(
                                                        alignment:
                                                            Alignment.center,
                                                        children: [
                                                          Align(
                                                            alignment: Alignment
                                                                .topRight,
                                                            child: Container(
                                                              width: 4,
                                                              height: 90,
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      right: 17,
                                                                      top: 10,
                                                                      bottom:
                                                                          10),
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .rectangle,
                                                                color: const Color(
                                                                    0xff0da6c2),
                                                                //color:
                                                                // Color(0xffD6D6D6),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4),
                                                              ),
                                                            ),
                                                          ),
                                                          //to only show the allowed people to admin

                                                          Container(
                                                            margin:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 90,
                                                                    bottom: 30),
                                                            alignment: Alignment
                                                                .center,
                                                            child: Text(
                                                              " المفوض" +
                                                                  " " +
                                                                  snap[index][
                                                                      'DelegatorName'],
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 15,
                                                                color: const Color(
                                                                    0xff0da6c2),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 69,
                                                          ),
                                                          Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left: 90,
                                                                      top: 20),
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Text(
                                                                " " +
                                                                    "  لطالب" +
                                                                    " " +
                                                                    StudentName[
                                                                        index],
                                                                style:
                                                                    const TextStyle(
                                                                  fontSize: 15,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          34,
                                                                          209,
                                                                          239),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              )),
                                                          //container for button
                                                          ///hola
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            //mainAxisSize:
                                                            // MainAxisSize.max,

                                                            /* mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,*/

                                                            children: <Widget>[
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10,
                                                                            0,
                                                                            4,
                                                                            0),
                                                                child: InkWell(
                                                                    // height: 80,

                                                                    onTap: () {
                                                                      CurrentID =
                                                                          snapshot.data![1]
                                                                              [
                                                                              index];
                                                                      //   print(
                                                                      //      "llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll");
                                                                      showCupertinoDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              CreateDialog2);
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width: 25,
                                                                      height:
                                                                          25,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(40),
                                                                        color: Color(
                                                                            0xFFE32121),
                                                                      ),
                                                                      child: const Center(
                                                                          child: Icon(
                                                                        Icons
                                                                            .close,
                                                                        color: Color.fromARGB(
                                                                            255,
                                                                            250,
                                                                            252,
                                                                            253),
                                                                        size:
                                                                            13,
                                                                      )),
                                                                    )),
                                                              ),
                                                              //Here

                                                              IsAct
                                                                  ? Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              10,
                                                                              0,
                                                                              4,
                                                                              0),
                                                                      child: InkWell(
                                                                          // height: 80,

                                                                          onTap: () {
                                                                            CurrentID =
                                                                                snapshot.data![1][index];
                                                                            //print(
                                                                            //    "RID");
                                                                            RID =
                                                                                snap[index].reference.id;
                                                                            //  print(
                                                                            //      RID);
                                                                            Req.UpdateRequest(
                                                                                RID,
                                                                                "IsActive",
                                                                                "false");
                                                                            /*   IsIDExists
                                                                          ? showCupertinoDialog(
                                                                              context:
                                                                                  context,
                                                                              builder:
                                                                                  CreateDialog3)
                                                                          : showCupertinoDialog(
                                                                              context: context,
                                                                              builder: CreateDialog2);*/
                                                                          },
                                                                          child: Container(
                                                                            width:
                                                                                25,
                                                                            height:
                                                                                25,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(40),
                                                                              color: Color(0xFF4CD755),
                                                                            ),
                                                                            child: const Center(
                                                                                child: Icon(
                                                                              Icons.close,
                                                                              color: Color.fromARGB(255, 250, 252, 253),
                                                                              size: 13,
                                                                            )),
                                                                          )),
                                                                    )
                                                                  : Text(
                                                                      "aaaaaaa"),
                                                            ],
                                                          ),
                                                        ]))
                                                : Text("");
                                          },
                                        );
                                      } else {
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }
                                    },
                                  ); /////////////
                                } else {
                                  return const SizedBox();
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment(0.91, -0.70),
                        child: Text(
                          ' الطلبات الغير مفعلة',
                          textAlign: TextAlign.left,
                          style: FlutterFlowTheme.of(context).title2.override(
                                fontFamily: 'Outfit',
                                color: Color(0xFF101213),
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
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
                                      Admin().getAdminID(),
                                      Admin().ParentListView(),
                                      GetStudentName2(snap),
                                    ]),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return ListView.builder(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          primary: false,
                                          itemCount: snap.length,
                                          itemBuilder: (context, index) {
                                            //dynamic v = docIDS[index];

                                            // print("CountStudent");
                                            // print(CountStudent);
                                            if (CountStudent < SnapCount) {
                                              CountStudent += 1;
                                            }

                                            SCount += 1;
                                            IsAct = true;

                                            Active = snap[index]["IsActive"];
                                            print(RID);
                                            print(
                                                "33333333333333333333333333333333333");
                                            print(IsAct);
                                            if (Active == "Pending") {
                                              IsAct = false;
                                              print(RID);
                                              print(
                                                  "sssssssssssssssssssssssssssss");
                                              print(Active);
                                              print(IsAct);
                                              if (Active == "true") {
                                                Req.UpdateRequest(
                                                    RID, "IsActive", "false");
                                              }
                                            }
                                            //  CurID = snap[index]["StudentID"];
                                            RID = snap[index].reference.id;
                                            ShowRequest = false;
                                            //print("showwwwwwwwwwwwwwwwwwwwwww");
                                            // print(snap[index]["IsActive"]);
                                            // print(RID);
                                            if (snap[index]["IsActive"] ==
                                                "false") {
                                              // print("snap[index]['IsActive']");
                                              // print(snap[index]["IsActive"]);
                                              ShowRequest = true;
                                            } else if (snap[index]
                                                    ["IsActive"] ==
                                                "Pending") {
                                              // print("snap[index]['IsActive']");
                                              // print(snap[index]["IsActive"]);
                                              ShowRequest = true;
                                            } else if (snap[index]
                                                    ["IsActive"] ==
                                                "true") {
                                              ShowRequest = false;
                                            }

                                            // print(ShowRequest);
                                            // print(RID);
                                            return ShowRequest
                                                ? Container(
                                                    height: 70,
                                                    width: double.infinity,
                                                    margin:
                                                        const EdgeInsets.only(
                                                            bottom: 1),
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: Colors.white,
                                                      border: Border(
                                                        bottom: BorderSide(
                                                            color:
                                                                Colors.black12),
                                                      ),
                                                    ),
                                                    child: Stack(
                                                        alignment:
                                                            Alignment.center,
                                                        children: [
                                                          Align(
                                                            alignment: Alignment
                                                                .topRight,
                                                            child: Container(
                                                              width: 4,
                                                              height: 90,
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      right: 17,
                                                                      top: 10,
                                                                      bottom:
                                                                          10),
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .rectangle,
                                                                color: const Color(
                                                                    0xff0da6c2),
                                                                //color:
                                                                // Color(0xffD6D6D6),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4),
                                                              ),
                                                            ),
                                                          ),
                                                          //to only show the allowed people to admin

                                                          Container(
                                                            margin:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 90,
                                                                    bottom: 30),
                                                            alignment: Alignment
                                                                .center,
                                                            child: Text(
                                                              " المفوض" +
                                                                  " " +
                                                                  snap[index][
                                                                      'DelegatorName'],
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 15,
                                                                color: const Color(
                                                                    0xff0da6c2),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 69,
                                                          ),
                                                          Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left: 90,
                                                                      top: 20),
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Text(
                                                                " " +
                                                                    "  لطالب" +
                                                                    " " +
                                                                    StudentName2[
                                                                        index],
                                                                style:
                                                                    const TextStyle(
                                                                  fontSize: 15,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          171,
                                                                          177,
                                                                          178),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              )),
                                                          //container for button

                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            //mainAxisSize:
                                                            // MainAxisSize.max,

                                                            /* mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,*/

                                                            children: <Widget>[
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10,
                                                                            0,
                                                                            4,
                                                                            0),
                                                                child: InkWell(
                                                                    // height: 80,

                                                                    onTap: () {
                                                                      CurrentID =
                                                                          snapshot.data![1]
                                                                              [
                                                                              index];

                                                                      ///
                                                                      ///
                                                                      ///
                                                                      ///
                                                                      ///
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width: 25,
                                                                      height:
                                                                          25,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(40),
                                                                        color: Color(
                                                                            0xFFE32121),
                                                                      ),
                                                                      child: const Center(
                                                                          child: Icon(
                                                                        Icons
                                                                            .close,
                                                                        color: Color.fromARGB(
                                                                            255,
                                                                            250,
                                                                            252,
                                                                            253),
                                                                        size:
                                                                            13,
                                                                      )),
                                                                    )),
                                                              ),
                                                              //Here
                                                              IsAct
                                                                  ? Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              10,
                                                                              0,
                                                                              4,
                                                                              0),
                                                                      child: InkWell(
                                                                          // height: 80,

                                                                          onTap: () async {
                                                                            /*  CurrentID =
                                                                          snapshot.data![1]
                                                                              [
                                                                              index];*/
                                                                            // print(
                                                                            //     "llllllllllllllllll");
                                                                            //  print(
                                                                            //     RID);
                                                                            CurID =
                                                                                snap[index]["StudentID"];

                                                                            RID =
                                                                                snap[index].reference.id;

                                                                            await Future.wait([
                                                                              CheckForStudent(CurID),
                                                                            ]);

                                                                            print("00000000000000000000000000000000000");

                                                                            //  print(
                                                                            //     "-=====000000000000000000000============");
                                                                            // print(
                                                                            //     CurID);
                                                                            // print(
                                                                            //     IsIDExists);
                                                                            //  print(
                                                                            //    IsIDExists);
                                                                            print("pppppppppppppppppppppppppp");

                                                                            print(IsIDExists);

                                                                            Future.delayed(Duration(seconds: 1),
                                                                                () {
                                                                              // print("Executed after 5 seconds");

                                                                              if (IsIDExists == true) {
                                                                                print("=========================");
                                                                                showCupertinoDialog(context: context, builder: CreateDialog33);
                                                                                IsIDExists = false;
                                                                              } else {
                                                                                Req.UpdateRequest(RID, "IsActive", "true");
                                                                              }
                                                                            });
                                                                          },
                                                                          child: Container(
                                                                            width:
                                                                                25,
                                                                            height:
                                                                                25,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(40),
                                                                              color: Color.fromARGB(255, 171, 181, 172),
                                                                            ),
                                                                            child: const Center(
                                                                                child: Icon(
                                                                              Icons.close,
                                                                              color: Color.fromARGB(255, 250, 252, 253),
                                                                              size: 13,
                                                                            )),
                                                                          )),
                                                                    )
                                                                  : Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              10,
                                                                              0,
                                                                              4,
                                                                              0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            25,
                                                                        height:
                                                                            25,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(40),
                                                                          color: Color.fromARGB(
                                                                              255,
                                                                              214,
                                                                              13,
                                                                              217),
                                                                        ),
                                                                        child: const Center(
                                                                            child: Icon(
                                                                          Icons
                                                                              .close,
                                                                          color: Color.fromARGB(
                                                                              255,
                                                                              250,
                                                                              252,
                                                                              253),
                                                                          size:
                                                                              13,
                                                                        )),
                                                                      ),
                                                                    ),
                                                            ],
                                                          ),
                                                        ]))
                                                : Text("");
                                          },
                                        );
                                      } else {
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }
                                    },
                                  ); /////////////
                                } else {
                                  return const SizedBox();
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 55,
                  child: AnimatedBuilder(
                    animation: _ColorAnimationController,
                    builder: (context, child) => AppBar(
                      elevation: 1.5,
                      backgroundColor: Colors.white,
                      iconTheme: IconThemeData(
                        color: _iconColorTween.value,
                      ),
                      automaticallyImplyLeading: false,
                      title: Text(
                        "قائمه المفوضين ",
                        textAlign: TextAlign.start,
                        style: TextStyle(color: _iconColorTween.value),
                      ),
                      centerTitle: true,
                      actions: [],
                      titleSpacing: 0.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget CreateDialog2(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      title: const Text('تنبيه',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold)),
      content: Text('تم تفعيل مفوض لهذا الطالب مسبقًا الرجاء  ',
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

  // Widget CreateDialog3(BuildContext context) {
  //   String Msg = "تجاهل التغييرات";

  //   return CupertinoAlertDialog(
  //     title: Text("حذف ولي أمر"),
  //     content: Text("هل انت متأكد انك تريد حذف ولي الأمر؟"),
  //     actions: [
  //       CupertinoDialogAction(
  //           onPressed: () {
  //             Navigator.push(context,
  //                 CupertinoPageRoute(builder: (context) => Paretdisplay()));
  //           },
  //           child: Text("الغاء")),
  //       CupertinoDialogAction(
  //           isDefaultAction: true,
  //           onPressed: () {
  //             Navigator.pop(context);
  //             parentx.DeleteParent(CurrentID);
  //           },
  //           child: Text("موافق")),
  //     ],
  //   );
  /*Future GetStudentName2(snap) async {
    // print("Entered!");
    int count2 = 0;
    String n = "lllllllllllllllllll";
    List<String> StudentID2 = [];
    print("entterrred");
    try {
      for (var i in snap) {
        StudentID2.add(i["StudentID"]);
        print("!!!!!!!!!!!!!!!!!!!!!!!!");
        print(i["StudentID"]);
      }
    } catch (error) {
      //  print("error");
    }
    // print("SnapppppppppppppppppppppppppppppppCount");
    // print(SnapCount);
    for (var j = 0; j < StudentID2.length; j++) {
      await request.doc(StudentID2[j]).get().then((value) {
        //StudentName.add(value.get('Name'));
        //  print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
        // print("StID");
        //  print(StudentID[j]);

        //  print(StudentName[0]);
        // Access your after your get the data
        count = 1;
        print("##############################################");
        print(value["Name"]);
        StudentName2.add(value["Name"]);
        // print("Starteddd");
      });
    }

    // print(StudentName[0]);
  }*/
  Future GetStudentName(snap) async {
    // print("Entered!");
    int count = 0;
    String n = "lllllllllllllllllll";
    List<String> StudentID = [];

    try {
      for (var i = 0; snap[i] != null; i++) {
        SnapCount += 1;
        StudentID.add(snap[i]["StudentID"]);
      }
    } catch (error) {
      //   print("error");
    }
    // print("SnapppppppppppppppppppppppppppppppCount");
    // print(SnapCount);
    for (var j = 0; j < StudentID.length; j++) {
      //    print("object");
      //   print(StudentID[j]);
      await ColStudent.doc(StudentID[j]).get().then((value) {
        //StudentName.add(value.get('Name'));
        //  print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
        // print("StID");
        // print(StudentID[j]);
        // print("3333333333333333333333");
        //  print(StudentName[0]);
        // Access your after your get the data
        count = 1;
        // print(value["Name"]);

        StudentName.add(value["Name"]);
        // print("Starteddd");
        // print("ennnnnnnnnnnnnnnddddddddddddddddddddd");
      });
    }

    // print(StudentName[0]);
  }

  Future GetStudentName2(snap) async {
    // print("Entered!");
    int count = 0;
    //  String n = "lllllllllllllllllll";
    List<String> StudentID2 = [];

    try {
      for (var i = 0; snap[i] != null; i++) {
        SnapCount += 1;
        StudentID2.add(snap[i]["StudentID"]);
      }
    } catch (error) {
      //   print("error");
    }
    // print("SnapppppppppppppppppppppppppppppppCount");
    // print(SnapCount);
    for (var j = 0; j < StudentID2.length; j++) {
      //   print("object");
      //   print(StudentID2[j]);
      await ColStudent.doc(StudentID2[j]).get().then((value) {
        //StudentName.add(value.get('Name'));
        //  print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
        // print("StID");
        // print(StudentID[j]);
        // print("3333333333333333333333");
        //  print(StudentName[0]);
        // Access your after your get the data
        count = 1;
        // print(value["Name"]);

        StudentName2.add(value["Name"]);
        // print("Starteddd");
        //  print("ennnnnnnnnnnnnnnddddddddddddddddddddd");
      });
    }

    // print(StudentName[0]);
  }

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
}
