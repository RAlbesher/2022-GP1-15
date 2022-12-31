import 'package:circlight/Pages/Requests.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:circlight/Pages/header_widget.dart';
import 'package:intl/intl.dart';
import 'DelegatorList.dart';
import 'Nav.dart';
import 'Parent.dart';
import 'dart:ui' as ui;
import 'dart:math';
import 'package:share_plus/share_plus.dart';
import 'dart:async';

class CreateDelegator extends StatefulWidget {
  var Realtion;
  var Name;
  var username;
  var email;
  var ID;
  var nationality;
  var phone1;
  var phone2;
  var job;
  var header;

  CreateDelegator(
      {super.key,
      this.Realtion,
      this.ID,
      this.Name,
      this.username,
      this.email,
      this.nationality,
      this.job,
      this.phone1,
      this.phone2,
      this.header});

  @override
  State<CreateDelegator> createState() => _CreateDelegator();
}

class _CreateDelegator extends State<CreateDelegator>
    with TickerProviderStateMixin {
  int _changedNumber = 0, _selectedNumber = 1;
  late String value = "-";
  final TheDuration = ["-", "يوم واحد", "اسبوع", "شهر"];
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

  var StName;
  //defining a lists
  List<String> docEmails = [];
  List<String> docUserName = [];
  List<String> DelegatorList = [];
  List<String> StudentList = [];
  List<String> docAdmin = [];
  var isAdded = true;
//for username uniqueness
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

//To get the list of Delegators

  //get admin ID
  Future getAdminID() async {
    await FirebaseFirestore.instance.collection("Admin").get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            // print(document["Email"]);
            docAdmin.add(document.reference.id);
          }),
        );
  }

  UpdateDelegatorList() {
//FirebaseFirestore.instance.collection("Admin").where(field)
  }

// to control the apearance of the buttons
  bool issahre = false;
  bool isshowadd = false;
  bool showno = true;
  bool isWrong = false;
  bool isCorrect = false;

  bool isSTWrong = false;
  bool isSTCorrect = false;
  CollectionReference Studentt =
      FirebaseFirestore.instance.collection('Student');
  //to generate a random password
  var k = Random().nextInt(10000) + 10000000000000000;
  late TextEditingController controller;
  var Real;
  late FixedExtentScrollController scrollController;
  late AnimationController _ColorAnimationController;
  late AnimationController _TextAnimationController;
  late Animation _colorTween, _iconColorTween, _icon2ColorTween;
  late Animation<Offset> _transTween;
  int Index = 0;
  void initState() {
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
    scrollController = FixedExtentScrollController(initialItem: Index);
    controller = TextEditingController(text: TheDuration[Index]);
    super.initState();
  }

  var SID;
  Request Req = new Request(
      DName: "", Dusername: "", isAccepted: false, isActive: "false", SID: "");

  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   scrollController.dispose();
  //   controller.dispose();
  //   parentName.dispose();
  //   Parentusername.dispose();
  //   email.dispose();
  //   Parentusername.dispose();
  //   ParentIDNo.dispose();
  //   nationality.dispose();
  //   jobTitle.dispose();
  //   phoneNumber.dispose();
  //   altphoneNumber.dispose();
  //   RelativeRelation.dispose();
  // }

  String name = "";

  double _headerHeight = 250;
  TextEditingController parentName = TextEditingController();
  TextEditingController DelegatortName = TextEditingController();
  TextEditingController Parentusername = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController ParentIDNo = TextEditingController();
  TextEditingController Student = TextEditingController();
  TextEditingController nationality = TextEditingController();
  TextEditingController jobTitle = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController altphoneNumber = TextEditingController();
  TextEditingController RelativeRelation = TextEditingController();
  TextEditingController Delegatorsername = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final formKeyDelegator = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();

  var IsIDExists = false;
  @override
  Widget build(BuildContext context) {
    final periodicTimer = Timer.periodic(
      const Duration(seconds: 200),
      (timer) {},
    );

    Future GetDelegators() async {
      await FirebaseFirestore.instance.collection("Delegator").get().then(
            (snapshot) => snapshot.docs.forEach((document) {
              //DelegatorList.add(document["UserName"]);
              DelegatorList.add(document["UserName"]);
            }),
          );
    }

    Future GetStudent() async {
      await FirebaseFirestore.instance.collection("Student").get().then(
            (snapshot) => snapshot.docs.forEach((document) {
              //DelegatorList.add(document["UserName"]);
              StudentList.add(document["UserName"]);
            }),
          );
    }

    Future CheckForStudent(SID) async {
      await FirebaseFirestore.instance.collection("Requests").get().then(
            (snapshot) => snapshot.docs.forEach((document) {
              if (document.reference.id == SID) {
                IsIDExists = true;
              }
            }),
          );
    }

    Real = List<String>.filled(5, "");
    final now = new DateTime.now();

    print(now);
    // ignore: unused_local_variable
    String formatter = DateFormat('yMd').format(now);
    String day = formatter.toString().substring(0, 2);
    String Month = formatter.toString().substring(3, 5);
    //print(Month);
    final double height = MediaQuery.of(context).size.height;
    //final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    CollectionReference Parent =
        FirebaseFirestore.instance.collection("Parent");
    var str = "";
    getEmail();
    getUserName();
    getAdminID();
    GetDelegators();
    GetStudent();
    String x = "";

    print(DelegatorList.length);
    int m = DelegatorList.length;
    for (var i = 0; i < DelegatorList.length; i++) {
      x = DelegatorList[i];
    }
    return Scaffold(
      backgroundColor: Color.fromRGBO(252, 253, 255, 1),
      // floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      // appBar: AppBar(title: Text("Faten")),
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
                  children: [
                    Container(
                      height: Get.height * 0.4,
                      child: Stack(
                        children: [
                          Container(
                            height: _headerHeight,
                            child: HeaderWidget(
                                _headerHeight,
                                false,
                                Icons
                                    .login_rounded), //let's create a common header widget
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              width: 120,
                              height: 120,
                              margin: EdgeInsets.only(bottom: 20),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 255, 244, 244),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xff57d77a).withOpacity(0.2),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Center(
                                  child: Icon(
                                Icons.person,
                                size: 60,
                                color: Color(0xff57d77a).withOpacity(0.4),
                              )),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 35),
                      child: Column(
                        children: [
                          Form(
                              key: formKey,
                              child: Column(children: [
                                Column(children: [
                                  Directionality(
                                    textDirection: ui.TextDirection.rtl,
                                    child: TextField(
                                      controller:
                                          DelegatortName, //..text = parentx.Name,
                                      readOnly: true,

                                      //  controller: parentUserName..text = parentx.PUserName,
                                      //to take text from user input
                                      textAlign: TextAlign.right,

                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          //fontWeight: FontWeight.w600,
                                          color: Colors.grey),
                                      showCursor: true,
                                      cursorColor: const Color(0xff42c98d),

                                      decoration: InputDecoration(
                                        labelText: "اسم المفوض",
                                        hintText: " ادخل اسم المفوض ",
                                        hintStyle: const TextStyle(
                                            color: Colors.grey, fontSize: 12),
                                        labelStyle: const TextStyle(
                                            color: const Color(0xff42c98d),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 12, top: 9, left: 9),
                                          child: Container(
                                            //  padding: const EdgeInsets.only(right: 5),

                                            child: Column(children: [
                                              Image.asset(
                                                "assets/icons/name.png",
                                                width: 20,
                                                height: 20,
                                                color: const Color(0xff42c98d),
                                              )
                                            ]),
                                          ),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: const Color(0xff42c98d),
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        floatingLabelStyle: const TextStyle(
                                            color: const Color(0xff42c98d),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w300),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: const Color(0xff42c98d),
                                              width: 2),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                      ),
                                    ),
                                  ),
                                ])
                              ])),
                          Form(
                              key: formKeyDelegator,
                              child: Column(children: [
                                Column(children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Directionality(
                                    textDirection: ui.TextDirection.rtl,
                                    child: TextFormField(
                                      onChanged: (val) {
                                        ////////////////////////
                                        ///
                                        formKeyDelegator.currentState
                                            ?.validate();

                                        for (var i = 0;
                                            i < DelegatorList.length;
                                            i++) {
                                          if (val == DelegatorList[i]) {
                                            print("the delegator exsits");
                                            print(DelegatorList[i]);
                                            print(val);

                                            isWrong = true;
                                            isCorrect = true;
                                            formKeyDelegator.currentState
                                                ?.validate();
                                            print("isWrong:");
                                            print(isWrong);
                                            print("isCorrect:");
                                            print(isCorrect);
                                            break;
                                          } else {
                                            print("Heeree");
                                            isWrong = false;
                                            isCorrect = true;
                                          }
                                        }

                                        if (isWrong) {
                                          print("ssssssssssssssssssssssss");
                                          print(Delegatorsername.text);
                                          FirebaseFirestore.instance
                                              .collection("Delegator")
                                              .get()
                                              .then((snapshot) => snapshot.docs
                                                      .forEach((document) {
                                                    if (Delegatorsername.text ==
                                                        document["UserName"]) {
                                                      DelegatortName
                                                        ..text =
                                                            document["Name"];
                                                      print(
                                                          "++++++++++++++++++++++++++++++++++");
                                                      print(str);
                                                    }
                                                  }));
                                        }

                                        // اذا فالد بتصير بترو

                                        print("wwwwwwwwwwwwwwwwwwww");
                                        print(isWrong);
                                        print(isCorrect);
                                      },
                                      controller: Delegatorsername,
                                      //  controller: parentUserName..text = parentx.PUserName,
                                      //to take text from user input
                                      textAlign: TextAlign.right,

                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          //fontWeight: FontWeight.w600,
                                          color: Colors.grey),
                                      showCursor: true,
                                      cursorColor: const Color(0xff42c98d),

                                      decoration: InputDecoration(
                                        hintText: " أدخل اسم المستخدم",
                                        labelText: " اسم المستخدم للمفوض",
                                        hintStyle: const TextStyle(
                                            color: Colors.grey, fontSize: 12),
                                        labelStyle: const TextStyle(
                                            color: const Color(0xff42c98d),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w300),
                                        prefixIcon: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 5),
                                          child: Icon(
                                            Icons.person,
                                            size: 22,
                                            color: const Color(0xff42c98d),
                                          ),
                                        ),
                                        suffixIcon: isCorrect
                                            ? Align(
                                                widthFactor: 1.0,
                                                heightFactor: 1.0,
                                                child: isWrong
                                                    ? Icon(
                                                        Icons.check,
                                                        size: 18,
                                                        color: const Color(
                                                            0xff42c98d),
                                                      )
                                                    : Icon(
                                                        Icons.close,
                                                        size: 18,
                                                        color: Color.fromARGB(
                                                            255, 225, 80, 61),
                                                      ),
                                              )
                                            : Text(""),
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: const Color(0xff42c98d),
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        floatingLabelStyle: const TextStyle(
                                            color: const Color(0xff42c98d),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w300),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: const Color(0xff42c98d),
                                              width: 2),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                      ),

                                      validator: (value) {
                                        if (value!.isEmpty)
                                          return "أرجو منك تعبئه الحقل الفارغ ";
                                        else if (isWrong == false) {
                                          return " اسم المستخدم للمفوض غير صحيح";
                                        } else {}
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ])
                              ])),
                          Form(
                            key: formKey3,
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    Directionality(
                                      textDirection: ui.TextDirection.rtl,
                                      child: TextFormField(
                                        onChanged: (val) {
                                          ////////////////////////
                                          formKey3.currentState?.validate();

                                          setState(() {
                                            for (var i = 0;
                                                i < StudentList.length;
                                                i++) {
                                              if (val == StudentList[i]) {
                                                print("the delegator exsits");
                                                print(StudentList[i]);
                                                print(val);

                                                isSTWrong = true;
                                                isSTCorrect = true;
                                                formKey3.currentState
                                                    ?.validate();

                                                break;
                                              } else {
                                                print("Heeree");
                                                isSTWrong = false;
                                                isSTCorrect = true;
                                              }
                                            }

                                            // اذا فالد بتصير بترو
                                          });
                                        },
                                        controller: Student,
                                        //  controller: parentUserName..text = parentx.PUserName,
                                        //to take text from user input
                                        textAlign: TextAlign.right,

                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            //fontWeight: FontWeight.w600,
                                            color: Colors.grey),
                                        showCursor: true,
                                        cursorColor: const Color(0xff42c98d),

                                        decoration: InputDecoration(
                                          suffixIcon: isSTCorrect
                                              ? Align(
                                                  widthFactor: 1.0,
                                                  heightFactor: 1.0,
                                                  child: isSTWrong
                                                      ? Icon(
                                                          Icons.check,
                                                          size: 18,
                                                          color: const Color(
                                                              0xff42c98d),
                                                        )
                                                      : Icon(
                                                          Icons.close,
                                                          size: 18,
                                                          color: Color.fromARGB(
                                                              255, 225, 80, 61),
                                                        ),
                                                )
                                              : Text(""),
                                          hintText: " أدخل اسم المستخدم لطالب ",
                                          labelText: "اسم المستخدم للطالب  ",
                                          hintStyle: const TextStyle(
                                              color: Colors.grey, fontSize: 12),
                                          labelStyle: const TextStyle(
                                              color: const Color(0xff42c98d),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w300),
                                          prefixIcon: Padding(
                                            padding:
                                                const EdgeInsets.only(right: 5),
                                            child: Icon(
                                              Icons.person,
                                              size: 22,
                                              color: const Color(0xff42c98d),
                                            ),
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color:
                                                      const Color(0xff42c98d),
                                                  width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          floatingLabelStyle: const TextStyle(
                                              color: const Color(0xff42c98d),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w300),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: const Color(0xff42c98d),
                                                width: 2),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty)
                                            return "أرجو منك تعبئه الحقل الفارغ ";
                                          else if (isSTWrong == false) {
                                            return " اسم المستخدم للمفوض غير صحيح";
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                //////////////////////////////////////////////
                                ///
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Hero(
                      tag: "btn",
                      child: Center(
                        child: Container(
                          height: 50,
                          width: 400,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  const Color(0xff42c98d),
                                  const Color(0xff42c98d),
                                  const Color(0xff0da6c2),

                                  //add more colors
                                ]),
                                borderRadius: BorderRadius.circular(22),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: Color.fromRGBO(
                                          0, 0, 0, 0.57), //shadow for button
                                      blurRadius: 5) //blur radius of shadow
                                ]),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(0, 255, 255, 255),
                                onSurface: Colors.transparent,
                                shadowColor: Colors.transparent,
                                //make color or elevated button transparent
                              ),
                              onPressed: () async {
                                if (formKey.currentState!.validate() &&
                                    formKey3.currentState!.validate() &&
                                    formKeyDelegator.currentState!.validate()) {
                                  print(
                                      "22222222222222222222222222222222222222222222222222");
                                  print(isWrong);
                                  if (isWrong == true) {
                                    await FirebaseFirestore.instance
                                        .collection("Student")
                                        .get()
                                        .then(
                                          (snapshot) => snapshot.docs
                                              .forEach((document) async {
                                            if (document["UserName"] ==
                                                Student.text) {
                                              SID = document.reference.id;
                                              StName = document['Name'];
                                              showCupertinoDialog(
                                                  context: context,
                                                  builder: CreateDialog3);

                                              //  IsIDExists = false;
                                            }
                                          }),
                                        );

                                    /*await showCupertinoDialog(
                                      context: context, builder: CreateDialog);*/
                                  }
                                }
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: 18,
                                  right: 18,
                                ),
                                child: Text(
                                  "تفويض",
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    )
                  ],
                ),
              ),
              Container(
                height: 55,
                child: AnimatedBuilder(
                  animation: _ColorAnimationController,
                  builder: (context, child) => AppBar(
                    iconTheme: IconThemeData(
                      color: _iconColorTween.value,
                    ),
                    automaticallyImplyLeading: false,
                    title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: isshowadd
                                      ? CupertinoButton(
                                          child: Text(
                                            "إضافة",
                                            style: TextStyle(
                                                color: _icon2ColorTween.value,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          onPressed: () async {
                                            if (formKey.currentState!
                                                .validate()) {
                                              setState(() {
                                                issahre = true;
                                                isshowadd = false;
                                              });
                                              isAdded = false;

                                              await parentx.addParent(
                                                  parentName.text,
                                                  Parentusername.text,
                                                  email.text,
                                                  ParentIDNo.text,
                                                  phoneNumber.text,
                                                  altphoneNumber.text,
                                                  nationality.text,
                                                  k,
                                                  jobTitle.text,
                                                  RelativeRelation.text);

                                              await showCupertinoDialog(
                                                  context: context,
                                                  builder: CreateDialog);
                                            }
                                          },
                                        )
                                      : Text("         "),
                                ),
                                SizedBox(
                                  width: 80,
                                ),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text(
                                      "إنشاء تفويض جديد ",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: _iconColorTween.value),
                                    ),
                                  ),
                                ),
                              ]),
                        ]),
                    actions: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => Nav(
                                        TabValue: 10,
                                      )));
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: _iconColorTween.value,
                        ),
                        color: _iconColorTween.value,
                      ),
                    ],
                    backgroundColor: _colorTween.value,
                    elevation: 0,
                    titleSpacing: 0.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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

  Widget CreateDialog(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      title: Text("إضافة ولي الأمر",
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
              setState(() {
                showno = false;
              });
            },
            child: Text("موافق",
                style: TextStyle(
                    color: const Color(0xff57d77a),
                    fontWeight: FontWeight.bold))),
      ],
    );
  }

  Widget CreateDialog3(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      title: const Text(' طلب تفويض',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold)),
      content: Text(
          'هل انت متأكد انك تريد تفويض' +
              " " +
              DelegatortName.text +
              " " +
              " لطالب " +
              " " +
              StName,
          textAlign: TextAlign.center,
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Req.AddRequest(DelegatortName.text, Delegatorsername.text, false,
                  "false", SID);
              Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => Delegatordisplay()));
              //parentx.DeleteParent(CurrentID);
            },
            child: const Text("موافق",
                style: TextStyle(
                    color: Color.fromARGB(255, 197, 24, 24),
                    fontWeight: FontWeight.bold))),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('إلغاء'),
        ),
      ],
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
      content: Text('تم تعيين مفوض لهذا الطالب مسبقًا الرجا ',
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

  Widget share1(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      title: Text("هل انت متأكد من رغبتك في مشاركه هذه المعلومات ؟",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: Color.fromRGBO(31, 31, 31, 1))),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          new Text(widget.username + " :اسم المستخدم"),
          Text("الرقم السري: " + k.toString())
        ],
      ),
      actions: <Widget>[
        TextButton(
            onPressed: () async {
              await Share.share(
                  " \nمرحبًا، هذه معلومات حساب ولي الأمر الرجاء عدم مشاركتها مع اي شخص، ويجب تغييرها فور تسجيل الدخول" +
                      "\nاسم المستخدم:" +
                      widget.username +
                      "\nالرقم السري:" +
                      k.toString());

              Future.delayed(const Duration(milliseconds: 1500)).then((value) {
                Navigator.of(context).push(CupertinoPageRoute(
                  builder: (context) => Nav(
                    TabValue: 10,
                    documentId: "",
                  ),
                ));
              });
            },
            child: const Text("نعم",
                style: TextStyle(
                    color: const Color(0xff57d77a),
                    fontWeight: FontWeight.bold))),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("لا"),
        ),
      ],
    );
  }
}
