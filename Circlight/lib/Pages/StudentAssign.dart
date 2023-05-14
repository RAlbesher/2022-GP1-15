import 'package:circlight/Pages/Admin.dart';

import 'package:circlight/Pages/Student.dart';

import 'package:circlight/Pages/base_screen.dart';

import 'package:circlight/Pages/theme_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:circlight/Pages/Parent.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:circlight/Pages/Nav.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';
import '../flutter_flow/flutter_flow_theme.dart';
import 'header_widget.dart';
import 'package:get/get.dart';

class StudentAssign extends StatefulWidget {
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

  StudentAssign(
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
  State<StudentAssign> createState() => _StudentAssign();
}

class _StudentAssign extends State<StudentAssign>
    with TickerProviderStateMixin {
  var CurrentID;
  late AnimationController _ColorAnimationController;
  late AnimationController _TextAnimationController;
  late Animation _colorTween, _iconColorTween, _icon2ColorTween;
  late Animation<Offset> _transTween;

  @override
  void initState() {
    getParentName();
    _ColorAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 0));
    _colorTween = ColorTween(begin: Colors.transparent, end: Colors.white)
        .animate(_ColorAnimationController);
    _iconColorTween = ColorTween(begin: Colors.white, end: Colors.grey)
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

  Student StudentR = new Student(
    Name: "",
    Class: "",
    SNationalID: "",
    SNationality: "",
    SUserName: "",
    SBloodType: "",
  );
  String searchname = "";
  var parentid = FirebaseAuth.instance.currentUser!.uid.toString();

  CollectionReference ParentName =
      FirebaseFirestore.instance.collection('Parent');
  TextEditingController PName = TextEditingController();
  bool ShowStudent = false;

  getParentName() async {
    print(".....................");
    await ParentName.doc(
      widget.documentId,
    ).get().then((value) {
      print("lllllllllllllllllllnnnnnnnnnnnnnn");
      print(PName.text);
      setState(() {
        PName..text = value["Name"];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double _headerHeight = 150;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFEEEEEE),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    30, 36, 23, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                TextButton(
                                                  onPressed: () {},
                                                  child: Text(
                                                    " ",
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 16,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    222,
                                                                    58,
                                                                    47)),
                                                  ),
                                                ),

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
                                                    /*Navigator.push(
                                                  context,
                                                  CupertinoPageRoute(
                                                      builder: (context) =>
                                                          NavDel(
                                                            TabValue: 7,
                                                            DocId: FirebaseAuth
                                                                .instance
                                                                .currentUser!
                                                                .uid
                                                                .toString(),
                                                          )));*/
                                                  },
                                                  child: Container(
                                                    width: 40,
                                                    height: 40,
                                                    clipBehavior:
                                                        Clip.antiAlias,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    50, 40, 0, 6),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "قائمة الطلاب",
                                                  style: TextStyle(
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.w600,
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

                      Row(
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                            //padding: EdgeInsets.only(left: 20, top: 54),
                            child: Align(
                              //alignment: Alignment.centerLeft,
                              child: InkWell(
                                child: Container(
                                  // padding: const EdgeInsets.only(right: 5),
                                  width: 60,
                                  height: 45,
                                  margin: EdgeInsets.only(bottom: 20),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFF29294D),
                                  ),
                                  child: Center(
                                      child: Icon(
                                    Icons.add,
                                    size: 28,
                                    color: Color.fromARGB(255, 255, 244, 244),
                                  )),
                                ),
                                onTap: () {
                                  Navigator.of(context).push(CupertinoPageRoute(
                                    builder: (context) => Nav(
                                      documentId: widget.documentId,
                                      index: 1,
                                      Name: "",
                                      username: "",
                                      SID: "",
                                      TabValue: 8,
                                      header: false,
                                    ),
                                  ));
                                },
                              ),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 320,
                            //height: 230,
                            padding: EdgeInsets.only(right: 7, top: 0, left: 5),
                            child: Padding(
                              padding:
                                  EdgeInsets.only(right: 7, top: 0, left: 5),
                              child: TextField(
                                onChanged: (value) {
                                  setState(() {
                                    searchname = value;
                                  });
                                },
                                textAlign: TextAlign.right,
                                decoration: InputDecoration(
                                    hintText: "..بحث",
                                    hintStyle:
                                        TextStyle(color: Colors.grey.shade600),
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
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade300)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade300))),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                      //let's create a common header widget
                      SizedBox(
                        width: 182,
                      ),

                      Align(
                        alignment: Alignment(0.91, 0.9),
                        child: Text(
                          "أبناء ولي الأمر" + "  " + PName.text,
                          textAlign: TextAlign.left,
                          style: FlutterFlowTheme.of(context).title2.override(
                                fontFamily: 'Outfit',
                                color: Color(0xFF29294D),
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      StreamBuilder<QuerySnapshot>(
                        stream: (searchname != "" && searchname != null)
                            ? FirebaseFirestore.instance
                                .collection("Student")
                                .where("Search", arrayContains: searchname)
                                .snapshots()
                            : FirebaseFirestore.instance
                                .collection("Student")
                                .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasData) {
                            final snap = snapshot.data!.docs;
                            return FutureBuilder(
                                future: Future.wait([
                                  Admin().getAdminID(),
                                  Admin().StudentListveiw()
                                ]),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      primary: false,
                                      itemCount: snap.length,
                                      itemBuilder: (context, index) {
                                        if (snap[index]["ParentId"] ==
                                            widget.documentId)
                                          ShowStudent = true;
                                        else
                                          ShowStudent = false;

                                        //  print(ShowAnnoun);
                                        return ShowStudent
                                            ? Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(5, 5, 5, 5),
                                                child: Container(
                                                    width: 367.6,
                                                    height: 58.3,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4,
                                                          color:
                                                              Color(0x33000000),
                                                          offset: Offset(0, 2),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 3,
                                                            color: Color(
                                                                0x25000000),
                                                            offset:
                                                                Offset(0, 2),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      child: Stack(
                                                          alignment:
                                                              Alignment.center,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.94,
                                                                      0.08),
                                                              child: Container(
                                                                width: 3,
                                                                height: 42,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFF29294D),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20),
                                                                ),
                                                              ),
                                                            ), //to only show the allowed people to admin
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.77,
                                                                      -0.59),
                                                              child: Text(
                                                                snap[index]
                                                                    ['Name'],
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: Color(
                                                                          0xFF101213),
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              ),
                                                            ),
                                                            /* Row(
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
                                                              InkWell(
                                                                onTap: () async {
                                                                  await StudentR.Existstudent(
                                                                      CurrentID =
                                                                          snapshot.data![1]
                                                                              [
                                                                              index],
                                                                      widget
                                                                          .documentId,
                                                                      snap[index][
                                                                          'Name'],
                                                                      snap[index][
                                                                          'UserName'],
                                                                      snap[index][
                                                                          'NationalID'],
                                                                      snap[index][
                                                                          'Nationality'],
                                                                      snap[index][
                                                                          'Class'],
                                                                      snap[index][
                                                                          'BloodType'],
                                                                      "gqvxZab1CsHCgT9kZgel");
                                                                  await showCupertinoDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          CreateDialog);
                                                                },
                                                                child: Container(
                                                                    width: 60,
                                                                    height: 50,
                                                                    margin: EdgeInsets
                                                                        .only(
                                                                            bottom:
                                                                                20,
                                                                            left:
                                                                                10),
                                                                    child: Center(
                                                                        child:
                                                                            Icon(
                                                                      size: 22,
                                                                      FontAwesomeIcons
                                                                          .personCirclePlus,
                                                                      color:
                                                                          Color(
                                                                        0xFF29294D,
                                                                      ),
                                                                    ))), /* Image.asset(
                                                                'assets/images/addStudent.jpeg',
                                                                height: 30,
                                                                width: 45,
                                                                fit: BoxFit
                                                                    .contain,
                                                              )*/
                                                              ),
                                                            ],
                                                          ), */ //container for button
                                                          ]),
                                                    )),
                                              )
                                            : Container();
                                      },
                                    );
                                  } else {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                });
                          } else {
                            return const SizedBox();
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment(0.91, 0.9),
                        child: Text(
                          "الطلاب",
                          textAlign: TextAlign.left,
                          style: FlutterFlowTheme.of(context).title2.override(
                                fontFamily: 'Outfit',
                                color: Color(0xFF29294D),
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      StreamBuilder<QuerySnapshot>(
                        stream: (searchname != "" && searchname != null)
                            ? FirebaseFirestore.instance
                                .collection("Student")
                                .where("Search", arrayContains: searchname)
                                .snapshots()
                            : FirebaseFirestore.instance
                                .collection("Student")
                                .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasData) {
                            final snap = snapshot.data!.docs;
                            return FutureBuilder(
                                future: Future.wait([
                                  Admin().getAdminID(),
                                  Admin().StudentListveiw()
                                ]),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      primary: false,
                                      itemCount: snap.length,
                                      itemBuilder: (context, index) {
                                        if (snap[index]["ParentId"] !=
                                            widget.documentId)
                                          ShowStudent = true;
                                        else
                                          ShowStudent = false;

                                        //  print(ShowAnnoun);
                                        return ShowStudent
                                            ? Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(5, 5, 5, 5),
                                                child: Container(
                                                    width: 367.6,
                                                    height: 58.3,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4,
                                                          color:
                                                              Color(0x33000000),
                                                          offset: Offset(0, 2),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 3,
                                                            color: Color(
                                                                0x25000000),
                                                            offset:
                                                                Offset(0, 2),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      child: Stack(
                                                          alignment:
                                                              Alignment.center,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.94,
                                                                      0.08),
                                                              child: Container(
                                                                width: 3,
                                                                height: 42,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFF29294D),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20),
                                                                ),
                                                              ),
                                                            ), //to only show the allowed people to admin
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.77,
                                                                      -0.59),
                                                              child: Text(
                                                                snap[index]
                                                                    ['Name'],
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: Color(
                                                                          0xFF101213),
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              ),
                                                            ),
                                                            /* Container(
                                                            margin:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 90),
                                                            alignment:
                                                                Alignment.center,
                                                            child: Text(
                                                              snap[index]['Name'],
                                                              style:
                                                                  const TextStyle(
                                                                color: Color(
                                                                    0xff0da6c2),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ),*/
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

                                                              children: <
                                                                  Widget>[
                                                                InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    await StudentR.Existstudent(
                                                                        CurrentID = snapshot.data![1]
                                                                            [
                                                                            index],
                                                                        widget
                                                                            .documentId,
                                                                        snap[index]
                                                                            [
                                                                            'Name'],
                                                                        snap[index]
                                                                            [
                                                                            'UserName'],
                                                                        snap[index]
                                                                            [
                                                                            'NationalID'],
                                                                        snap[index]
                                                                            [
                                                                            'Nationality'],
                                                                        snap[index]
                                                                            [
                                                                            'Class'],
                                                                        snap[index]
                                                                            [
                                                                            'BloodType'],
                                                                        "gqvxZab1CsHCgT9kZgel",
                                                                        snap[index]
                                                                            [
                                                                            'Search']);
                                                                    await showCupertinoDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            CreateDialog);
                                                                  },
                                                                  child: Container(
                                                                      width: 60,
                                                                      height: 50,
                                                                      margin: EdgeInsets.only(bottom: 20, left: 10),
                                                                      child: Center(
                                                                          child: Icon(
                                                                        size:
                                                                            20,
                                                                        FontAwesomeIcons
                                                                            .personCirclePlus,
                                                                        color:
                                                                            Color(
                                                                          0xFF29294D,
                                                                        ),
                                                                      ))), /* Image.asset(
                                                                'assets/images/addStudent.jpeg',
                                                                height: 30,
                                                                width: 45,
                                                                fit: BoxFit
                                                                    .contain,
                                                              )*/
                                                                ),
                                                              ],
                                                            ), //container for button
                                                          ]),
                                                    )),
                                              )
                                            : Container();
                                      },
                                    );
                                  } else {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                });
                          } else {
                            return const SizedBox();
                          }
                        },
                      )
                    ],
                  ),
                ),
                Container(
                  height: 40,
                  child: AnimatedBuilder(
                    animation: _ColorAnimationController,
                    builder: (context, child) => AppBar(
                      elevation: 0,
                      iconTheme: IconThemeData(
                        color: _iconColorTween.value,
                      ),
                      automaticallyImplyLeading: false,
                      centerTitle: true,
                      actions: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => Nav(
                                          TabValue: 0,
                                          documentId: "",
                                        )));
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: _iconColorTween.value,
                          ),
                          color: Colors.white,
                        ),
                      ],
                      backgroundColor: _colorTween.value,
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
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("موافق",
                style: TextStyle(
                    color: Color.fromARGB(255, 197, 24, 24),
                    fontWeight: FontWeight.bold))),
      ],
    );
  }
}
