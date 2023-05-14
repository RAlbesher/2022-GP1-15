import 'package:circlight/Pages/Nav.dart';
import 'package:circlight/Pages/PreviewReqAdmin.dart';
import 'package:circlight/Pages/RequestDone.dart';
import 'package:circlight/Pages/Student.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:circlight/Pages/RequestDelegator.dart';

import 'AdminPreviewRequest.dart';

class ListReqAdminn33 extends StatefulWidget {
  const ListReqAdminn33({Key? key}) : super(key: key);

  @override
  _ListReqAdmin createState() => _ListReqAdmin();
}

class _ListReqAdmin extends State<ListReqAdminn33>
    with TickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  CollectionReference request =
      FirebaseFirestore.instance.collection('Student');
  CollectionReference Parent = FirebaseFirestore.instance.collection('Parent');
  List<String> docPname = [];
  List<String> SNames2 = [];
  List<String> PNames2 = [];
  List<String> ParentID = [];
  List<String> SNames3 = [];
  List<String> PNames3 = [];
  List<String> StudentName3 = [];
  List<String> StudentName4 = [];
  int CountStudent = -1;
  int SnapCount = 0;
  int ParentCount = -1;
  int count = 0;
  bool ShowRequest = false;
  String Show = "true";

  String FormattedDatesnap(timeStamp) {
    var DateFromtimestamp =
        DateTime.fromMillisecondsSinceEpoch(timeStamp.seconds * 1000);
    return DateFormat('dd-MM-yyyy  hh:mm a').format(DateFromtimestamp);
  }

  TextEditingController Namex = TextEditingController();
  CollectionReference ColStudent =
      FirebaseFirestore.instance.collection('Student');
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
  String IDS = "";
  late AnimationController _ColorAnimationController;
  late AnimationController _TextAnimationController;
  late Animation _colorTween, _iconColorTween, _icon2ColorTween;
  late Animation<Offset> _transTween;
  CollectionReference reques =
      FirebaseFirestore.instance.collection('Requests');
  Future<bool> CheckForStudent(SID, RID) async {
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
            // print(RID);
            // print(document.reference.id);
            var equal = false;

            if (RID == document.reference.id) {
              equal = false;
              // print("it should be false");
            } else if (RID != document.reference.id) {
              equal = true;
            }
            if (equal) {
              if (document["StudentID"] == SID) {
                //   print("IM IN");
                // print("222222222222222222222");
                if (document["IsActive"] == "true" &&
                    document["isAccepted"] == "true" &&
                    document["DelegatorActive"] == "true") {
                  //  print("44444444444444444444444444444444");
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
    print("11111111111111111111111111111111111111111111");
    //print(currentDate);
    DateTime today = DateTime.now();
    String dateStr =
        "${today.year}-${today.month}-${today.day} ${today.hour}:${today.minute}";
    print(dateStr);
    return Scaffold(
      /*appBar: AppBar(
        elevation: 1.5,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: _iconColorTween.value,
        ),
        automaticallyImplyLeading: false,
        title: Text(
          "قائمه طلبات اولياء الأمور",
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
                                            /*  Navigator.push(
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
                                          "قائمه طلبات اولياء الأمور",
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
                  width: 15,
                ),
                Container(
                  height: 50,
                  width: 390,
                  //height: 230,
                  padding: EdgeInsets.only(right: 5, top: 5, left: 0),
                  child: Padding(
                    padding: EdgeInsets.only(right: 5, top: 0, left: 0),
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
                  width: 200,
                ),
                SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 00, 0, 0),
                  child: Align(
                    child: Text(
                      "الطلبات الحالية",
                      textAlign: TextAlign.left,
                      style: FlutterFlowTheme.of(context).title2.override(
                            fontFamily: 'Outfit',
                            color: Color(0xFF29294D),
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 0,
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
                      future: Future.wait([GetNames2(snap)]),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Align(
                              child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            primary: false,
                            itemCount: snap.length,
                            itemBuilder: (context, index) {
                              ShowRequest = true;
                              //  print("666666666666");

                              String str = snap[index]['Content'];
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
                              //find substring
                              result =
                                  result + str.substring(startIndex, endIndex);
                              var Stat;
                              if (snap[index]['Status'] == "Accepted") {
                                Stat = "مقبول";
                              } else if (snap[index]['Status'] == "rejected") {
                                Stat = "مرفوض";
                              } else if (snap[index]['Status'] == "Missing") {
                                Stat = "ناقص";
                              } else if (snap[index]['Status'] ==
                                  "InProgress") {
                                Stat = "تحت المعالجة";
                              }
                              if (snap[index]['Status'] == "InProgress") {
                                ShowRequest = true;
                              } else {
                                ShowRequest = false;
                              }
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
                                              Navigator.of(context)
                                                  .push(CupertinoPageRoute(
                                                      builder: (context) => Nav(
                                                            TabValue: 18,
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
                                                                0.81, -0.18),
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
                                                                SNames2[index],
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
                                                                  "assets/icons/Student.png",
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

              ///
              ///
              ///
              ///
              ///
              //
              SizedBox(
                height: 22,
              ),
              Align(
                alignment: Alignment(0.89, -0.9),
                child: Text(
                  "الطلبات السابقة",
                  textAlign: TextAlign.left,
                  style: FlutterFlowTheme.of(context).title2.override(
                        fontFamily: 'Outfit',
                        color: Color(0xFF29294D),
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ),
              SizedBox(
                width: 0,
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
                          return Align(
                              child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            primary: false,
                            itemCount: snap.length,
                            itemBuilder: (context, index) {
                              ShowRequest = true;
                              //  print("666666666666");

                              String str = snap[index]['Content'];
                              var RID = snap[index].reference.id;
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
                              //find substring
                              result =
                                  result + str.substring(startIndex, endIndex);
                              var Stat;
                              if (snap[index]['Status'] == "Accepted") {
                                Stat = "مقبول";
                              } else if (snap[index]['Status'] == "rejected") {
                                Stat = "مرفوض";
                              } else if (snap[index]['Status'] == "Missing") {
                                Stat = "ناقص";
                              } else if (snap[index]['Status'] ==
                                  "InProgress") {
                                Stat = "تحت المعالجة";
                              }
                              if (snap[index]['Status'] == "InProgress") {
                                ShowRequest = false;
                              } else {
                                ShowRequest = true;
                              }
                              return ShowRequest
                                  ? Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 12, 16, 0),
                                      child: Container(
                                          width: 330,
                                          height: 130,
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
                                              Navigator.of(context)
                                                  .push(CupertinoPageRoute(
                                                      builder: (context) => Nav(
                                                            TabValue: 18,
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
                                                                0.81, -0.18),
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
                                                                SNames2[index],
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
                                                                  "assets/icons/Student.png",
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
        print("111111111111111111111");
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

        SNames2.add(
            "ID" + " " + value["NationalID"] + "" + "للطالب  " + value["Name"]);

        //  print(value["ParentId"]);
      });
    }
//--------------------------------
    //  print("........................................................");
    //  print(ParentID.length);
    /* for (var j = 0; j < ParentID.length; j++) {
      //   print(ParentID[j]);
      await Parent.doc(ParentID[j]).get().then((value) {
        //StudentName.add(value.get('Name'));

        //    print("pID");
        //   print(ParentID[j]);

        //  print(StudentName[0]);
        // Access your after your get the data
        count = 1;

        //   print("=============================================");
        //  print(value["Name"]);
        //   print("Starteddd");
      });
    }
*/
    // print(StudentName[0]);
  }

  CollectionReference requestparent =
      FirebaseFirestore.instance.collection('Parent');
  Future GetNames2(snap) async {
    List<String> StudentID = [];
    List<String> ParentID2 = [];
    try {
      for (var i = 0; snap[i] != null; i++) {
        SnapCount += 1;
        StudentID.add(snap[i]["StudentID"]);
        // ParentID2.add(snap[i]["ParentID"]);
        print("55555555555555555555555555");
        print("121112222222222222222211111111111111111111");
      }
    } catch (error) {
      //   print("error");
    }
    //print("SnapppppppppppppppppppppppppppppppCount");
    //  print(SnapCount);
    for (var j = 0; j < StudentID.length; j++) {
      await request.doc(StudentID[j]).get().then((value) {
        count = 1;
        print("88888888888888888888888888");
        SNames2.add(
            "ID" + " " + value["NationalID"] + "" + "للطالب  " + value["Name"]);
      });
    }
    print("@@@@@@@@@@@@@@@@@@@@@@@@@@@");
    /*  for (var n = 0; n < ParentID2.length; n++) {
      print("+++++++++++++");
      await requestparent.doc(ParentID2[n]).get().then((value) {
        count = 1;
        print("999999999999999999999999999");
        PNames2.add(value["Name"]);
      });
    }*/
  }

  Future GetNames3(snap) async {
    List<String> StudentID = [];
    List<String> ParentID2 = [];
    try {
      for (var i = 0; snap[i] != null; i++) {
        SnapCount += 1;
        StudentID.add(snap[i]["StudentID"]);
        //ParentID2.add(snap[i]["ParentID"]);
        print("55555555555555555555555555");
        print("121112222222222222222211111111111111111111");
      }
    } catch (error) {
      //   print("error");
    }
    //print("SnapppppppppppppppppppppppppppppppCount");
    //  print(SnapCount);
    for (var j = 0; j < StudentID.length; j++) {
      await request.doc(StudentID[j]).get().then((value) {
        count = 1;
        print("88888888888888888888888888");
        SNames3.add("ID" +
            " " +
            value["NationalID"] +
            " " +
            "" +
            "للطالب  " +
            value["Name"]);
      });
    }
    print("@@@@@@@@@@@@@@@@@@@@@@@@@@@");
    /* for (var n = 0; n < ParentID2.length; n++) {
      print("+++++++++++++");
      await requestparent.doc(ParentID2[n]).get().then((value) {
        count = 1;
        print("999999999999999999999999999");
        PNames3.add(value["Name"]);
      });*/
    // }
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

  Future Fill() async {
    //var count = 0;
    //   print("99999999999999999999999999999999999");
    await FirebaseFirestore.instance.collection("Requests").get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            // print(document["Email"]);

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
    print("rend of this");
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
