import 'package:circlight/Pages/Nav.dart';
import 'package:circlight/Pages/NavParent.dart';
import 'package:circlight/Pages/Student.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:circlight/Pages/RequestDelegator.dart';

class AnnounParent extends StatefulWidget {
  @override
  State<AnnounParent> createState() => _AnnounParent();
}

class _AnnounParent extends State<AnnounParent> with TickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  CollectionReference Announ =
      FirebaseFirestore.instance.collection('Announcement');
  CollectionReference Parent = FirebaseFirestore.instance.collection('Parent');
  late AnimationController _ColorAnimationController;
  late AnimationController _TextAnimationController;
  late Animation _colorTween, _iconColorTween, _icon2ColorTween;
  late Animation<Offset> _transTween;
  final _selectedColor = const Color(0xff0da6c2);
  late TabController _tabController;
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

  bool ShowAnnoun = false;

  final _tabs = [
    Tab(text: 'Tab1'),
    Tab(text: 'Tab2'),
  ];
  double heightforcontainer = 100;
  String searchname = "";
  var parentid = FirebaseAuth.instance.currentUser!.uid.toString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: TabBarView(controller: _tabController, children: <Widget>[
        SafeArea(
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
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 16,
                                                          color: Color.fromARGB(
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
                                              Navigator.push(
                                                  context,
                                                  CupertinoPageRoute(
                                                      builder: (context) =>
                                                          NavParent(
                                                            documentId:
                                                                FirebaseAuth
                                                                    .instance
                                                                    .currentUser!
                                                                    .uid
                                                                    .toString(),
                                                            Confirm: false,
                                                            TabValue: 23,
                                                            TheValue: '',
                                                            whichpag: 0,
                                                            DropDown: false,
                                                            index: 1,
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
                                            "قائمة الإعلانات ",
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
                new PreferredSize(
                  preferredSize: new Size(8000.0, 200.0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(240, 10, 0, 0),
                    child: new Container(
                      width: 180.0,
                      height: 40,
                      child: TabBar(
                        controller: _tabController,
                        unselectedLabelColor: Colors.grey,
                        labelColor: _selectedColor,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(80.0),
                          color: _selectedColor.withOpacity(0.2),
                        ),
                        tabs: const <Widget>[
                          Tab(
                            child: Text(
                              "الإعلانات العامة ",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w600),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "الإعلانات الخاصة",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ), //
                    ),
                  ),
                ),
                Divider(color: Colors.grey),
                Row(children: [
                  Container(
                    height: 40,
                    width: 390,
                    //height: 230,
                    padding: EdgeInsets.only(right: 5, top: 0, left: 5),
                    child: Padding(
                      padding: EdgeInsets.only(right: 5, top: 0, left: 5),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            searchname = value;
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
                    width: 15,
                  ),
                  Align(
                    alignment: Alignment(0.91, 0.9),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                    ),
                  ),
                  SizedBox(
                    width: 182,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ]),
                SizedBox(
                  height: 20,
                ),
                Row(children: [
                  SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                    width: 175,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(90, 0, 0, 0),
                    child: Text(
                      "الإعلانات العامة ",
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                          ),
                    ),
                  ),
                  /* Align(
                    alignment: Alignment(0.91, 0.9),
                    child: Text(
                      "الإعلانات العامة ",
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).title2.override(
                            fontFamily: 'Outfit',
                            color: Color(0xFF29294D),
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),*/
                  SizedBox(
                    width: 10,
                  ),
                ]),
                StreamBuilder<QuerySnapshot>(
                  stream: (searchname != "" && searchname != null)
                      ? FirebaseFirestore.instance
                          .collection("Announcement")
                          .where("Search", arrayContains: searchname)
                          .snapshots()
                      : FirebaseFirestore.instance
                          .collection("Announcement")
                          .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasData) {
                      final snap = snapshot.data!.docs;
                      return FutureBuilder(
                        future: Future.wait([
                          //GetNames(snap),
                        ]),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              primary: false,
                              itemCount: snap.length,
                              itemBuilder: (context, index) {
                                //print("CountStudent");
                                // print(CountStudent);
                                /*if (CountStudent < SnapCount) {
                                  CountStudent += 1;
                                }*/
                                // print(snap[index]["status"]);

                                if (snap[index]["status"] == "Public")
                                  ShowAnnoun = true;
                                else
                                  ShowAnnoun = false;
                                if (snap[index]['image'] != null) {
                                  heightforcontainer = 280;
                                } else {
                                  heightforcontainer = 100;
                                }

                                //  print(ShowAnnoun);
                                return ShowAnnoun
                                    ? Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 12, 16, 0),
                                        child: Container(
                                          width: 330,
                                          height: heightforcontainer,
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
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: 340,
                                                child: Stack(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  11, 4, 4, 0),
                                                      child: Text(
                                                        FormattedDatesnap(
                                                            snap[index]
                                                                ['Date']),
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
                                                                .fromSTEB(
                                                                    8, 8, 2, 8),
                                                        child: Container(
                                                          width: 3,
                                                          height: 200,
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
                                                                .fromSTEB(0, 10,
                                                                    0, 10),
                                                        child: Text(
                                                          snap[index]
                                                              ['Address'],
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
                                                              0.90, -0.89),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 60,
                                                                    0, 10),
                                                        child: Text(
                                                          snap[index]
                                                              ['message'],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .title2
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: Color(
                                                                    0xFF101213),
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      4,
                                                                      20,
                                                                      0,
                                                                      10),
                                                          child: Wrap(
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          35,
                                                                          0,
                                                                          0),
                                                                  child: snap[index]
                                                                              [
                                                                              'image'] !=
                                                                          null
                                                                      ? Expanded(
                                                                          child: Container(
                                                                              height: 100,
                                                                              width: 200,
                                                                              decoration: BoxDecoration(
                                                                                  border: Border.all(
                                                                                    width: 2,
                                                                                  ),
                                                                                  color: Colors.black12),
                                                                              child: Image.network(
                                                                                snap[index]['image'].toString() ?? "",
                                                                                fit: BoxFit.cover,
                                                                              )),
                                                                        )
                                                                      : Container(),
                                                                ),
                                                              ])),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    snap[index]["important"] ==
                                                            true
                                                        ? Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        7,
                                                                        30,
                                                                        0,
                                                                        0),
                                                            child: Icon(
                                                              Icons.flag,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      233,
                                                                      8,
                                                                      8),
                                                              size: 16,
                                                            ),
                                                          )
                                                        : Text(""),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    : SizedBox(
                                        height: 0,
                                      );
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
                      return const Text("");
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        Stack(
          children: [
            SafeArea(
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
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              TextButton(
                                                onPressed: () {},
                                                child: Text(
                                                  " ",
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 16,
                                                          color: Color.fromARGB(
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
                                                  Navigator.push(
                                                      context,
                                                      CupertinoPageRoute(
                                                          builder: (context) =>
                                                              NavParent(
                                                                documentId: FirebaseAuth
                                                                    .instance
                                                                    .currentUser!
                                                                    .uid
                                                                    .toString(),
                                                                Confirm: false,
                                                                TabValue: 23,
                                                                TheValue: '',
                                                                whichpag: 0,
                                                                DropDown: false,
                                                                index: 1,
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
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "قائمة الإعلانات ",
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
                      new PreferredSize(
                        preferredSize: new Size(8000.0, 200.0),
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(193, 10, 0, 10),
                          child: new Container(
                            width: 155.0,
                            height: 40,
                            child: TabBar(
                              controller: _tabController,
                              unselectedLabelColor: Colors.grey,
                              labelColor: _selectedColor,
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(80.0),
                                color: _selectedColor.withOpacity(0.2),
                              ),
                              tabs: const <Widget>[
                                Tab(
                                  child: Text(
                                    "الإعلانات العامة ",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    "الإعلانات الخاصه",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ), //
                          ),
                        ),
                      ),
                    ]),
                    Divider(
                      color: Colors.grey,
                    ),
                    Row(children: [
                      Container(
                        height: 40,
                        width: 390,
                        //height: 230,
                        padding: EdgeInsets.only(right: 5, top: 0, left: 5),
                        child: Padding(
                          padding: EdgeInsets.only(right: 5, top: 0, left: 5),
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
                    ]),
                    SizedBox(
                      height: 7,
                    ),
                    Row(children: [
                      SizedBox(
                        width: 15,
                      ),
                      Align(
                        alignment: Alignment(0.91, 0.9),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                        ),
                      ),
                      SizedBox(
                        width: 182,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ]),
                    SizedBox(
                      height: 20,
                    ),
                    Row(children: [
                      SizedBox(
                        width: 175,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(90, 0, 0, 0),
                        child: Text(
                          "الإعلانات الخاصة ",
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                  ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ]),
                    StreamBuilder<QuerySnapshot>(
                      stream: (searchname != "" && searchname != null)
                          ? FirebaseFirestore.instance
                              .collection("Announcement")
                              .where("Search", arrayContains: searchname)
                              .snapshots()
                          : FirebaseFirestore.instance
                              .collection("Announcement")
                              .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasData) {
                          final snap = snapshot.data!.docs;
                          return FutureBuilder(
                              future: Future.wait([
                                //GetNames(snap),
                              ]),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    primary: false,
                                    itemCount: snap.length,
                                    itemBuilder: (context, index) {
                                      if (snap[index]["status"] == "Private" &&
                                          snap[index]['ParentID'] == parentid)
                                        ShowAnnoun = true;
                                      else
                                        ShowAnnoun = false;
                                      if (snap[index]['image'] != null) {
                                        heightforcontainer = 280;
                                      } else {
                                        heightforcontainer = 100;
                                      }

                                      //  print(ShowAnnoun);
                                      return ShowAnnoun
                                          ? Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(16, 12, 16, 0),
                                              child: Container(
                                                width: 330,
                                                height: heightforcontainer,
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
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      width: 340,
                                                      child: Stack(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        11,
                                                                        4,
                                                                        4,
                                                                        0),
                                                            child: Text(
                                                              FormattedDatesnap(
                                                                  snap[index]
                                                                      ['Date']),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Outfit',
                                                                    color: Colors
                                                                        .grey,
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
                                                                      .fromSTEB(
                                                                          8,
                                                                          8,
                                                                          2,
                                                                          8),
                                                              child: Container(
                                                                width: 3,
                                                                height: 200,
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
                                                                    0.90,
                                                                    -0.89),
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
                                                                    ['Address'],
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .title2
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: Color(
                                                                          0xFF101213),
                                                                      fontSize:
                                                                          16,
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
                                                                    0.90,
                                                                    -0.89),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          60,
                                                                          0,
                                                                          10),
                                                              child: Text(
                                                                snap[index]
                                                                    ['message'],
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .title2
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
                                                          ),
                                                          Align(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4,
                                                                            20,
                                                                            0,
                                                                            10),
                                                                child: Wrap(
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10,
                                                                            35,
                                                                            0,
                                                                            0),
                                                                        child: snap[index]['image'] !=
                                                                                null
                                                                            ? Expanded(
                                                                                child: Container(
                                                                                    height: 100,
                                                                                    width: 200,
                                                                                    decoration: BoxDecoration(
                                                                                        border: Border.all(
                                                                                          width: 2,
                                                                                        ),
                                                                                        color: Colors.black12),
                                                                                    child: Image.network(
                                                                                      snap[index]['image'].toString() ?? "",
                                                                                      fit: BoxFit.cover,
                                                                                    )),
                                                                              )
                                                                            : Container(),
                                                                      ),
                                                                    ])),
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          snap[index]["important"] ==
                                                                  true
                                                              ? Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          7,
                                                                          30,
                                                                          0,
                                                                          0),
                                                                  child: Icon(
                                                                    Icons.flag,
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            233,
                                                                            8,
                                                                            8),
                                                                    size: 16,
                                                                  ),
                                                                )
                                                              : Text(""),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          : SizedBox(
                                              height: 0,
                                            );
                                    },
                                  );
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
                    SizedBox(
                      height: 20,
                    ),
                    Row(children: [
                      SizedBox(
                        width: 15,
                      ),
                    ]),
                  ],
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }
}

String FormattedDatesnap(timeStamp) {
  var DateFromtimestamp =
      DateTime.fromMillisecondsSinceEpoch(timeStamp.seconds * 1000);
  return DateFormat('dd-MM-yyyy  hh:mm a').format(DateFromtimestamp);
}
