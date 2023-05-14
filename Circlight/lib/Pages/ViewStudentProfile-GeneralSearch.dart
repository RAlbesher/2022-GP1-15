import 'package:circlight/Pages/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:convert';

import 'package:circlight/Pages/Parent.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../models/user_data.dart';
import 'Nav.dart';
import 'base_screen.dart';
import 'displayParent.dart';

import 'header_widget.dart';

// this is the edit for parent
class ViewStudentProfile extends StatefulWidget {
  ViewStudentProfile({
    Key? key,
    required this.users,
    required this.currentIndex,
  }) : super(key: key);
  List<StudentModel> users;
  int currentIndex;

  @override
  State<ViewStudentProfile> createState() => _ViewStudentProfile();
  getData(change) {
    //  isChanged = change;
  }
}

class _ViewStudentProfile extends State<ViewStudentProfile>
    with TickerProviderStateMixin {
  int t = 0;
  bool isFieldChange = false;
  //late bool isDrop = widget.DropDown;
  bool isDropDown = false;
  var IsSave;
  double _headerHeight = 250;
  int _changedNumber = 0, _selectedNumber = 1;
  var DropValue;
  int C = 0;
  late String Numvalue = "1";
  late String DBvalue = "";
  // this is the list for the relatives
  final Relation = ["أم", "أب", "أخت", "أخ", "خالة", "خال", "عمة", "عم"];
  String OldValue = "";
  String Paretname = "";

  String isDiscard = "false";
  final formKey = GlobalKey<FormState>();
  Parent parentx = new Parent(
      Name: "",
      Email: "",
      PUserName: "",
      PNationalID: "",
      PJobTitle: "",
      PPhoneNumber: "",
      PAltPhoneNumber: "",
      PNationality: "",
      Password: '',
      PRelativeRelation: "");
  bool RelativeCh = false;
//for username uniqueness
  List<String> docEmails = [];

  List<String> docUserName = [];

  List<String> docAdmin = [];
  bool check = true;
  Future getEmail() async {
    await FirebaseFirestore.instance.collection("Parent").get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            // print(document["Email"]);

            docEmails.add(document["Email"]);
          }),
        );
  }

//for username uniqueness

  Future getUserName() async {
    await FirebaseFirestore.instance.collection("Parent").get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            docUserName.add(document["UserName"]);
          }),
        );
  }

  //get admin ID

  Future getAdminID() async {
    await FirebaseFirestore.instance.collection("Admin").get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            // print(document["Email"]);

            docAdmin.add(document.reference.id);
          }),
        );
  }

  late String Dvalue;
  late int Inx;
  CollectionReference Student = FirebaseFirestore.instance.collection("Parent");
  final ParentRef = FirebaseFirestore.instance;
  List<String> docIDs = [];
  TextEditingController parentName = TextEditingController();
  TextEditingController parentNationality = TextEditingController();
  TextEditingController parentEmail = TextEditingController();
  TextEditingController parentUserName = TextEditingController();
  TextEditingController NationalID = TextEditingController();
  TextEditingController Nationality = TextEditingController();
  TextEditingController JobTitle = TextEditingController();
  TextEditingController Phone = TextEditingController();
  TextEditingController AltPhone = TextEditingController();
  TextEditingController RelativeRelation = TextEditingController();

  bool isEmailCorrect = false;
  bool isDone = false;

  String Field = "None";
  String UpdatedValue = "";
  int DIndex = 1;
  late bool save;
  List<String> ParentName = [];
  int index = 0;
  late TextEditingController controller;
  late FixedExtentScrollController scrollController;
  String Title = "";
  int DropIndex = 0;
  //late bool isSaved = widget.Confirm;
  late AnimationController _ColorAnimationController;
  late AnimationController _TextAnimationController;
  late Animation _colorTween, _iconColorTween, _icon2ColorTween;
  late Animation<Offset> _transTween;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetNames().then((value) {
      setState(() {
        Paretname = ParentName[index].toString();
      });
    });
    _ColorAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 0));
    _colorTween = ColorTween(begin: Colors.transparent, end: Colors.white)
        .animate(_ColorAnimationController);
    _iconColorTween = ColorTween(begin: Colors.white, end: Colors.grey)
        .animate(_ColorAnimationController);
    _icon2ColorTween =
        ColorTween(begin: Colors.white, end: const Color(0xFF29294D))
            .animate(_ColorAnimationController);

    _TextAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 0));

    _transTween = Tween(begin: Offset(-10, 40), end: Offset(-10, 0))
        .animate(_TextAnimationController);
    scrollController = FixedExtentScrollController(initialItem: DIndex);
    controller = TextEditingController(text: Relation[DIndex]);
    Dvalue = parentx.PRelativeRelation;
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    @override
    void dispose() {
      // TODO: implement dispose
      super.dispose();
      // print(widget.users[widget.currentIndex].Name)
    }

    getEmail();

    getUserName();

    getAdminID();

    // ignore: deprecated_member_use
    IsSave = List<int>.filled(5, 0);
    DropValue = List<String>.generate(10, growable: true, (index) => "null");
    DropValue[DropIndex] = "أم";
    DropIndex += 1;

    // int whichpagee = widget.whichpag;
    // String TheValuee = widget.TheValue;
    // int WIndex = widget.Index;
    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    //String change = widget.isChanged;
    var size = MediaQuery.of(context).size;

    int Tab = 0;

    Widget currentScreen = BaseScreen();

    // initState();
    // dispose();
    return Scaffold(
        backgroundColor: Color.fromRGBO(252, 253, 255, 1),
        extendBodyBehindAppBar: true,
        key: _scaffoldKey,
        // appBar: AppBar(title: Text("Faten")),

        body: NotificationListener<ScrollNotification>(
            onNotification: _scrollListener,
            child: Container(
                height: double.infinity,
                child: Stack(children: <Widget>[
                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 250,
                          child: Stack(
                            children: [
                              Image.asset(
                                'assets/images/formbackground.png',
                                width: double.infinity,
                                height: 230,
                                fit: BoxFit.cover,
                              ),
                              Align(
                                alignment: AlignmentDirectional(-0.06, 0.60),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 12, 0, 0),
                                  child: Text(
                                    " معلومات الطالب",
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 30, 0, 0),
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            CupertinoPageRoute(
                                                builder: (context) => Nav(
                                                      TabValue: 13,
                                                    )));
                                      },
                                      icon: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 16,
                                        color: _iconColorTween.value,
                                      ),
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 1,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 35),
                          child: Form(
                            key: formKey,
                            child: Column(children: [
                              InkWell(
                                child: Container(
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.only(bottom: 10),
                                      ),
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              left: 2, bottom: 10),
                                          child: Text(
                                            style: GoogleFonts.poppins(
                                                fontSize: 13.5,
                                                fontWeight: FontWeight.w600,
                                                color: Color.fromARGB(
                                                    255, 162, 158, 158)),
                                            widget
                                                .users[widget.currentIndex].Name
                                                .toString(),
                                            maxLines: 2,
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              right: 10, bottom: 10),
                                          child: Text(
                                            style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: const Color(0xFF29294D)),
                                            " اسم الطالب",
                                            maxLines: 2,
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          width: 1.0,
                                          color: const Color(0xFF29294D)),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                              InkWell(
                                child: Container(
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.only(bottom: 10),
                                        child: Positioned(
                                          left: 0.0,
                                          child: Icon(
                                            Icons.arrow_back_ios_outlined,
                                            color: const Color(0xFF29294D),
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              left: 2, bottom: 10),
                                          child: Text(
                                            style: GoogleFonts.poppins(
                                                fontSize: 13.5,
                                                fontWeight: FontWeight.w600,
                                                color: Color.fromARGB(
                                                    255, 188, 187, 187)),
                                            // ParentName[0].toString()
                                            // ,

                                            Paretname,
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              right: 10, bottom: 10),
                                          child: Text(
                                            style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: const Color(0xFF29294D)),
                                            'اسم ولي الامر',
                                            maxLines: 2,
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          width: 1.0,
                                          color: const Color(0xFF29294D)),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.of(context).push(CupertinoPageRoute(
                                    builder: (context) => Nav(
                                      TabValue: 26,
                                      documentId: widget
                                          .users[widget.currentIndex].ParentId
                                          .toString(),
                                    ),
                                  ));
                                },
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                              InkWell(
                                child: Container(
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.only(bottom: 10),
                                      ),
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              left: 2, bottom: 10),
                                          child: Text(
                                            style: GoogleFonts.poppins(
                                                fontSize: 13.5,
                                                fontWeight: FontWeight.w600,
                                                color: Color.fromARGB(
                                                    255, 188, 187, 187)),
                                            widget.users[widget.currentIndex]
                                                .UserName
                                                .toString(),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              right: 10, bottom: 10),
                                          child: Text(
                                            style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: const Color(0xFF29294D)),
                                            'اسم المستخدم',
                                            maxLines: 2,
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          width: 1.0,
                                          color: const Color(0xFF29294D)),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                              InkWell(
                                child: Container(
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.only(bottom: 10),
                                      ),
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              left: 2, bottom: 10),
                                          child: Text(
                                            style: GoogleFonts.poppins(
                                                fontSize: 13.5,
                                                fontWeight: FontWeight.w600,
                                                color: Color.fromARGB(
                                                    255, 162, 158, 158)),
                                            widget.users[widget.currentIndex]
                                                .NationalID
                                                .toString(),
                                            maxLines: 2,
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              right: 10, bottom: 10),
                                          child: Text(
                                            style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: const Color(0xFF29294D)),
                                            " رقم الهوية/الإقامة",
                                            maxLines: 2,
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          width: 1.0,
                                          color: const Color(0xFF29294D)),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                              InkWell(
                                child: Container(
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.only(bottom: 10),
                                      ),
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              left: 2, bottom: 10),
                                          child: Text(
                                            style: GoogleFonts.poppins(
                                                fontSize: 13.5,
                                                fontWeight: FontWeight.w600,
                                                color: Color.fromARGB(
                                                    255, 162, 158, 158)),
                                            widget.users[widget.currentIndex]
                                                .Nationality
                                                .toString(),
                                            maxLines: 2,
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              right: 10, bottom: 10),
                                          child: Text(
                                            style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: const Color(0xFF29294D)),
                                            "الجنسية",
                                            maxLines: 2,
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          width: 1.0,
                                          color: const Color(0xFF29294D)),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                              Center(
                                child: new Wrap(
                                    spacing: 5.0,
                                    runSpacing: 5.0,
                                    direction: Axis
                                        .vertical, // main axis (rows or columns)
                                    children: <Widget>[
                                      Expanded(
                                        child: Container(
                                          width: 313,
                                          // padding:
                                          // padding: EdgeInsets.only(right: 4),
                                          //   EdgeInsets.symmetric(horizontal: 120),
                                          decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                  width: 1.0,
                                                  color:
                                                      const Color(0xFF29294D)),
                                            ),
                                          ),
                                          alignment: Alignment.center,
                                          child: Flexible(
                                            child: Row(
                                              children: <Widget>[
                                                Container(
                                                  child: Row(
                                                    children: <Widget>[
                                                      Container(
                                                        alignment:
                                                            Alignment.center,
                                                        padding:
                                                            EdgeInsets.only(
                                                                right: 4),
                                                        /*child: Positioned(
                                                          left: 0,
                                                          child: Icon(
                                                            Icons
                                                                .arrow_circle_down_rounded,
                                                            // Icons.arrow_downward_outlined,
                                                            color: const Color(
                                                                0xFF29294D),
                                                            size: 16,
                                                          ),
                                                        ),*/
                                                      ),
                                                      Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 120),
                                                          child: Text(
                                                            style: GoogleFonts.poppins(
                                                                fontSize: 13.5,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        162,
                                                                        158,
                                                                        158)),
                                                            widget
                                                                .users[widget
                                                                    .currentIndex]
                                                                .BloodType
                                                                .toString(),

                                                            maxLines: 2,
                                                            // textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 80,
                                                      ),
                                                      Row(children: [
                                                        Text(
                                                          style: GoogleFonts.poppins(
                                                              fontSize: 14,
                                                              color: const Color(
                                                                  0xFF29294D)),
                                                          "فصيله الدم",
                                                          maxLines: 2,
                                                          textAlign:
                                                              TextAlign.right,
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Image.asset(
                                                            "assets/icons/Blood.png",
                                                            width: 15,
                                                            height: 15,
                                                            color: Color(
                                                                0xFF29294D)),
                                                      ]),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]),
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                              Center(
                                child: new Wrap(
                                    spacing: 5.0,
                                    runSpacing: 5.0,
                                    direction: Axis
                                        .vertical, // main axis (rows or columns)
                                    children: <Widget>[
                                      Expanded(
                                        child: Container(
                                          width: 313,
                                          // padding:
                                          // padding: EdgeInsets.only(right: 4),
                                          //   EdgeInsets.symmetric(horizontal: 120),
                                          decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                  width: 1.0,
                                                  color:
                                                      const Color(0xFF29294D)),
                                            ),
                                          ),
                                          alignment: Alignment.center,
                                          child: Flexible(
                                            child: Row(
                                              children: <Widget>[
                                                Container(
                                                  child: Row(
                                                    children: <Widget>[
                                                      Container(
                                                        alignment:
                                                            Alignment.center,
                                                        padding:
                                                            EdgeInsets.only(
                                                                right: 4),
                                                        /*child: Positioned(
                                                          left: 0,
                                                          child: Icon(
                                                            Icons
                                                                .arrow_circle_down_rounded,
                                                            // Icons.arrow_downward_outlined,
                                                            color: const Color(
                                                                0xFF29294D),
                                                            size: 16,
                                                          ),
                                                        ),*/
                                                      ),
                                                      Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 120),
                                                          child: Text(
                                                            style: GoogleFonts.poppins(
                                                                fontSize: 13.5,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        162,
                                                                        158,
                                                                        158)),
                                                            widget
                                                                .users[widget
                                                                    .currentIndex]
                                                                .Class
                                                                .toString(),
                                                            maxLines: 2,
                                                            // textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 80,
                                                      ),
                                                      Row(children: [
                                                        Text(
                                                          style: GoogleFonts.poppins(
                                                              fontSize: 14,
                                                              color: const Color(
                                                                  0xFF29294D)),
                                                          'صف الطالب',
                                                          maxLines: 2,
                                                          textAlign:
                                                              TextAlign.right,
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Image.asset(
                                                            "assets/icons/Class.png",
                                                            width: 15,
                                                            height: 15,
                                                            color: Color(
                                                                0xFF29294D)),
                                                      ]),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]),
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                              const SizedBox(
                                height: 15,
                              )
                            ]),
                          ),
                        ),
                        SizedBox(
                          height: 32.0,
                        ),
                      ],
                    ),
                  ),
                ]))));
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

  Future GetNames() async {
    ParentName.clear;

    await Student.doc(widget.users[widget.currentIndex].ParentId.toString())
        .get()
        .then((value) {
      ParentName.add(value["Name"]);
    });
  }
}
