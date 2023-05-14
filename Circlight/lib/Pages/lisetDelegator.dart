import 'package:circlight/Pages/NavDelegator.dart';
import 'package:circlight/Pages/NavParent.dart';
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

import 'RequestDelegator.dart';
import 'Screens/welcome_screen.dart';

class ListDelegatorx extends StatefulWidget {
  const ListDelegatorx({Key? key}) : super(key: key);

  @override
  _ListDelegator createState() => _ListDelegator();
}

class _ListDelegator extends State<ListDelegatorx>
    with TickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  CollectionReference request =
      FirebaseFirestore.instance.collection('Student');
  CollectionReference Parent = FirebaseFirestore.instance.collection('Parent');
  List<String> docPname = [];
  List<String> StudentName = [];
  List<String> ParentName = [];
  List<String> ParentID = [];

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
  CollectionReference DelegatorCollection =
      FirebaseFirestore.instance.collection('Delegator');

  List<String> StudentName2 = [];
  List<String> DelegatorrNam2 = [];
  List<String> DelegatorrNam3 = [];
  List<String> DelegatorrNam4 = [];

  List<String> DelegatorrNam = [];
  // var ParentId = FirebaseAuth.instance.currentUser!.uid.toString();
  var ParentId = "oskKOnpcSXgPfMC6gbMq4gBLcwi2";
  List<String> StudentName5 = [];
  List<String> DelegatorrNam5 = [];
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
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  String FormattedDatesnap(timeStamp) {
    var DateFromtimestamp =
        DateTime.fromMillisecondsSinceEpoch(timeStamp.seconds * 1000);
    return DateFormat('dd-MM-yyyy  hh:mm a').format(DateFromtimestamp);
  }

  final _selectedColor = const Color(0xff0da6c2);

  @override
  Widget build(BuildContext context) {
    String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

    DateTime today = DateTime.now();
    String dateStr =
        "${today.year}-${today.month}-${today.day} ${today.hour}:${today.minute}";

    return MaterialApp(
        home: Scaffold(
      /* appBar: AppBar(
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
      ),*/
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: TabBarView(controller: _tabController, children: <Widget>[
        SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ///Header  here ---------------------------------------------------
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
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  CupertinoPageRoute(
                                                      builder:
                                                          (context) => NavDel(
                                                                TabValue: 7,
                                                                documentId: FirebaseAuth
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
                                            "قائمة المفوضين",
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

                //header here --------------------
                //-
                //-
                //-
                //-

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
                              "المفوضين",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "الطلبات",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ), //
                    ),
                  ),
                ),
                Divider(color: Colors.grey),
                Row(children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                    child: Align(
                      // alignment: Alignment(-0.85, -0.45),
                      child: Container(
                        height: 45.0,
                        width: 45.0,
                        child: FittedBox(
                          child: FloatingActionButton(
                            onPressed: () {
                              reques.get().then((snapshot) =>
                                  snapshot.docs.forEach((document) {
                                    if (document["isAccepted"] == "true" &&
                                        document["DelegatorActive"] == "true") {
                                      Req.UpdateRequest(document.reference.id,
                                          "IsActive", "false");
                                    }
                                  }));
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
                                padding: EdgeInsets.all(0),
                                child: Center(
                                  child: Text(
                                    " إلغاء التفعيل للكل",
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .title2
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w800,
                                        ),
                                  ),
                                ),
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
                    width: 15,
                  ),
                  Align(
                    alignment: Alignment(0.91, 0.9),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          // <-- Icon
                          Icons.arrow_downward_sharp,
                          size: 13.0,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          "لتفعيل الطلب",
                          textAlign: TextAlign.left,
                          style: FlutterFlowTheme.of(context).title2.override(
                                fontFamily: 'Outfit',
                                color: Color(0xFF29294D),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 182,
                  ),
                  SizedBox(
                    width: 17,
                  ),
                  Align(
                    alignment: Alignment(0.991, 0.9),
                    child: Text(
                      "المفوضين المتاحين",
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
                      .collection("Requests")
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasData) {
                      final snap = snapshot.data!.docs;

                      return FutureBuilder(
                        future: Future.wait([
                          GetStudentName(snap),
                          Fill(),
                        ]),
                        builder: (context, snapshot) {
                          if (snapshot.data?.length != 0) {
                            return Align(
                                child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              primary: false,
                              itemCount: snap.length,
                              itemBuilder: (context, index) {
                                IsIDExists = false;

                                RID = snap[index].reference.id;

                                IsAct = true;
                                SCount += 1;

                                var Co = index;

                                RID = snap[index].reference.id;
                                ShowRequest = false;
                                // print(
                                //     "aaaaaaaaaaaaaaaaaaaaaaaaaaa");
                                // print("22222222222");
                                Active = snap[index]["IsActive"];
                                if (Active == "true") {
                                  IsSwitched = true;
                                } else if (Active == "false") {
                                  IsSwitched = false;
                                }
                                // print("333333333333333333333");
                                // print(RID);
                                //   print(
                                //      "+++++++++++++++++++++++++++");
                                //prin//t(IsAct);

                                if (snap[index]["isAccepted"] == "true" &&
                                    snap[index]["IsActive"] == "true" &&
                                    snap[index]["DelegatorActive"] == "true" &&
                                    snap[index]["ParentID"] == ParentId) {
                                  ShowRequest = true;

                                  ///  print("44444444444444444");
                                }
                                if (snap[index]["isAccepted"] == "true" &&
                                    snap[index]["IsActive"] == "false" &&
                                    snap[index]["DelegatorActive"] == "true" &&
                                    snap[index]["ParentID"] == ParentId) {
                                  ShowRequest = true;
                                  //  print("55555555");
                                }
                                if (snap[index]["isAccepted"] == "false" &&
                                    snap[index]["ParentID"] == ParentId) {
                                  ShowRequest = false;
                                }
                                //  print("666666666666");
                                return ShowRequest
                                    ? Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5, 5, 5, 5),
                                        child: Container(
                                          width: 367.6,
                                          height: 64.3,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
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
                                              Stack(children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(11, 4, 4, 0),
                                                  child: Text(
                                                    snap[index]["Date"],
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: Colors.grey,
                                                          fontSize: 9,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -0.8, -0.19),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 4, 0),
                                                    child: Switch(
                                                      value: IsSwitched,
                                                      onChanged: (value) {
                                                        //  print(
                                                        //      "7777");
                                                        RID = snap[index]
                                                            .reference
                                                            .id;

                                                        if (value) {
                                                          //   print(
                                                          //      "<<<<<<<<<<<<<<<<<<<<<<<<object>>>>>>>>>>>>>>>>>>>>>>>>");
                                                          RID = snap[index]
                                                              .reference
                                                              .id;
                                                          //     print(
                                                          //        "88888");
                                                          CurID = snap[index]
                                                              ["StudentID"];
                                                          print(
                                                              "PPPPPPPPPPPPPPPPPPPP");
                                                          print(RID);
                                                          print(
                                                              "555555555555555");
                                                          print(CurID);

                                                          CheckForStudent(
                                                              CurID, RID);
                                                          print(
                                                              "SSSSSSZZZZZZZZZZZZZZZZZZZZZZSSSSSSSSSSS");
                                                          print(IsIDExists);
                                                          //  print(
                                                          //      "999");
                                                          //      print(
                                                          //       IsIDExists);

                                                          Future.delayed(
                                                              Duration(
                                                                  milliseconds:
                                                                      6), () {
                                                            if (IsIDExists ==
                                                                true) {
                                                              // print(
                                                              //     "=========================");
                                                              showCupertinoDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      CreateDialog33);
                                                              IsIDExists =
                                                                  false;
                                                              //  print("10000");
                                                            } else {
                                                              setState(() {
                                                                Req.UpdateRequest(
                                                                    RID,
                                                                    "IsActive",
                                                                    "true");
                                                              });
                                                            }
                                                          });
                                                        } else if (value ==
                                                            false) {
                                                          // print(
                                                          //     "11");
                                                          RID = snap[index]
                                                              .reference
                                                              .id;
                                                          setState(() {
                                                            Req.UpdateRequest(
                                                                RID,
                                                                "IsActive",
                                                                "false");
                                                          });

                                                          //  print(
                                                          //      "[[[[[object]]]]]");
                                                          // print(
                                                          //     CountSwitch);
                                                        }
                                                      },
                                                      activeTrackColor:
                                                          Color.fromARGB(156,
                                                              123, 186, 197),
                                                      activeColor:
                                                          Color(0xff0da6c2),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -0.88, 0.70),
                                                  child: IsSwitched
                                                      ? Text(
                                                          "الرجاء أستلام الطالب",
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: Color(
                                                                    0xFF101213),
                                                                fontSize: 10,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        )
                                                      : Text(
                                                          "  الرجاء عدم أستلام الطالب",
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: Color(
                                                                    0xFF101213),
                                                                fontSize: 10,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                ),
                                              ]),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.78, -0.40),
                                                child: Text(
                                                  DelegatorrNam[index],
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .title2
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            Color(0xFF101213),
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.77, 0.35),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 18, 0, 0),
                                                  child: Wrap(children: [
                                                    Text(
                                                      StudentName[index],
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
                                                                  5, 0, 0, 0),
                                                      child: Image.asset(
                                                        "assets/icons/Student.png",
                                                        width: 16,
                                                        height: 16,
                                                        color:
                                                            Color(0xFF57636C),
                                                      ),
                                                    )
                                                  ]),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
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
                  Align(
                    alignment: Alignment(0.91, 0.9),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          // <-- Icon
                          Icons.arrow_downward_sharp,
                          size: 13.0,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          "حالة المفوض",
                          textAlign: TextAlign.left,
                          style: FlutterFlowTheme.of(context).title2.override(
                                fontFamily: 'Outfit',
                                color: Color(0xFF29294D),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 170,
                  ),
                  Align(
                    alignment: Alignment(0.91, 0.9),
                    child: Text(
                      "المفوضين الغير المتاحين",
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
                      .collection("Requests")
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasData) {
                      final snap = snapshot.data!.docs;

                      return FutureBuilder(
                        future: Future.wait([
                          GetStudentName2(snap),
                          Fill(),
                        ]),
                        builder: (context, snapshot) {
                          if (snapshot.data?.length != 0) {
                            return Align(
                                child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              primary: false,
                              itemCount: snap.length,
                              itemBuilder: (context, index) {
                                //dynamic v = docIDS[index];
                                //   IsIDExists = false;

                                RID = snap[index].reference.id;
                                ShowRequest = false;
                                //print("aaa");

                                Accepted = snap[index]["isAccepted"];
                                Active = snap[index]["IsActive"];
                                DelegatorActive =
                                    snap[index]["DelegatorActive"];
                                //  print("bbbbbb");
                                if (Accepted == "true" &&
                                    DelegatorActive == "false" &&
                                    snap[index]["ParentID"] == ParentId) {
                                  ShowRequest = true;
                                  //print(RID);
                                  //print("MMMMMMMMMMMMMMM");
                                  //print(Active);
                                  // print(IsAct);
                                }
                                return ShowRequest
                                    ? Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5, 5, 5, 5),
                                        child: Container(
                                          width: 367.6,
                                          height: 65.3,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
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
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(11, 4, 4, 0),
                                                child: Text(
                                                  snap[index]["Date"],
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: Colors.grey,
                                                        fontSize: 7,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -0.9, 0.19),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 4, 0),
                                                  child: Container(
                                                    width: 80.7,
                                                    height: 30,
                                                    decoration: BoxDecoration(
                                                      color: Colors.grey
                                                          .withOpacity(0.2),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      shape: BoxShape.rectangle,
                                                      border: Border.all(
                                                        color: Colors.grey
                                                            .withOpacity(0.2),
                                                      ),
                                                    ),
                                                    child: Stack(children: [
                                                      Text(
                                                          "لن يتمكن المفوض من أستلام الطالب ",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color:
                                                                  Colors.grey)),
                                                    ]),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.78, -0.40),
                                                child: Text(
                                                  DelegatorrNam[index],
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .title2
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            Color(0xFF101213),
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.77, 0.35),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 18, 0, 0),
                                                  child: Wrap(children: [
                                                    Text(
                                                      StudentName[index],
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
                                                                  5, 0, 0, 0),
                                                      child: Image.asset(
                                                        "assets/icons/Student.png",
                                                        width: 16,
                                                        height: 16,
                                                        color:
                                                            Color(0xFF57636C),
                                                      ),
                                                    )
                                                  ]),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
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
                                              InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      CupertinoPageRoute(
                                                          builder: (context) =>
                                                              NavDel(
                                                                TabValue: 7,
                                                                documentId: FirebaseAuth
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
                                                "قائمة المفوضين",
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
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 5, 0, 0),
                        child: Align(
                          //  alignment: Alignment(-0.98, -0.97),
                          child: Container(
                            height: 45.0,
                            width: 45.0,
                            child: FittedBox(
                              child: FloatingActionButton(
                                onPressed: () {
                                  Navigator.of(context).push(CupertinoPageRoute(
                                    builder: (context) =>
                                        NavParent(TabValue: 20),
                                  ));
                                },
                                elevation: 0,
                                child: Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        blurRadius: 6,
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(90),
                                    gradient: LinearGradient(
                                      colors: [
                                        const Color(0xff0da6c2),
                                        const Color(0xff0da6c2),
                                        //       const Color(0xff57d77a)
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
                      ),
                      new PreferredSize(
                        preferredSize: new Size(8000.0, 200.0),
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(160, 10, 0, 0),
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
                                    "المفوضين",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    "الطلبات",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ), //
                          ),
                        ),
                      ),
                    ]),
                    SizedBox(
                      height: 7,
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    Row(children: [
                      SizedBox(
                        width: 15,
                      ),
                      Align(
                        alignment: Alignment(0.91, 0.9),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              // <-- Icon
                              Icons.arrow_downward_sharp,
                              size: 13.0,
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              "إلغاء التفويض",
                              textAlign: TextAlign.left,
                              style:
                                  FlutterFlowTheme.of(context).title2.override(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFF29294D),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 233,
                      ),
                      Align(
                        alignment: Alignment(0.91, 0.9),
                        child: Text(
                          'قيد الانتظار',
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
                            .collection("Requests")
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasData) {
                            final snap = snapshot.data!.docs;

                            return FutureBuilder(
                                future: Future.wait([
                                  GetStudentName3(snap),
                                  Fill(),
                                  getDelegatorID(snap)
                                ]),
                                builder: (context, snapshot) {
                                  if (snapshot.data?.length != 0) {
                                    return Align(
                                        child: ListView.builder(
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            primary: false,
                                            itemCount: snap.length,
                                            itemBuilder: (context, index) {
                                              Accepted =
                                                  snap[index]["isAccepted"];
                                              print(Accepted);
                                              if (Accepted == "Waiting") {
                                                CountItem = 0;
                                                print("innnnnnnnnnnn");
                                              }

                                              return SizedBox(
                                                height: 0,
                                              );
                                            }));
                                  }
                                  return SizedBox(
                                    height: 0,
                                  );
                                });
                          }
                          return SizedBox(
                            height: 0,
                          );
                        }),
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
                              GetStudentName3(snap),
                              //Fill(),
                            ]),
                            builder: (context, snapshot) {
                              if (snapshot.data?.length != 0) {
                                return Align(
                                    child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  primary: false,
                                  itemCount: snap.length,
                                  itemBuilder: (context, index) {
                                    //dynamic v = docIDS[index];
                                    //   IsIDExists = false;

                                    RID = snap[index].reference.id;
                                    ShowRequest = false;

                                    Accepted = snap[index]["isAccepted"];

                                    if (snap[index]["isAccepted"] ==
                                            "Waiting" &&
                                        snap[index]["ParentID"] == ParentId) {
                                      ShowRequest = true;
                                      //print(RID);
                                      //print("MMMMMMMMMMMMMMM");
                                      //print(Active);
                                      // print(IsAct);
                                    } else if (snap[index]["isAccepted"] !=
                                        "Waiting") {
                                      ShowRequest = false;
                                      //print(RID);
                                    } else {
                                      ShowRequest = false;
                                    }

                                    //   var Co = index;
                                    /*  RID = snap[index]
                                                        .reference
                                                        .id;*/

                                    // print(
                                    //     "aaaaaaaaaaaaaaaaaaaaaaaaaaa");
                                    /* Active =
                                                        snap[index]["IsActive"];
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
                                                            RID,
                                                            "IsActive",
                                                            "false");
                                                      }
                                                    }
                                                    if (snap[index]
                                                            ["isAccepted"] ==
                                                        true) {
                                                      ShowRequest = true;
                                                    } else if (snap[index]
                                                            ["isAccepted"] ==
                                                        false) {
                                                      ShowRequest = false;
                                                    }*/
                                    return ShowRequest
                                        ? Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5, 5, 5, 5),
                                            child: Container(
                                              width: 367.6,
                                              height: 65.3,
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
                                                            -0.9, -0.0),
                                                    child: InkWell(
                                                        // height: 80,

                                                        onTap: () {
                                                          //   print(
                                                          //      "llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll");

                                                          RID = snap[index]
                                                              .reference
                                                              .id;
                                                          showCupertinoDialog(
                                                              context: context,
                                                              builder:
                                                                  CreateDialog5);
                                                        },
                                                        child: Container(
                                                          width: 22,
                                                          height: 22,
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
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                11, 4, 4, 0),
                                                    child: Text(
                                                      snap[index]["Date"],
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyText1
                                                          .override(
                                                            fontFamily:
                                                                'Outfit',
                                                            color: Colors.grey,
                                                            fontSize: 9,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -0.71, -0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 4, 0),
                                                      child: Container(
                                                        width: 60.7,
                                                        height: 25,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.grey
                                                              .withOpacity(0.2),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                          shape: BoxShape
                                                              .rectangle,
                                                          border: Border.all(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.2),
                                                          ),
                                                        ),
                                                        child: Text(
                                                            'لم يقبل بعد',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                fontSize: 13,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: Colors
                                                                    .grey)),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.78, -0.40),
                                                    child: Text(
                                                      DelegatorrNam[index],
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .title2
                                                          .override(
                                                            fontFamily:
                                                                'Outfit',
                                                            color: Color(
                                                                0xFF101213),
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.77, 0.35),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 18, 0, 0),
                                                      child: Wrap(children: [
                                                        Text(
                                                          StudentName[index],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
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
                                                                  .fromSTEB(5,
                                                                      0, 0, 0),
                                                          child: Image.asset(
                                                            "assets/icons/Student.png",
                                                            width: 16,
                                                            height: 16,
                                                            color: Color(
                                                                0xFF57636C),
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
                                                        color:
                                                            Color(0xFF29294D),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
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
                      Align(
                        alignment: Alignment(0.91, 0.9),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              // <-- Icon
                              Icons.arrow_downward_sharp,
                              size: 13.0,
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              "إلغاء التفويض",
                              textAlign: TextAlign.left,
                              style:
                                  FlutterFlowTheme.of(context).title2.override(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFF29294D),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 215,
                      ),
                      Align(
                        alignment: Alignment(0.91, 0.9),
                        child: Text(
                          'الطلبات المقبولة',
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
                          .collection("Requests")
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasData) {
                          final snap = snapshot.data!.docs;

                          return FutureBuilder(
                            future: Future.wait([
                              GetStudentName4(snap),
                              Fill(),
                              // getDelegatorID(snap)
                            ]),
                            builder: (context, snapshot) {
                              print("Nooooooooooooooooooo");
                              if (snapshot.data?.length != 0) {
                                print("imm heereee!!!!!!!!!!!!!!!!!!!");
                                return Align(
                                    child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  primary: false,
                                  itemCount: snap.length,
                                  itemBuilder: (context, index) {
                                    var NotWaiting = false;
                                    var RStatus = false;
                                    //   print("ssss");
                                    // print(snap[index]
                                    //     .reference
                                    //     .id);
                                    //  print(index);
                                    //  print(StudentName[
                                    //      index]);
                                    Accepted = snap[index]["isAccepted"];
                                    ShowRequest = false;
                                    if (Accepted != "Waiting" &&
                                        snap[index]["ParentID"] == ParentId) {
                                      NotWaiting = true;
                                      RID = snap[index].reference.id;

                                      if (Accepted == "true" &&
                                          snap[index]["ParentID"] == ParentId) {
                                        ShowRequest = true;

                                        RStatus = true;
                                      }

                                      if (Accepted == "false" &&
                                          snap[index]["ParentID"] == ParentId) {
                                        ShowRequest = false;
                                        RStatus = false;
                                      }
                                    } else {
                                      ShowRequest = false;
                                    }
                                    return ShowRequest
                                        ? Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5, 5, 5, 5),
                                            child: Container(
                                              width: 350.6,
                                              height: 65.3,
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
                                                            -0.9, -0.0),
                                                    child: InkWell(
                                                        // height: 80,

                                                        onTap: () {
                                                          //   print(
                                                          //      "llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll");

                                                          RID = snap[index]
                                                              .reference
                                                              .id;
                                                          showCupertinoDialog(
                                                              context: context,
                                                              builder:
                                                                  CreateDialog5);
                                                        },
                                                        child: Container(
                                                          width: 22,
                                                          height: 22,
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
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                11, 4, 4, 0),
                                                    child: Text(
                                                      snap[index]["Date"],
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyText1
                                                          .override(
                                                            fontFamily:
                                                                'Outfit',
                                                            color: Colors.grey,
                                                            fontSize: 9,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -0.79, -0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5, 5, 0, 0),
                                                      child: RStatus
                                                          ? Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Container(
                                                                width: 60.7,
                                                                height: 25,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color.fromARGB(
                                                                          107,
                                                                          87,
                                                                          215,
                                                                          121)
                                                                      .withOpacity(
                                                                          0.2),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20),
                                                                  shape: BoxShape
                                                                      .rectangle,
                                                                  border: Border
                                                                      .all(
                                                                    color: Color.fromARGB(
                                                                            255,
                                                                            79,
                                                                            198,
                                                                            111)
                                                                        .withOpacity(
                                                                            0.2),
                                                                  ),
                                                                ),
                                                                child: Text(
                                                                    "مقبوله",
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        color: Color.fromARGB(
                                                                            255,
                                                                            80,
                                                                            195,
                                                                            111))),
                                                              ),
                                                            )
                                                          : Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Container(
                                                                width: 50.7,
                                                                height: 22,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .red
                                                                      .withOpacity(
                                                                          0.2),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20),
                                                                  shape: BoxShape
                                                                      .rectangle,
                                                                  border: Border
                                                                      .all(
                                                                    color: Colors
                                                                        .red
                                                                        .withOpacity(
                                                                            0.2),
                                                                  ),
                                                                ),
                                                                child: Text(
                                                                    "مرفوضه",
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            11,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        color: Colors
                                                                            .red)),
                                                              ),
                                                            ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.78, -0.40),
                                                    child: Text(
                                                      DelegatorrNam[index],
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .title2
                                                          .override(
                                                            fontFamily:
                                                                'Outfit',
                                                            color: Color(
                                                                0xFF101213),
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.77, 0.35),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 18, 0, 0),
                                                      child: Wrap(children: [
                                                        Text(
                                                          StudentName[index],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
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
                                                                  .fromSTEB(5,
                                                                      0, 0, 0),
                                                          child: Image.asset(
                                                            "assets/icons/Student.png",
                                                            width: 16,
                                                            height: 16,
                                                            color: Color(
                                                                0xFF57636C),
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
                                                        color:
                                                            Color(0xFF29294D),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
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
                      height: 15,
                    ),
                    Row(children: [
                      SizedBox(
                        width: 15,
                      ),
                      Align(
                        alignment: Alignment(0.91, 0.9),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              // <-- Icon
                              Icons.arrow_downward_sharp,
                              size: 13.0,
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              "حذف الطلب",
                              textAlign: TextAlign.left,
                              style:
                                  FlutterFlowTheme.of(context).title2.override(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFF29294D),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 198,
                      ),
                      SizedBox(
                        width: 13,
                      ),
                      Align(
                        alignment: Alignment(0.91, 0.9),
                        child: Text(
                          'الطلبات المرفوضه',
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
                          .collection("Requests")
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasData) {
                          final snap = snapshot.data!.docs;

                          return FutureBuilder(
                            future: Future.wait([
                              GetStudentName5(snap),
                              Fill(),
                            ]),
                            builder: (context, snapshot) {
                              print(
                                  "cccccccccccccccccccccccccccccccccccccccccccccc");
                              print("aaaaaaaaaaaaaaaaaaaaaaa");
                              print("///////////////////");
                              if (snapshot.data?.length != 0) {
                                return Align(
                                    child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  primary: false,
                                  itemCount: snap.length,
                                  itemBuilder: (context, index) {
                                    var NotWaiting = false;
                                    var RStatus = false;
                                    //   print("ssss");
                                    // print(snap[index]
                                    //     .reference
                                    //     .id);
                                    //  print(index);
                                    //  print(StudentName[
                                    //      index]);
                                    Accepted = snap[index]["isAccepted"];
                                    ShowRequest = false;
                                    if (Accepted != "Waiting" &&
                                        snap[index]["ParentID"] == ParentId) {
                                      NotWaiting = true;
                                      RID = snap[index].reference.id;

                                      if (Accepted == "true" &&
                                          snap[index]["ParentID"] == ParentId) {
                                        ShowRequest = false;

                                        RStatus = true;
                                      }

                                      if (Accepted == "false" &&
                                          snap[index]["ParentID"] == ParentId) {
                                        ShowRequest = true;
                                        RStatus = false;
                                      }
                                    } else {
                                      ShowRequest = false;
                                    }
                                    return ShowRequest
                                        ? Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5, 5, 5, 5),
                                            child: Container(
                                              width: 367.6,
                                              height: 65.3,
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
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                11, 4, 4, 0),
                                                    child: Text(
                                                      snap[index]["Date"],
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyText1
                                                          .override(
                                                            fontFamily:
                                                                'Outfit',
                                                            color: Colors.grey,
                                                            fontSize: 9,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -0.77, 0.10),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10, 0, 0, 0),
                                                      child: Container(
                                                        width: 60.7,
                                                        height: 25,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.red
                                                              .withOpacity(0.2),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                          shape: BoxShape
                                                              .rectangle,
                                                          border: Border.all(
                                                            color: Colors.red
                                                                .withOpacity(
                                                                    0.2),
                                                          ),
                                                        ),
                                                        child: Text("مرفوضه",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: Colors
                                                                    .red)),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -0.9, -0.0),
                                                    child: InkWell(
                                                        // height: 80,

                                                        onTap: () {
                                                          //   print(
                                                          //      "llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll");

                                                          RID = snap[index]
                                                              .reference
                                                              .id;
                                                          showCupertinoDialog(
                                                              context: context,
                                                              builder:
                                                                  CreateDialog5);
                                                        },
                                                        child: Container(
                                                          width: 22,
                                                          height: 22,
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
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.74, -0.40),
                                                    child: Text(
                                                      DelegatorrNam[index],
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .title2
                                                          .override(
                                                            fontFamily:
                                                                'Outfit',
                                                            color: Color(
                                                                0xFF101213),
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.77, 0.35),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 18, 0, 0),
                                                      child: Wrap(children: [
                                                        Text(
                                                          StudentName[index],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
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
                                                                  .fromSTEB(5,
                                                                      0, 0, 0),
                                                          child: Image.asset(
                                                            "assets/icons/Student.png",
                                                            width: 16,
                                                            height: 16,
                                                            color: Color(
                                                                0xFF57636C),
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
                                                        color:
                                                            Color(0xFF29294D),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
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
                    ), //here im

                    /*   CountItem != 0
                        ? StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection("Requests")
                                .snapshots(),
                            builder: (BuildContext context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (snapshot.hasData) {
                                final snap = snapshot.data!.docs;

                                return FutureBuilder(
                                  future: Future.wait([
                                    GetStudentName(snap),
                                    Fill(),
                                    getDelegatorID(snap)
                                  ]),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return Align(
                                          child: ListView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        primary: false,
                                        itemCount: snap.length,
                                        itemBuilder: (context, index) {
                                          //dynamic v = docIDS[index];
                                          //   IsIDExists = false;

                                          RID = snap[index].reference.id;
                                          ShowRequest = false;

                                          Accepted = snap[index]["isAccepted"];

                                          if (Accepted == "Waiting") {
                                            ShowRequest = true;
                                            //print(RID);
                                            //print("MMMMMMMMMMMMMMM");
                                            //print(Active);
                                            // print(IsAct);

                                          }

                                          //   var Co = index;
                                          /*  RID = snap[index]
                                                        .reference
                                                        .id;*/

                                          // print(
                                          //     "aaaaaaaaaaaaaaaaaaaaaaaaaaa");
                                          /* Active =
                                                        snap[index]["IsActive"];
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
                                                            RID,
                                                            "IsActive",
                                                            "false");
                                                      }
                                                    }
                                                    if (snap[index]
                                                            ["isAccepted"] ==
                                                        true) {
                                                      ShowRequest = true;
                                                    } else if (snap[index]
                                                            ["isAccepted"] ==
                                                        false) {
                                                      ShowRequest = false;
                                                    }*/
                                          return ShowRequest
                                              ? Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(5, 5, 5, 5),
                                                  child: Container(
                                                    width: 367.6,
                                                    height: 65.3,
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
                                                    child: Stack(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(11,
                                                                      4, 4, 0),
                                                          child: Text(
                                                            snap[index]["Date"],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: Colors
                                                                      .grey,
                                                                  fontSize: 7,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -0.9, 0.10),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        4,
                                                                        0),
                                                            child: Container(
                                                              width: 50.7,
                                                              height: 22,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .grey
                                                                    .withOpacity(
                                                                        0.2),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                                shape: BoxShape
                                                                    .rectangle,
                                                                border:
                                                                    Border.all(
                                                                  color: Colors
                                                                      .grey
                                                                      .withOpacity(
                                                                          0.2),
                                                                ),
                                                              ),
                                                              child: Text(
                                                                  'لم يقبل بعد',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      color: Colors
                                                                          .grey)),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.78, -0.59),
                                                          child: Text(
                                                            " المفوض" +
                                                                " " +
                                                                snap[index][
                                                                    'DelegatorName'],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
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
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.77, 0.35),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        4,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              " "
                                                                      "  لطالب" +
                                                                  " " +
                                                                  StudentName[
                                                                      index],
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.94, 0.08),
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
                                                        ),
                                                      ],
                                                    ),
                                                  ))
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
                          )
                        : Text("aaaaaaaaaaaaaaaaa"),*/
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
    ));
  }

/*
  Future GetStudentName(snap) async {
    // print("Entered!");
    int count = 0;
    //  StudentName.clear();
    String n = "lllllllllllllllllll";
    List<String> StudentID = [];

    try {
      for (var i = 0; snap[i] != null; i++) {
        SnapCount += 1;
        StudentID.add(snap[i]["StudentID"]);
        print("xxxxxxxxxxxxx");
        print(snap[i]["StudentID"]);
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

  Future GetStudentName3(snap) async {
    // print("Entered!");
    int count = 0;

    String n = "lllllllllllllllllll";
    List<String> StudentID = [];

    try {
      for (var i = 0; snap[i] != null; i++) {
        SnapCount += 1;
        StudentID.add(snap[i]["StudentID"]);
        print("sssssssssssssaaaaaaaaaaaaaaaaaa");
        print(snap[i]["StudentID"]);
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
        print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
        // print("StID");
        print(StudentID[j]);
        // print("3333333333333333333333");
        //  print(StudentName[0]);
        // Access your after your get the data
        count = 1;
        // print(value["Name"]);

        StudentName3.add(value["Name"]);
        print(value["Name"]);
        print("Starteddd");
        // print("ennnnnnnnnnnnnnnddddddddddddddddddddd");
      });
    }

    // print(StudentName[0]);
  }

  Future GetStudentName4(snap) async {
    // print("Entered!");
    int count = 0;

    String n = "lllllllllllllllllll";
    List<String> StudentID = [];
    print("innnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn!!!!!!!!!!!!!!");
    try {
      for (var i = 0; snap[i] != null; i++) {
        SnapCount += 1;
        StudentID.add(snap[i]["StudentID"]);
        print("ضضضضضضضضضضضضضضضضضضضضضض");
        print(snap[i]["StudentID"]);
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
        print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
        // print("StID");
        print(StudentID[j]);
        // print("3333333333333333333333");
        //  print(StudentName[0]);
        // Access your after your get the data
        count = 1;
        // print(value["Name"]);

        StudentName4.add(value["Name"]);
        print(value["Name"]);
        print("Starteddd");

        // print("ennnnnnnnnnnnnnnddddddddddddddddddddd");
      });

      print("ennnnnnnnnnnnnnnddddddddddddddddddddd");
    }

    // print(StudentName[0]);
  }
*/

  Future getDelegatorID(snap) async {
    List<String> DelegatorUsr = [];
    List<String> ID = [];
    await FirebaseFirestore.instance
        .collection("Delegator")
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              // print(document["UserName"]);
              // print(document["ID"]);
              DelegatorUsr.add(document["UserName"]);
              ID.add(document["ID"]);
            }));
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
        print(value["Name"]);

        //  print("Starteddd");
        for (var i = 0; i < StudentName.length; i++) {
          //    print("*******************************************");
          // print(StudentName[i]);
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
    //   print("rend of this");
  }

//

  ///
  ///
  ///
  ///

  Future GetStudentName(snap) async {
    print("Entered!");
    int count = 0;
    //  StudentName.clear();
    String n = "lllllllllllllllllll";
    List<String> StudentID = [];
    List<String> DDelegatorrID = [];
    try {
      for (var i = 0; snap[i] != null; i++) {
        SnapCount += 1;
        StudentID.add(snap[i]["StudentID"]);
        DDelegatorrID.add(snap[i]["DelegatorID"]);
        print("xxxxxxxxxxxxx");
        print(snap[i]["DelegatorID"]);
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

        StudentName.add(
            "ID" + " " + value["NationalID"] + " " + "للطالب " + value["Name"]);

        // print("ennnnnnnnnnnnnnnddddddddddddddddddddd");
      });
    }
    for (var v = 0; v < DDelegatorrID.length; v++) {
      //    print("object");
      //   print(StudentID[j]);
      await DelegatorCollection.doc(DDelegatorrID[v]).get().then((value) {
        //StudentName.add(value.get('Name'));
        //  print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
        // print("StID");
        // print(StudentID[j]);
        // print("3333333333333333333333");
        //  print(StudentName[0]);
        // Access your after your get the data
        //count = 1;
        // print(value["Name"]);

        DelegatorrNam.add(
            "ID" + " " + value["ID"] + " " + "المفوض " + value["Name"]);
        // print("Starteddd");
        print("S1221111tarteddd");
        print(value["Name"] + " " + value["ID"]);
        // print("ennnnnnnnnnnnnnnddddddddddddddddddddd");
      });
    }
    // print(StudentName[0]);
  }

  Future GetStudentName2(snap) async {
    print("Entered!");
    int count = 0;
    //  StudentName.clear();
    String n = "lllllllllllllllllll";
    List<String> StudentID = [];
    List<String> DDelegatorrID = [];
    try {
      for (var i = 0; snap[i] != null; i++) {
        SnapCount += 1;
        StudentID.add(snap[i]["StudentID"]);
        DDelegatorrID.add(snap[i]["DelegatorID"]);
        print("xxxxxxxxxxxxx");
        print(snap[i]["DelegatorID"]);
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

        StudentName2.add(
            "ID" + " " + value["NationalID"] + " " + "للطالب " + value["Name"]);
        // print("Starteddd");
        // print("ennnnnnnnnnnnnnnddddddddddddddddddddd");
      });
    }
    for (var v = 0; v < DDelegatorrID.length; v++) {
      //    print("object");
      //   print(StudentID[j]);
      await DelegatorCollection.doc(DDelegatorrID[v]).get().then((value) {
        //StudentName.add(value.get('Name'));
        //  print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
        // print("StID");
        // print(StudentID[j]);
        // print("3333333333333333333333");
        //  print(StudentName[0]);
        // Access your after your get the data
        //count = 1;
        // print(value["Name"]);

        DelegatorrNam2.add(
            "ID" + " " + value["ID"] + " " + "المفوض " + value["Name"]);
        // print("Starteddd");
        // print("ennnnnnnnnnnnnnnddddddddddddddddddddd");
      });
    }
    // print(StudentName[0]);
  }

  Future GetStudentName3(snap) async {
    print("Enter222222222222222222ed!");
    int count = 0;

    String n = "lllllllllllllllllll";
    List<String> StudentID = [];
    List<String> DDelegatorrID = [];
    try {
      for (var i = 0; snap[i] != null; i++) {
        SnapCount += 1;
        StudentID.add(snap[i]["StudentID"]);
        DDelegatorrID.add(snap[i]["DelegatorID"]);
        print("xxxxxxxxxxxxx");
        print(snap[i]["DelegatorID"]);
        // print("sssssssssssssaaaaaaaaaaaaaaaaaa");
        //  print(snap[i]["StudentID"]);
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
        //   print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
        //// print("StID");
        //  print(StudentID[j]);
        // print("3333333333333333333333");
        //  print(StudentName[0]);
        // Access your after your get the data
        count = 1;
        // print(value["Name"]);

        StudentName3.add(
            "ID" + " " + value["NationalID"] + " " + "للطالب " + value["Name"]);
        //  print(value["Name"]);
        //  print("Starteddd");
        // print("ennnnnnnnnnnnnnnddddddddddddddddddddd");
      });
    }

    //
    ///
    /////
    ///
    for (var v = 0; v < DDelegatorrID.length; v++) {
      //    print("object");
      //   print(StudentID[j]);
      await DelegatorCollection.doc(DDelegatorrID[v]).get().then((value) {
        //StudentName.add(value.get('Name'));
        //  print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
        // print("StID");
        // print(StudentID[j]);
        // print("3333333333333333333333");
        //  print(StudentName[0]);
        // Access your after your get the data
        //count = 1;
        // print(value["Name"]);

        DelegatorrNam3.add(
            "ID" + " " + value["ID"] + " " + "المفوض " + value["Name"]);
        // print("Starteddd");
        // print("Starteddd");
        // print("ennnnnnnnnnnnnnnddddddddddddddddddddd");
      });
    }

    // print(StudentName[0]);
  }

  Future GetStudentName4(snap) async {
    // print("Entered!");
    int count = 0;

    String n = "lllllllllllllllllll";
    List<String> StudentID = [];
    List<String> DDelegatorrID = [];
    try {
      for (var i = 0; snap[i] != null; i++) {
        SnapCount += 1;
        StudentID.add(snap[i]["StudentID"]);
        DDelegatorrID.add(snap[i]["DelegatorID"]);
        print("xxxxxxxxxxxxx");
        print(snap[i]["DelegatorID"]);
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

        count = 1;
        // print(value["Name"]);

        StudentName4.add(
            "ID" + " " + value["NationalID"] + " " + "للطالب " + value["Name"]);

        // print("ennnnnnnnnnnnnnnddddddddddddddddddddd");
      });
    }

    //
    for (var v = 0; v < DDelegatorrID.length; v++) {
      //    print("object");
      //   print(StudentID[j]);
      await DelegatorCollection.doc(DDelegatorrID[v]).get().then((value) {
        //StudentName.add(value.get('Name'));
        //  print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
        // print("StID");
        // print(StudentID[j]);
        // print("3333333333333333333333");
        //  print(StudentName[0]);
        // Access your after your get the data
        //count = 1;
        // print(value["Name"]);

        DelegatorrNam4.add(
            "ID" + " " + value["ID"] + " " + "المفوض " + value["Name"]);
        // print("Starteddd");
        // print("ennnnnnnnnnnnnnnddddddddddddddddddddd");
      });
    }

    // print(StudentName[0]);
  }

  Future GetStudentName5(snap) async {
    // print("Entered!");
    int count = 0;

    String n = "lllllllllllllllllll";
    List<String> StudentID = [];
    List<String> DDelegatorrID = [];
    try {
      for (var i = 0; snap[i] != null; i++) {
        SnapCount += 1;
        StudentID.add(snap[i]["StudentID"]);
        DDelegatorrID.add(snap[i]["DelegatorID"]);
        print("xxxxxxxxxxxxx");
        print(snap[i]["DelegatorID"]);
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

        count = 1;
        // print(value["Name"]);

        StudentName5.add(
            "ID" + " " + value["NationalID"] + " " + "للطالب " + value["Name"]);
        // print("ennnnnnnnnnnnnnnddddddddddddddddddddd");
      });
    }

    //
    for (var v = 0; v < DDelegatorrID.length; v++) {
      //    print("object");
      //   print(StudentID[j]);
      await DelegatorCollection.doc(DDelegatorrID[v]).get().then((value) {
        //StudentName.add(value.get('Name'));
        //  print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
        // print("StID");
        // print(StudentID[j]);
        // print("3333333333333333333333");
        //  print(StudentName[0]);
        // Access your after your get the data
        //count = 1;
        // print(value["Name"]);

        DelegatorrNam5.add(
            "ID" + " " + value["ID"] + " " + "المفوض " + value["Name"]);
        // print("Starteddd");
        // print("ennnnnnnnnnnnnnnddddddddddddddddddddd");
      });
    }

    // print(StudentName[0]);
  }

////
  ///
  ///
  ///
  ///
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
