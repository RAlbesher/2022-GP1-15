import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:circlight/Pages/RequestDelegator.dart';
import 'NavParent.dart';
import 'package:circlight/Pages/Nav.dart';

import 'Screens/welcome_screen.dart';
import 'Viewparentprof.dart';

class ParentHome extends StatefulWidget {
  const ParentHome({Key? key}) : super(key: key);

  @override
  _ParentHome createState() => _ParentHome();
}

class _ParentHome extends State<ParentHome> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var ParentId = FirebaseAuth.instance.currentUser!.uid.toString();
  TextEditingController NName = TextEditingController();

  CollectionReference Announ =
      FirebaseFirestore.instance.collection('Announcement');
  CollectionReference Parent = FirebaseFirestore.instance.collection('Parent');
  CollectionReference NameParent =
      FirebaseFirestore.instance.collection('Parent');
  getParentName() async {
    await NameParent.doc(ParentId).get().then((value) {
      setState(() {
        NName..text = value["Name"];
      });
    });
  }

//////////////////////////////////////////////////i think i do not need
  List<String> docPname = [];
  List<String> StudentName = [];
  List<String> ParentName = [];
  List<String> ParentID = [];
  int CountStudent = -1;
  int SnapCount = 0;
  int ParentCount = -1;
  int count = 0;
  bool ShowAnnoun = false;
  RequestDelegator Req = new RequestDelegator(
      DName: "",
      Dusername: "",
      isAccepted: "false",
      isActive: "false",
      SID: "");
  var ID;
///////////////////////////////////////////////////////////////////////////////////////////////
  late AnimationController _ColorAnimationController;
  late AnimationController _TextAnimationController;
  late Animation _colorTween, _iconColorTween, _icon2ColorTween;
  late Animation<Offset> _transTween;
  double heightforcontainer = 100;
  @override
  Widget build(BuildContext context) {
    getParentName();
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
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(295, 6, 0, 0),
                    child: Text(
                      "أحدث الأخبار ",
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            fontSize: 17,
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
                            return Expanded(
                              child: ListView.builder(
                                // physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                primary: false,
                                itemCount: snap.length,
                                itemBuilder: (context, index) {
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
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
                                                                .fromSTEB(11, 4,
                                                                    4, 0),
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
                                                                1.12, 0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(8,
                                                                      8, 2, 8),
                                                          child: Container(
                                                            width: 3,
                                                            height: 240,
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
                                                                  .fromSTEB(
                                                                      0,
                                                                      55,
                                                                      0,
                                                                      10),
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
                                                                      0xFF57636C),
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
                              ),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}

String FormattedDatesnap(timeStamp) {
  var DateFromtimestamp =
      DateTime.fromMillisecondsSinceEpoch(timeStamp.seconds * 1000);
  return DateFormat('dd-MM-yyyy  hh:mm a').format(DateFromtimestamp);
}
