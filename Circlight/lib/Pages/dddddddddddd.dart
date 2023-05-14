import 'package:circlight/Pages/RequestDelegator.dart';
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

class ListDelegator66 extends StatefulWidget {
  const ListDelegator66({Key? key}) : super(key: key);

  @override
  _ListDelegator createState() => _ListDelegator();
}

class _ListDelegator extends State<ListDelegator66>
    with TickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  CollectionReference request =
      FirebaseFirestore.instance.collection('Student');
  CollectionReference Parent = FirebaseFirestore.instance.collection('Parent');
  List<String> docPname = [];
  List<String> StudentName = [];
  List<String> ParentName = [];
  List<String> ParentID = [];
  CollectionReference Req2 = FirebaseFirestore.instance.collection('Requests');
  var ParentId = "oskKOnpcSXgPfMC6gbMq4gBLcwi2";

  List<String> StudentName3 = [];
  List<String> StudentName4 = [];
  int CountStudent = -1;
  int SnapCount = 0;
  int ParentCount = -1;
  int count = 0;
  bool ShowRequest = false;
  String Show = "true";

  bool NoResult = true;
  bool NoResult2 = true;
  bool NoResult3 = true;
  bool NoResult4 = true;
  bool NoResult5 = true;
  TextEditingController Namex = TextEditingController();
  CollectionReference ColStudent =
      FirebaseFirestore.instance.collection('Student');
  var DelegatorActive = "";
  List<bool> IsSwitch = [];
  var CountSwitch = 0;
  var IsIDExists = false;
  List<String> DelegatorID = [];
  List<String> StudentName2 = [];
  List<String> DelegatorrNam2 = [];
  List<String> DelegatorrNam3 = [];
  List<String> DelegatorrNam4 = [];

  CollectionReference DelegatorCollection =
      FirebaseFirestore.instance.collection('Delegator');
  List<String> DelegatorrNam = [];

  List<String> StudentName5 = [];
  List<String> DelegatorrNam5 = [];
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
  List<String> Empty1 = [];

  Future EmptyMethod1() async {
    //  Empty1.clear();
    Req2.get().then((snapshot) => snapshot.docs.forEach((document) {
          //  print("=========================");

          if (document["isAccepted"] == "true" &&
              document["IsActive"] == "true" &&
              document["DelegatorActive"] == "true" &&
              document["ParentID"] == ParentId) {
            Empty1.add("value");
            //  print(ShowRequest);
//
            //  print("44444444444444444");
          }
          if (document["isAccepted"] == "true" &&
              document["IsActive"] == "false" &&
              document["DelegatorActive"] == "true" &&
              document["ParentID"] == ParentId) {
            Empty1.add("value");

            // print("55555555555555555555");
            //   print("***************************************=");
            //   print(ShowRequest);
          }
        }));
//    return widget as Future;
  }

  List<String> Empty2 = [];

  EmptyMethod2() {
    Empty2.clear();
    Req2.get().then((snapshot) => snapshot.docs.forEach((document) {
          Accepted = document["isAccepted"];
          Active = document["IsActive"];
          DelegatorActive = document["DelegatorActive"];
          //  print("bbbbbb");
          if (Accepted == "true" &&
              DelegatorActive == "false" &&
              document["ParentID"] == ParentId) {
            Empty2.add("v");
          }
        }));
  }

  List<String> Empty3 = [];

  EmptyMethod3() {
    Empty3.clear();
    Req2.get().then((snapshot) => snapshot.docs.forEach((document) {
          Accepted = document["isAccepted"];

          if (Accepted == "Waiting" && document["ParentID"] == ParentId) {
            // ShowRequest = true;
            Empty3.add("v");
            //print(RID);
            //print("MMMMMMMMMMMMMMM");
            //print(Active);
            // print(IsAct);
          }
        }));
  }

  List<String> Empty4 = [];

  EmptyMethod4() {
    Empty4.clear();
    Req2.get().then((snapshot) => snapshot.docs.forEach((document) {
          Accepted = document["isAccepted"];
          if (Accepted == "Waiting" && document["ParentID"] == ParentId) {
            Empty4.add("v");
          } else if (Accepted == "false" && document["ParentID"] == ParentId) {
            Empty4.add("v");
          }
        }));
  }

  List<String> Empty5 = [];

  EmptyMethod5() {
    Empty5.clear();
    Req2.get().then((snapshot) => snapshot.docs.forEach((document) {
          Accepted = document["isAccepted"];

          if (Accepted == "false") {
            Empty5.add("v");
          }
        }));
  }

  Future Requests1() async {
    // print("hheree");
    //  await EmptyMethod1();
    // print("aaa22222222222222222222aaa");
    Req2.get().then((snapshot) => snapshot.docs.forEach((document) {
          //  print("111111111111111111111");
          if (document["isAccepted"] == "true" &&
              document["IsActive"] == "true" &&
              document["DelegatorActive"] == "true" &&
              document["ParentID"] == ParentId) {
            setState(() {
              NoResult = true;
            });
            // print("object11111");

            //  print("=========================");
            //  print(ShowRequest);
//
            ///  print("44444444444444444");
          } else if (document["isAccepted"] == "true" &&
              document["IsActive"] == "false" &&
              document["DelegatorActive"] == "true" &&
              document["ParentID"] == ParentId) {
            setState(() {
              NoResult = true;
            });
            //  print("55555555");
            //   print("***************************************=");
            //   print(ShowRequest);
          } else if (document["isAccepted"] == "false" &&
              document["ParentID"] == ParentId &&
              Empty1.isEmpty == true) {
            setState(() {
              NoResult = false;
            });
            print("++++2222++++++++++++++++++++");
            //   print(ShowRequest);
          } else if (document["ParentID"] == ParentId &&
              document["DelegatorActive"] == "false" &&
              Empty1.isEmpty == true) {
            setState(() {
              NoResult = false;
            });
            print("+22222222222222222222+");
            //   print(ShowRequest);
          } else if (Empty1.isEmpty == true) {
            setState(() {
              NoResult = false;
            });
            print("object222222222222");
          }
          if (document["ParentID"] != ParentId) {
            setState(() {
              NoResult = false;
            });
          }
        }));
  }

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
  final _tabs = [
    Tab(text: 'Tab1'),
    Tab(text: 'Tab2'),
  ];
  @override
  Widget build(BuildContext context) {
    Requests1();
    String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    //print("11111111111111111111111111111111111111111111");
    //print(currentDate);
    DateTime today = DateTime.now();
    String dateStr =
        "${today.year}-${today.month}-${today.day} ${today.hour}:${today.minute}";

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
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
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: TabBarView(
          controller: _tabController,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new PreferredSize(
                      preferredSize: new Size(8000.0, 200.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(240, 10, 0, 10),
                        child: new Container(
                          width: 150.0,
                          height: 30,
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
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  "الطلبات",
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
                    Row(children: [
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
                                  reques.get().then((snapshot) =>
                                      snapshot.docs.forEach((document) {
                                        if (document["isAccepted"] == "true" &&
                                            document["DelegatorActive"] ==
                                                "true") {
                                          Req.UpdateRequest(
                                              document.reference.id,
                                              "IsActive",
                                              "false");
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4, 4, 4, 4),
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
                                              fontSize: 9,
                                              fontWeight: FontWeight.w800,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                                backgroundColor:
                                    Color.fromARGB(0, 255, 253, 253),
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
                              style:
                                  FlutterFlowTheme.of(context).title2.override(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFF29294D),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 182,
                      ),
                      Align(
                        alignment: Alignment(0.91, 0.9),
                        child: Text(
                          "المفوضين المتاحين",
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
                              EmptyMethod1(),
                            ]),
                            builder: (context, snapshot) {
                              if (snapshot.data?.length != 0) {
                                Requests1();
                                return NoResult
                                    ? Align(
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

                                          if (snap[index]["isAccepted"] ==
                                                  "true" &&
                                              snap[index]["IsActive"] ==
                                                  "true" &&
                                              snap[index]["DelegatorActive"] ==
                                                  "true") {
                                            ShowRequest = true;

                                            ///  print("44444444444444444");
                                          }
                                          if (snap[index]["isAccepted"] ==
                                                  "true" &&
                                              snap[index]["IsActive"] ==
                                                  "false" &&
                                              snap[index]["DelegatorActive"] ==
                                                  "true") {
                                            ShowRequest = true;
                                            //  print("55555555");
                                          }
                                          if (snap[index]["isAccepted"] ==
                                              "false") {
                                            ShowRequest = false;
                                          }
                                          //  print("666666666666");
                                          return ShowRequest
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
                                                    child: Stack(
                                                      children: [
                                                        Stack(children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        11,
                                                                        4,
                                                                        4,
                                                                        0),
                                                            child: Text(
                                                              snap[index]
                                                                  ["Date"],
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
                                                                    -0.8,
                                                                    -0.19),
                                                            child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            4,
                                                                            0),
                                                                child: Transform
                                                                    .scale(
                                                                  scale: 1.3,
                                                                  child: Switch(
                                                                    value:
                                                                        IsSwitched,
                                                                    onChanged:
                                                                        (value) {
                                                                      //  print(
                                                                      //      "7777");
                                                                      RID = snap[
                                                                              index]
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
                                                                            [
                                                                            "StudentID"];

                                                                        CheckForStudent(
                                                                            CurID,
                                                                            RID);

                                                                        //  print(
                                                                        //      "999");
                                                                        //      print(
                                                                        //       IsIDExists);

                                                                        Future.delayed(
                                                                            Duration(milliseconds: 3),
                                                                            () {
                                                                          if (IsIDExists ==
                                                                              true) {
                                                                            // print(
                                                                            //     "=========================");
                                                                            showCupertinoDialog(
                                                                                context: context,
                                                                                builder: CreateDialog33);
                                                                            IsIDExists =
                                                                                false;
                                                                            //  print("10000");
                                                                          } else {
                                                                            setState(() {
                                                                              Req.UpdateRequest(RID, "IsActive", "true");
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
                                                                        setState(
                                                                            () {
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
                                                                        Color.fromARGB(
                                                                            156,
                                                                            123,
                                                                            186,
                                                                            197),
                                                                    activeColor:
                                                                        Color(
                                                                            0xff0da6c2),
                                                                  ),
                                                                )),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -0.88,
                                                                    0.820),
                                                            child: IsSwitched
                                                                ? Text(
                                                                    "  يمكن للمفوض أستلام الطالب",
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              Color(0xFF101213),
                                                                          fontSize:
                                                                              8,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  )
                                                                : Text(
                                                                    "  لا يمكن للمفوض أستلام الطالب",
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              Color(0xFF101213),
                                                                          fontSize:
                                                                              8,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                          ),
                                                        ]),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.77, -0.59),
                                                          child: Text(
                                                            " المفوض" +
                                                                " " +
                                                                DelegatorrNam[
                                                                    index],
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
                                      ))
                                    : Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            180, 20, 20, 20),
                                        child: Text("لا توجد طلبات"));
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
                              style:
                                  FlutterFlowTheme.of(context).title2.override(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFF29294D),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 175,
                      ),
                      Align(
                        alignment: Alignment(0.91, 0.9),
                        child: Text(
                          "المفوضين الغير المتاحين",
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
                                    //print("aaa");

                                    Accepted = snap[index]["isAccepted"];
                                    Active = snap[index]["IsActive"];
                                    DelegatorActive =
                                        snap[index]["DelegatorActive"];
                                    //  print("bbbbbb");
                                    if (Accepted == "true" &&
                                        DelegatorActive == "false") {
                                      ShowRequest = true;
                                      //print(RID);
                                      //print("MMMMMMMMMMMMMMM");
                                      //print(Active);
                                      // print(IsAct);
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
                                                            fontSize: 7,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -0.9, 0.19),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 4, 0),
                                                      child: Container(
                                                        width: 80.7,
                                                        height: 26,
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
                                                        child: Stack(children: [
                                                          Text(
                                                              "لن يتمكن من أستلام الطالب ",
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                  fontSize: 9,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: Colors
                                                                      .grey)),
                                                        ]),
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
                                                          DelegatorrNam2[index],
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                                                  0, 4, 0, 0),
                                                      child: Text(
                                                        " "
                                                                "  لطالب" +
                                                            " " +
                                                            StudentName2[index],
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
                        Row(children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: Align(
                              //  alignment: Alignment(-0.98, -0.97),
                              child: Container(
                                height: 35.0,
                                width: 35.0,
                                child: FittedBox(
                                  child: FloatingActionButton(
                                    onPressed: () {
                                      /*  Navigator.of(context).push(CupertinoPageRoute(
                                    builder: (context) => CreateDelegator(),
                                  ));*/
                                    },
                                    elevation: 0,
                                    child: Container(
                                      height: 70,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.2),
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
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  193, 10, 0, 10),
                              child: new Container(
                                width: 150.0,
                                height: 30,
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
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Tab(
                                      child: Text(
                                        "الطلبات",
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
                                  "حالة الطلب",
                                  textAlign: TextAlign.left,
                                  style: FlutterFlowTheme.of(context)
                                      .title2
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFF29294D),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 245,
                          ),
                          Align(
                            alignment: Alignment(0.91, 0.9),
                            child: Text(
                              'قيد الانتظار',
                              textAlign: TextAlign.left,
                              style:
                                  FlutterFlowTheme.of(context).title2.override(
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
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
                                                                  .fromSTEB(0,
                                                                      0, 4, 0),
                                                          child: Container(
                                                            width: 50.7,
                                                            height: 22,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors.grey
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
                                                              DelegatorrNam3[
                                                                  index],
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
                                                                  .fromSTEB(0,
                                                                      4, 0, 0),
                                                          child: Text(
                                                            " "
                                                                    "  لطالب" +
                                                                " " +
                                                                StudentName3[
                                                                    index],
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
                                  style: FlutterFlowTheme.of(context)
                                      .title2
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFF29294D),
                                        fontSize: 12,
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
                              style:
                                  FlutterFlowTheme.of(context).title2.override(
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
                                ]),
                                builder: (context, snapshot) {
                                  print("Nooooooooooooooooooo");
                                  if (snapshot.hasData) {
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
                                        if (Accepted != "Waiting") {
                                          NotWaiting = true;
                                          RID = snap[index].reference.id;

                                          if (Accepted == "true") {
                                            ShowRequest = true;

                                            RStatus = true;
                                          }

                                          if (Accepted == "false") {
                                            ShowRequest = false;
                                            RStatus = false;
                                          }
                                        } else {
                                          ShowRequest = false;
                                        }
                                        return ShowRequest
                                            ? Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(5, 5, 5, 5),
                                                child: Container(
                                                  width: 350.6,
                                                  height: 65.3,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
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
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -0.9, -0.19),
                                                        child: InkWell(
                                                            // height: 80,

                                                            onTap: () {
                                                              //   print(
                                                              //      "llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll");
                                                              showCupertinoDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      CreateDialog5);
                                                            },
                                                            child: Container(
                                                              width: 19,
                                                              height: 19,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            40),
                                                                color: Color(
                                                                    0xFFE32121),
                                                              ),
                                                              child:
                                                                  const Center(
                                                                      child:
                                                                          Icon(
                                                                Icons.close,
                                                                color: Color
                                                                    .fromARGB(
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
                                                                -0.79, -0.12),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 4, 0),
                                                          child: RStatus
                                                              ? Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  child:
                                                                      Container(
                                                                    width: 50.7,
                                                                    height: 22,
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
                                                                          BorderRadius.circular(
                                                                              20),
                                                                      shape: BoxShape
                                                                          .rectangle,
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: Color.fromARGB(
                                                                                255,
                                                                                79,
                                                                                198,
                                                                                111)
                                                                            .withOpacity(0.2),
                                                                      ),
                                                                    ),
                                                                    child: Text(
                                                                        "مقبوله",
                                                                        textAlign:
                                                                            TextAlign
                                                                                .center,
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                11,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            color: const Color(0xff57d77a))),
                                                                  ),
                                                                )
                                                              : Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  child:
                                                                      Container(
                                                                    width: 50.7,
                                                                    height: 22,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Colors
                                                                          .red
                                                                          .withOpacity(
                                                                              0.2),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              20),
                                                                      shape: BoxShape
                                                                          .rectangle,
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: Colors
                                                                            .red
                                                                            .withOpacity(0.2),
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
                                                                                FontWeight.w600,
                                                                            color: Colors.red)),
                                                                  ),
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
                                                              DelegatorrNam4[
                                                                  index],
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
                                                                  .fromSTEB(0,
                                                                      4, 0, 0),
                                                          child: Text(
                                                            " "
                                                                    "  لطالب" +
                                                                " " +
                                                                StudentName4[
                                                                    index],
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
                                  style: FlutterFlowTheme.of(context)
                                      .title2
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFF29294D),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 198,
                          ),
                          Align(
                            alignment: Alignment(0.91, 0.9),
                            child: Text(
                              'الطلبات المرفوضه',
                              textAlign: TextAlign.left,
                              style:
                                  FlutterFlowTheme.of(context).title2.override(
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
                                        if (Accepted != "Waiting") {
                                          NotWaiting = true;
                                          RID = snap[index].reference.id;

                                          if (Accepted == "true") {
                                            ShowRequest = false;

                                            RStatus = true;
                                          }

                                          if (Accepted == "false") {
                                            ShowRequest = true;
                                            RStatus = false;
                                          }
                                        } else {
                                          ShowRequest = false;
                                        }
                                        return ShowRequest
                                            ? Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(5, 5, 5, 5),
                                                child: Container(
                                                  width: 367.6,
                                                  height: 65.3,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
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
                                                                  .fromSTEB(10,
                                                                      0, 0, 0),
                                                          child: Container(
                                                            width: 50.7,
                                                            height: 22,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors.red
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
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.78, -0.59),
                                                        child: Text(
                                                          " المفوض" +
                                                              " " +
                                                              DelegatorrNam5[
                                                                  index],
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
                                                                  .fromSTEB(0,
                                                                      4, 0, 0),
                                                          child: Text(
                                                            " "
                                                                    "  لطالب" +
                                                                " " +
                                                                StudentName5[
                                                                    index],
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
                        ), //here im

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

  Future GetStudentName(snap) async {
    print("Entered!");
    int count = 0;
    //StudentName.clear();
    //DelegatorrNam.clear();
    String n = "lllllllllllllllllll";
    List<String> StudentID = [];
    List<String> DDelegatorrID = [];
    try {
      for (var i = 0; snap[i] != null; i++) {
        SnapCount += 1;
        StudentID.add(snap[i]["StudentID"]);
        DDelegatorrID.add(snap[i]["DelegatorID"]);
        print(snap[i]["DelegatorID"]);
      }
    } catch (error) {
      //   print("error");
    }
    // print("SnapppppppppppppppppppppppppppppppCount");
    // print(SnapCount);
    for (var j = 0; j < StudentID.length; j++) {
      print("object");
      print(StudentID[j]);
      print(j);
      await ColStudent.doc(StudentID[j]).get().then((value) {
        //StudentName.add(value.get('Name'));
        //  print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
        // print("StID");
        // print(StudentID[j]);
        // print("3333333333333333333333");
        //  print(StudentName[0]);
        // Access your after your get the data
        count = 1;
        print(value["Name"]);

        StudentName.add(value["Name"] + " " + value["NationalID"]);
        // print("Starteddd");
        // print("ennnnnnnnnnnnnnnddddddddddddddddddddd");
      });
    }
    for (var v = 0; v < DDelegatorrID.length; v++) {
      print("obj111111111111111111111ect");
      print(DDelegatorrID[v]);
      await DelegatorCollection.doc(DDelegatorrID[v]).get().then((value) {
        //StudentName.add(value.get('Name'));
        //  print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
        // print("StID");
        // print(StudentID[j]);
        print("3333333333333333333333");
        //  print(StudentName[0]);
        // Access your after your get the data
        //count = 1;
        print(value["Name"]);

        DelegatorrNam.add(value["Name"] + " " + value["ID"]);
        // print("Starteddd");
        // print("ennnnnnnnnnnnnnnddddddddddddddddddddd");
      });
    }
    // print(StudentName[0]);
  }

  Future GetStudentName2(snap) async {
    // print("Entered!");
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

        StudentName2.add(value["Name"] + " " + value["NationalID"]);
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

        DelegatorrNam2.add(value["Name"] + " " + value["ID"]);
        // print("Starteddd");
        // print("ennnnnnnnnnnnnnnddddddddddddddddddddd");
      });
    }
    // print(StudentName[0]);
  }

  Future GetStudentName3(snap) async {
    //  print("Enter222222222222222222ed!");
    int count = 0;

    String n = "lllllllllllllllllll";
    List<String> StudentID = [];
    List<String> DDelegatorrID = [];
    try {
      for (var i = 0; snap[i] != null; i++) {
        SnapCount += 1;
        StudentID.add(snap[i]["StudentID"]);
        DDelegatorrID.add(snap[i]["DelegatorID"]);
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

        StudentName3.add(value["Name"] + " " + value["NationalID"]);
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

        DelegatorrNam3.add(value["Name"] + " " + value["ID"]);
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

        StudentName4.add(value["Name"] + " " + value["NationalID"]);

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

        DelegatorrNam4.add(value["Name"] + " " + value["ID"]);
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

        StudentName5.add(value["Name"] + " " + value["NationalID"]);

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

        DelegatorrNam5.add(value["Name"] + " " + value["ID"]);
        // print("Starteddd");
        // print("ennnnnnnnnnnnnnnddddddddddddddddddddd");
      });
    }

    // print(StudentName[0]);
  }

  Future getDelegatorID(snap) async {
    /* print("QQQQQQQQQQQQQQQQQQQQQQQQQQQ");
    print("DDDDDDDDDDDDDDDDDDDDDDDDDDD");
    print("EEEEEEEEEEEEEEEEEEEEEEEEEEEEE");
    print("CCCCCCCCCCCCCCCCCCCCCCCCCCC");
    print("QQQQQQQQQQQQQQQQQQQQQQQQQQQ");
    print("DDDDDDDDDDDDDDDDDDDDDDDDDD");
    print("QQQQQQQQQQQQQQQQQQQQQQQQQQQ");
    print("VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV");
    print("QQQQQQQQQQQQQQQQQQQQQQQQQQQ");
    print("WWWWWWWWWWWWWWWWWWWWWWWWWW");
    print("QQQQQQQQQQQQQQQQQQQQQQQQQQQ");
    print("HHHHHHHHHHHHHHHHHHHHHHHHHHHHH");
    print("QQQQQQQQQQQQQQQQQQQQQQQQQQQ");
*/
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
//print(SnapCount);
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
