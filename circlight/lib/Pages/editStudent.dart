import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:convert';

import 'package:circlight/Pages/Parent.dart';
import 'package:circlight/Pages/AdminHome.dart';
import 'package:circlight/Pages/DashBoard.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:circlight/Pages/Search.dart';
import 'package:circlight/Pages/Requests.dart';

import 'package:circlight/Pages/announcement.dart';
import 'Nav.dart';
import 'Student.dart';
import 'displayParent.dart';

import 'header_widget.dart';

class EditStudent extends StatefulWidget {
  var isChanged = "";
  var whichpag = 0;
  var Index = 1;
  var TheValue = "";
  bool Confirm;
  String documentId;

  EditStudent(
      {Key? key,
      required this.documentId,
      required this.whichpag,
      // ignore: non_constant_identifier_names
      required this.Index,
      required this.TheValue,
      required this.Confirm})
      : super(key: key);

  @override
  State<EditStudent> createState() => _EditStudentState();
  getData(change) {
    isChanged = change;
    print("in getData");
    print(isChanged);
  }
}

class _EditStudentState extends State<EditStudent>
    with TickerProviderStateMixin {
  var IsSave;
  double _headerHeight = 250;
  int _changedNumber = 0, _selectedNumber = 1;
  late String value = "O+";
  var Oldval;

  int InCount = 0;
  int C = 0;
  late String DBvalue = "";
  final Blood = ["O+", "A+", "B+", "AB+", "O-", "A-", "B-", "AB-"];
  String OldValue = "";

  String isDiscard = "false";
  final formKey = GlobalKey<FormState>();
  Student Studentx = new Student(
    Name: "",
    StudentID: "",
    Class: "",
    SNationalID: "",
    SNationality: "",
    SUserName: "",
    SBloodType: "",
  );
  bool RelativeCh = false;

  late int Inx;
  CollectionReference Students =
      FirebaseFirestore.instance.collection("Student");
  final ParentRef = FirebaseFirestore.instance;
  List<String> docIDs = [];
  TextEditingController StudentName = TextEditingController();
  TextEditingController StudID = TextEditingController();
  TextEditingController SClass = TextEditingController();
  TextEditingController STNationalID = TextEditingController();
  TextEditingController STNationality = TextEditingController();
  TextEditingController STUserName = TextEditingController();
  TextEditingController BloodType = TextEditingController();
  bool isEmailCorrect = false;
  bool isDone = false;

  String Field = "None";
  String UpdatedValue = "";
  int Index = 2;
  late bool save;
  late TextEditingController controller;

  late FixedExtentScrollController scrollController;
  String Title = "";
  late AnimationController _ColorAnimationController;
  late AnimationController _TextAnimationController;
  late Animation _colorTween, _iconColorTween, _icon2ColorTween;
  late Animation<Offset> _transTween;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

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
    controller = TextEditingController(text: Blood[Index]);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    scrollController.dispose();
    controller.dispose();

    StudentName.dispose();
    StudID.dispose();
    SClass.dispose();
    STNationalID.dispose();
    STNationality.dispose();
    STUserName.dispose();
    BloodType.dispose();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Oldval = new List.filled(10, null, growable: false);
    String val = value;
    // ignore: deprecated_member_use
    IsSave = List<int>.filled(5, 0);
    print("fffffffffffffffff");

    bool isSaved = widget.Confirm;
    int whichpagee = widget.whichpag;
    String TheValuee = widget.TheValue;
    int WIndex = widget.Index;
    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    String change = widget.isChanged;
    var size = MediaQuery.of(context).size;

    int Tab = 0;
    final List<Widget> Screens = [
      Search(),
      AdminHome(),
      Requests(),
      DashBoard(),
      Announcement(),
    ];

    Widget currentScreen = Announcement();

    // initState();
    // dispose();
    return FutureBuilder<DocumentSnapshot>(
        future: Students.doc(widget.documentId).get(),
        builder: ((context, snapshot) {
          try {
            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;
              final String jsonString = jsonEncode(data);
              Studentx.Name = data["Name"];
              Studentx.StudentID = data["StudentID"];
              Studentx.SUserName = data["UserName"];
              Studentx.Class = data["Class"];
              Studentx.SNationalID = data["NationalID"];
              Studentx.SNationality = data["Nationality"];

              Studentx.SBloodType = data["BloodType"];
              //  Oldval[InCount] = value;
              // InCount += 1;
            }
          } catch (e) {
            // print("xxxxxxxxxxxxxxxxxxxxxxxx");
          }
          if (whichpagee == 1) {
            return GetEditField(WIndex, TheValuee, height);
          } else {
            return GetMainPage(height, isSaved);
          }
        }
            // return Center(child: CircularProgressIndicator());
            ));
  }

  GetEditField(WIndex, value, height) {
    save = false;
    print("kkkkkkkkkkkkkkkkk");
    print(save);
    switch (WIndex) {
      case 1:
        Title = " أسم الطالب";
        break;
      case 2:
        Title = "اسم المستخدم";
        break;
      case 3:
        Title = "الرقم التعريفي";
        break;
      case 4:
        Title = "صف الطالب";
        break;
      case 5:
        Title = " رقم الهوية/الإقامة";
        break;
      case 6:
        Title = "الجنسية";
        break;
      case 7:
        Title = " فصيلة دم الطالب";
        break;
    }
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () async {
              if (save == false) {
                Navigator.pop(context);
              }
              if (save == true) {
                showCupertinoDialog(context: context, builder: CreateDialog3);
              }
              print(value);
              await Studentx.UpdateStudent(
                  widget.documentId,
                  StudentName.text,
                  StudID.text,
                  STUserName.text,
                  STNationalID.text,
                  STNationality.text,
                  SClass.text,
                  BloodType.text);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 16,
              color: Colors.grey,
            ),
            color: Colors.grey,
          ),
          title: Align(
            alignment: Alignment.topCenter,
            child: Container(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                Title,
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.black38),
              ),
            ),
          ),
          actions: [
            Container(
              padding: const EdgeInsets.only(right: 5),
              child: CupertinoButton(
                child: Text(
                  "حفظ",
                  style: TextStyle(color: const Color(0xff42c98d)),
                ),
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    //t(DocId, Field, Name)
                    if (save == false) {
                      Navigator.pop(context);
                    }

                    switch (Field) {
                      case "Name":
                        UpdatedValue = StudentName.text;
                        break;
                      case "UserName":
                        UpdatedValue = STUserName.text;
                        break;
                      case "Class":
                        UpdatedValue = SClass.text;
                        break;
                      case "BloodType":
                        UpdatedValue = BloodType.text;
                        break;
                      case "StudentID":
                        UpdatedValue = StudID.text;
                        break;
                      case "NationalID":
                        UpdatedValue = STNationalID.text;
                        break;
                      case "Nationality":
                        UpdatedValue = STNationality.text;
                        break;
                    }

                    if (save == true) {
                      /* Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => editparent5(
                                documentId: widget.documentId,
                                Confirm: save,
                                Index: 1,
                                TheValue: "",
                                whichpag: 0,
                              )));*/
                      ScaffoldMessenger.of(context)
                          .showSnackBar(snackBar); // snack
                      Future.delayed(const Duration(milliseconds: 1500))
                          .then((value) {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => EditStudent(
                                      documentId: widget.documentId,
                                      Confirm: save,
                                      Index: 1,
                                      TheValue: "",
                                      whichpag: 0,
                                    )));
                      });
                    }
                    await Studentx.UpdateStudent(
                        widget.documentId,
                        StudentName.text,
                        StudID.text,
                        STUserName.text,
                        STNationalID.text,
                        STNationality.text,
                        SClass.text,
                        BloodType.text);

                    /* Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => editparent5(
                              documentId: widget.documentId,
                            )));*/

                    // //

                    //
                  }
                },
              ),
            ),
          ],
          backgroundColor: Color(0xFFffffff),
        ),
        key: _scaffoldKey,
        backgroundColor: Color(0xFFffffff),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: ListView(children: [
                FutureBuilder(
                  builder: ((context, snapshot) {
                    return Container(
                      padding: const EdgeInsets.only(left: 40, right: 40),
                      child: Form(
                        key: formKey, //key for form
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: height * 0.05,
                            ),
                            GetWidget(WIndex),
                            SizedBox(
                              height: height * 0.05,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ])),
            ],
          ),
        ));
  }

  Widget GetWidget(In) {
    Widget Fields = Text("");

    switch (In) {
      case 1:
        Field = "Name";
        OldValue = Studentx.Name;

        Fields = Directionality(
          textDirection: TextDirection.rtl,
          child: TextFormField(
            controller: StudentName..text = Studentx.Name,
            //to take text from user input
            textAlign: TextAlign.right,
            style: const TextStyle(color: const Color(0xff0da6c2)),
            showCursor: true,
            decoration: InputDecoration(
              hintText: "أدخل أسم الطالب",
              labelText: " أسم الطالب",
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 15),
              labelStyle: const TextStyle(
                  color: const Color(0xff0da6c2),
                  fontSize: 16,
                  fontWeight: FontWeight.w300),
              prefixIcon: const Icon(
                Icons.email_outlined,
                color: const Color(0xff0da6c2),
              ),
              enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: const Color(0xff0da6c2), width: 1),
                  borderRadius: BorderRadius.circular(10)),
              floatingLabelStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w300),
              focusedBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: const Color(0xff0da6c2), width: 2),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            validator: (value) {
              if (OldValue != StudentName.text) {
                save = true;
                print("isSaved is trueeeeeeeeeee");
              }

              if (value!.isEmpty)
                return "أرجو منك تعبئه الحقل الفارغ ";
              else {
                return null;
              }
            },
          ),
        );
        break;
      case 2:
        Field = "UserName";
        OldValue = Studentx.SUserName;
        Fields = Directionality(
          textDirection: TextDirection.rtl,
          child: TextFormField(
            controller: STUserName..text = Studentx.SUserName,
            //to take text from user input
            textAlign: TextAlign.right,

            style: const TextStyle(color: const Color(0xff0da6c2)),
            showCursor: true,
            cursorColor: const Color(0xff0da6c2),

            decoration: InputDecoration(
              hintText: " أدخل اسم المستخدم",
              labelText: "اسم المستخدم",
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 15),
              labelStyle: const TextStyle(
                  color: const Color(0xff0da6c2),
                  fontSize: 16,
                  fontWeight: FontWeight.w300),
              prefixIcon: const Icon(
                Icons.email_outlined,
                color: const Color(0xff0da6c2),
              ),
              enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: const Color(0xff0da6c2), width: 1),
                  borderRadius: BorderRadius.circular(10)),
              floatingLabelStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w300),
              focusedBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: const Color(0xff0da6c2), width: 2),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            validator: (value) {
              if (OldValue != STUserName.text) {
                save = true;
              }

              if (value!.isEmpty)
                return "أرجو منك تعبئه الحقل الفارغ ";
              else {
                return null;
              }
            },
          ),
        );
        break;
      case 3:
        Field = "StudentID";
        OldValue = Studentx.StudentID;
        Fields = Directionality(
          textDirection: TextDirection.rtl,
          child: TextFormField(
            controller: StudID..text = Studentx.StudentID,
            textAlign: TextAlign.right,
            style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xffA7A7A7)),
            showCursor: true,
            cursorColor: const Color(0xff57d77a),
            decoration: InputDecoration(
              hintText: "أدخل الرقم التعريفي للطالب",
              labelText: "الرقم التعريفي",
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 15),
              labelStyle: const TextStyle(
                  color: const Color(0xff0da6c2),
                  fontSize: 16,
                  fontWeight: FontWeight.w300),
              prefixIcon: const Icon(
                Icons.email_outlined,
                color: const Color(0xff0da6c2),
              ),
              enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: const Color(0xff0da6c2), width: 1),
                  borderRadius: BorderRadius.circular(10)),
              floatingLabelStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w300),
              focusedBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: const Color(0xff0da6c2), width: 2),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            validator: (value) {
              // save = true;
              if (OldValue != StudID.text) {
                save = true;
              }
              if (value!.isEmpty || !RegExp(r'^[0-9]{10}$').hasMatch(value!))
                return "أرجو منك تعبئه الحقل بطريقه صحيحه حيث يتكون من 10 ارقام";
              else {
                return null;
              }
            },
          ),
        );
        break;
      case 4:
        Field = "Class";
        OldValue = Studentx.Class;
        Fields = Directionality(
          textDirection: TextDirection.rtl,
          child: TextFormField(
            controller: SClass..text = Studentx.Class,
            //to take text from user input
            textAlign: TextAlign.right,

            style: const TextStyle(color: const Color(0xff0da6c2)),
            showCursor: true,
            cursorColor: const Color(0xff0da6c2),

            maxLength: 10,
            decoration: InputDecoration(
              hintText: "أدخل رقم صف الطالب",
              labelText: "صف الطالب",
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 15),
              labelStyle: const TextStyle(
                  color: const Color(0xff0da6c2),
                  fontSize: 16,
                  fontWeight: FontWeight.w300),
              prefixIcon: const Icon(
                Icons.email_outlined,
                color: const Color(0xff0da6c2),
              ),
              enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: const Color(0xff0da6c2), width: 1),
                  borderRadius: BorderRadius.circular(10)),
              floatingLabelStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w300),
              focusedBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: const Color(0xff0da6c2), width: 2),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            validator: (value) {
              if (OldValue != SClass.text) {
                save = true;
              }

              if (value!.isEmpty || !RegExp(r'^[0-9]{1}$').hasMatch(value!))
                return "الصف يجب أن يكون رقم واحد فقط";
              else {
                return null;
              }
            },
          ),
        );
        break;
      case 5:
        Field = "NationalID";
        OldValue = Studentx.SNationalID;
        Fields = Directionality(
          textDirection: TextDirection.rtl,
          child: TextFormField(
            controller: STNationalID..text = Studentx.SNationalID,
            //to take text from user input
            textAlign: TextAlign.right,

            style: const TextStyle(color: const Color(0xff0da6c2)),
            showCursor: true,
            cursorColor: const Color(0xff0da6c2),

            decoration: InputDecoration(
              hintText: "أدخل رقم الهوية/الإقامة",
              labelText: " رقم الهوية/الإقامة",
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 15),
              labelStyle: const TextStyle(
                  color: const Color(0xff0da6c2),
                  fontSize: 16,
                  fontWeight: FontWeight.w300),
              prefixIcon: const Icon(
                Icons.email_outlined,
                color: const Color(0xff0da6c2),
              ),
              enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: const Color(0xff0da6c2), width: 1),
                  borderRadius: BorderRadius.circular(10)),
              floatingLabelStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w300),
              focusedBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: const Color(0xff0da6c2), width: 2),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            validator: (value) {
              if (OldValue != STNationalID.text) {
                save = true;
              }

              if (value!.isEmpty || !RegExp(r'^[0-9]{10}$').hasMatch(value!))
                return "أرجو منك تعبئه الحقل بطريقه صحيحه حيث يتكون من 10 ارقام";
              else {
                return null;
              }
            },
          ),
        );
        break;
      case 6:
        Field = "JobTitle";
        OldValue = Studentx.SNationality;
        Fields = Directionality(
          textDirection: TextDirection.rtl,
          child: TextFormField(
            controller: STNationality..text = Studentx.SNationality,
            //to take text from user input
            textAlign: TextAlign.right,

            style: const TextStyle(color: const Color(0xff0da6c2)),
            showCursor: true,
            cursorColor: const Color(0xff0da6c2),

            decoration: InputDecoration(
              hintText: "ماهي جنسيتك؟",
              labelText: "الجنسية",
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 15),
              labelStyle: const TextStyle(
                  color: const Color(0xff0da6c2),
                  fontSize: 16,
                  fontWeight: FontWeight.w300),
              prefixIcon: const Icon(
                Icons.email_outlined,
                color: const Color(0xff0da6c2),
              ),
              enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: const Color(0xff0da6c2), width: 1),
                  borderRadius: BorderRadius.circular(10)),
              floatingLabelStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w300),
              focusedBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: const Color(0xff0da6c2), width: 2),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            validator: (value) {
              if (OldValue != STNationality.text) {
                save = true;
              }

              if (value!.isEmpty)
                return "أرجو منك تعبئه الحقل الفارغ ";
              else {
                return null;
              }
            },
          ),
        );
        break;

      case 7:
        Field = "PhoneNumber";
        OldValue = Studentx.SBloodType;
        Fields = Directionality(
          textDirection: TextDirection.rtl,
          child: TextFormField(
            controller: BloodType..text = Studentx.SBloodType,
            //to take text from user input
            textAlign: TextAlign.right,

            style: const TextStyle(color: const Color(0xff0da6c2)),
            showCursor: true,
            cursorColor: const Color(0xff0da6c2),

            maxLength: 10,
            decoration: InputDecoration(
              hintText: "أدخل رقم الجوال",
              labelText: " رقم الجوال",
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 15),
              labelStyle: const TextStyle(
                  color: const Color(0xff0da6c2),
                  fontSize: 16,
                  fontWeight: FontWeight.w300),
              prefixIcon: const Icon(
                Icons.email_outlined,
                color: const Color(0xff0da6c2),
              ),
              enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: const Color(0xff0da6c2), width: 1),
                  borderRadius: BorderRadius.circular(10)),
              floatingLabelStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w300),
              focusedBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: const Color(0xff0da6c2), width: 2),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            validator: (value) {
              if (OldValue != BloodType.text) {
                save = true;
              }

              if (value!.isEmpty)
                return "أرجو منك تعبئه الحقل الفارغ ";
              else {
                var Blood = ["O+", "A+", "B+", "AB+", "O-", "A-", "B-", "AB-"];
                var hasFound = false;
                for (var i = 0; i < Blood.length; i++) {
                  if (Blood[i] == value) {
                    hasFound = true;
                    break;
                  }
                }
                if (!hasFound) {
                  return "أرجو منك تعبئة فصيلة الدم بشكل صحيح   ";
                } else {
                  return null;
                }
              }
            },
          ),
        );
        break;
    }
    return Fields;
  }

  GetMainPage(height, isSaved) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        key: _scaffoldKey,
        // appBar: AppBar(title: Text("Faten")),

        backgroundColor: Color(0xFFffffff),
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
                                        color:
                                            Color(0xff57d77a).withOpacity(0.2),
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
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 32,
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
                                        child: Positioned(
                                          left: 0.0,
                                          child: Icon(
                                            Icons.arrow_back_ios_outlined,
                                            color: Color(0xffA7A7A7),
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
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xffA7A7A7)),
                                            Studentx.Name,
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
                                                color: Color(0xffA7A7A7)),
                                            " أسم الطالب",
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
                                          width: 1.0, color: Color(0xffA7A7A7)),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => EditStudent(
                                      Index: 1,
                                      documentId: widget.documentId,
                                      TheValue: StudentName.text,
                                      whichpag: 1,
                                      Confirm: false,
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
                                        child: Positioned(
                                          left: 0.0,
                                          child: Icon(
                                            Icons.arrow_back_ios_outlined,
                                            color: Color(0xffA7A7A7),
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
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xffA7A7A7)),
                                            Studentx.SUserName,
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
                                                color: Color(0xffA7A7A7)),
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
                                          width: 1.0, color: Color(0xffA7A7A7)),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => EditStudent(
                                      Index: 2,
                                      documentId: widget.documentId,
                                      TheValue: STUserName.text,
                                      whichpag: 1,
                                      Confirm: false,
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
                                        child: Positioned(
                                          left: 0.0,
                                          child: Icon(
                                            Icons.arrow_back_ios_outlined,
                                            color: Color(0xffA7A7A7),
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
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xffA7A7A7)),
                                            Studentx.StudentID,
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
                                                color: Color(0xffA7A7A7)),
                                            "الرقم التعريفي",
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
                                          width: 1.0, color: Color(0xffA7A7A7)),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => EditStudent(
                                      Index: 3,
                                      documentId: widget.documentId,
                                      TheValue: StudID.text,
                                      whichpag: 1,
                                      Confirm: false,
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
                                        child: Positioned(
                                          left: 0.0,
                                          child: Icon(
                                            Icons.arrow_back_ios_outlined,
                                            color: Color(0xffA7A7A7),
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
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xffA7A7A7)),
                                            Studentx.Class,
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
                                                color: Color(0xffA7A7A7)),
                                            "صف الطالب",
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
                                          width: 1.0, color: Color(0xffA7A7A7)),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => EditStudent(
                                      Index: 4,
                                      documentId: widget.documentId,
                                      TheValue: SClass.text,
                                      whichpag: 1,
                                      Confirm: false,
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
                                        child: Positioned(
                                          left: 0.0,
                                          child: Icon(
                                            Icons.arrow_back_ios_outlined,
                                            color: Color(0xffA7A7A7),
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
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xffA7A7A7)),
                                            Studentx.SNationalID,
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
                                                color: Color(0xffA7A7A7)),
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
                                          width: 1.0, color: Color(0xffA7A7A7)),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => EditStudent(
                                      Index: 5,
                                      documentId: widget.documentId,
                                      TheValue: STNationalID.text,
                                      whichpag: 1,
                                      Confirm: false,
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
                                        child: Positioned(
                                          left: 0.0,
                                          child: Icon(
                                            Icons.arrow_back_ios_outlined,
                                            color: Color(0xffA7A7A7),
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
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xffA7A7A7)),
                                            Studentx.SNationality,
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
                                                color: Color(0xffA7A7A7)),
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
                                          width: 1.0, color: Color(0xffA7A7A7)),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => EditStudent(
                                      Index: 6,
                                      documentId: widget.documentId,
                                      TheValue: STNationality.text,
                                      whichpag: 1,
                                      Confirm: false,
                                    ),
                                  ));
                                },
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                            ]),
                          ),
                        ),
                        Center(
                          child: new Wrap(
                              spacing: 5.0,
                              runSpacing: 5.0,
                              direction:
                                  Axis.vertical, // main axis (rows or columns)
                              children: <Widget>[
                                CupertinoButton(
                                    child: Expanded(
                                      child: Container(
                                        // padding:
                                        //   EdgeInsets.symmetric(horizontal: 120),
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                                width: 1.0,
                                                color: Color(0xffA7A7A7)),
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
                                                      padding: EdgeInsets.only(
                                                          bottom: 10),
                                                      child: Positioned(
                                                        left: 0,
                                                        child: Icon(
                                                          Icons
                                                              .arrow_downward_outlined,
                                                          color:
                                                              Color(0xffA7A7A7),
                                                          size: 16,
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        padding:
                                                            EdgeInsets.only(
                                                                right: 120,
                                                                bottom: 10),
                                                        child: Text(
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: Color(
                                                                      0xffA7A7A7)),
                                                          value,
                                                          maxLines: 2,
                                                          // textAlign: TextAlign.left,
                                                        ),
                                                      ),
                                                    ),
                                                    Column(
                                                      children: <Widget>[
                                                        Container(
                                                          alignment: Alignment
                                                              .centerRight,
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 120,
                                                                  bottom: 10),
                                                          child: Text(
                                                            style: GoogleFonts.poppins(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: Color(
                                                                    0xffA7A7A7)),
                                                            'صلة القرابة',
                                                            maxLines: 2,
                                                            textAlign:
                                                                TextAlign.right,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Container(
                                              height: 200.0,
                                              color: Colors.white,
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  CupertinoButton(
                                                    child: Text("Cancel"),
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                  Expanded(
                                                    child: CupertinoPicker(
                                                      scrollController:
                                                          scrollController,
                                                      looping: false,
                                                      itemExtent: 64,
                                                      backgroundColor:
                                                          Colors.white,
                                                      onSelectedItemChanged:
                                                          (index) {
                                                        print(index);

                                                        print(
                                                            "lllllllllllllllllllllllllllllllll");
                                                        Index = index;
                                                        print(Index);
                                                        final item =
                                                            Blood[Index];
                                                        Index = index;
                                                        controller.text = item;
                                                        value = item;
                                                      },
                                                      children: Blood.map(
                                                          (item) => Center(
                                                                  child: Text(
                                                                item,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        20),
                                                              ))).toList(),
                                                    ),
                                                  ),
                                                  CupertinoButton(
                                                    child: Text("Ok"),
                                                    onPressed: () async {
                                                      scrollController =
                                                          FixedExtentScrollController(
                                                              initialItem:
                                                                  _changedNumber);
                                                      //scrollController.dispose();
                                                      setState(() {
                                                        _selectedNumber =
                                                            _changedNumber;
                                                      });

                                                      await Studentx
                                                          .UpdateStudent(
                                                              widget.documentId,
                                                              StudentName.text,
                                                              StudID.text,
                                                              STUserName.text,
                                                              STNationalID.text,
                                                              STNationality
                                                                  .text,
                                                              SClass.text,
                                                              BloodType.text);

                                                      Navigator.pop(context);
                                                      IsSave[5] = 1;
                                                      print(IsSave[5]);
                                                    },
                                                  ),
                                                ],
                                              ),
                                            );
                                          });
                                    }),
                              ]),
                        ),
                        SizedBox(
                          height: 32.0,
                        ),
                        const SizedBox(
                          height: 50,
                        ),

                        /* DropdownButtonFormField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              value: value,
              onChanged: (value) => setState(() => this.value = value),
              items: Relation.map(BuildMenuItem).toList()),*/
                      ],
                    ),
                  ),
                  Container(
                    height: 55,
                    child: AnimatedBuilder(
                      animation: _ColorAnimationController,
                      builder: (context, child) => AppBar(
                        leading: IconButton(
                          onPressed: () async {
                            if (isSaved == true) {
                              showCupertinoDialog(
                                  context: context, builder: CreateDialog);
                            }
                            if (isSaved != true) {
                              Navigator.pop(context);
                              await Studentx.UpdateStudent(
                                  widget.documentId,
                                  StudentName.text,
                                  StudID.text,
                                  STUserName.text,
                                  STNationalID.text,
                                  STNationality.text,
                                  SClass.text,
                                  BloodType.text);
                            }
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new,
                            size: 16,
                            color: _iconColorTween.value,
                          ),
                          color: _iconColorTween.value,
                        ),
                        backgroundColor: _colorTween.value,
                        elevation: 0,
                        titleSpacing: 0.0,
                        title: Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              "تحديث معلومات الطالب",
                              textAlign: TextAlign.start,
                              style: TextStyle(color: _iconColorTween.value),
                            ),
                          ),
                        ),
                        iconTheme: IconThemeData(
                          color: _iconColorTween.value,
                        ),
                        actions: <Widget>[
                          Container(
                            padding: const EdgeInsets.only(right: 5),
                            child: CupertinoButton(
                              child: Text(
                                "حفظ",
                                style: TextStyle(
                                    color: _icon2ColorTween.value,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () async {
                                if (isSaved != true) {
                                  Navigator.pop(context);
                                }
                                print(isSaved);
                                if (isSaved == true) {
                                  showCupertinoDialog(
                                      context: context, builder: CreateDialog2);
                                }
                                await Studentx.UpdateStudent(
                                    widget.documentId,
                                    StudentName.text,
                                    StudID.text,
                                    STUserName.text,
                                    STNationalID.text,
                                    STNationality.text,
                                    SClass.text,
                                    BloodType.text);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]))));
  }

  Widget buildPicker() => Column(children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 10),
                child: Positioned(
                  left: 0.0,
                  child: Icon(
                    Icons.arrow_back_ios_outlined,
                    color: Color(0xffA7A7A7),
                    size: 16,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 10, bottom: 10),
                  child: Text(
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffA7A7A7)),
                    'فاتن',
                    maxLines: 2,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(right: 10, bottom: 10),
                  child: Text(
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffA7A7A7)),
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
              bottom: BorderSide(width: 1.0, color: Color(0xffA7A7A7)),
            ),
          ),
        ),

        /* greenButton('حفظ', () {
                  if (!formKey.currentState!.validate()) {
                    return;
                  }
                }),*/
      ]);

  WhichColor() {
    if (isEmailCorrect == false) {
      return Colors.grey.shade200;
    } else {
      return Colors.green;
    }
  }

  Widget IsCorrect() {
    if (isEmailCorrect == false) {
      return Text("");
    } else {
      return const Icon(
        Icons.done,
        color: Colors.green,
      );
    }
  }

  Widget CreateDialog(BuildContext context) {
    String Msg = "تجاهل التغييرات";

    return CupertinoAlertDialog(
      title: Text("تجاهل التغييرات"),
      content: Text("إذا عدت الآن، فستفقد التغييرات"),
      actions: [
        CupertinoDialogAction(
            onPressed: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => const Paretdisplay()));
            },
            child: Text("تجاهل التغييرات")),
        CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("الاستمرار في التحرير")),
      ],
    );
  }

  Widget CreateDialog3(BuildContext context) {
    String Msg = "تجاهل التغييرات";

    return CupertinoAlertDialog(
      title: Text("تجاهل التغييرات"),
      content: Text("إذا عدت الآن، فستفقد التغييرات"),
      actions: [
        CupertinoDialogAction(
            onPressed: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => EditStudent(
                            documentId: widget.documentId,
                            Index: 1,
                            Confirm: false,
                            TheValue: "",
                            whichpag: 0,
                          )));
            },
            child: Text("تجاهل التغييرات")),
        CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("الاستمرار في التحرير")),
      ],
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

  dynamic snackBar = SnackBar(
    duration: const Duration(milliseconds: 1500),
    content: Row(mainAxisAlignment: MainAxisAlignment.end, children: const [
      Text(
        "تم تحديث المعلومات",
        textAlign: TextAlign.right,
        style: TextStyle(
          color: Color(0xffA7A7A7),
        ),
      ),
      Icon(
        FontAwesomeIcons.check,
        size: 16,
        color: Color(0xffA7A7A7),
      ),
    ]),
  );

  Widget CreateDialog2(BuildContext context) {
    String Msg = "تحديث معلومات الطالب";

    return CupertinoAlertDialog(
      title: Text(Msg),
      content: Text("تم تحديث المعلومات بنجاح"),
      actions: [
        CupertinoDialogAction(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Paretdisplay()));
            },
            child: Text("موافق")),
      ],
    );
  }
  /*Widget greenButton(String title, Function onPressed) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xff348379),
            const Color(0xff305565),
            const Color(0xff2d2e53)
          ],
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: MaterialButton(
        minWidth: Get.width,
        height: 50,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        onPressed: () => onPressed(),
        child: Text(
          title,
          style: GoogleFonts.poppins(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }*/
/*
  TextFieldWidget(String title, IconData iconData,
      TextEditingController controller, Function validator,
      {Function? onTap, bool readOnly = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xffA7A7A7)),
        ),
        const SizedBox(
          height: 6,
        ),
        Container(
          width: Get.width,
          // height: 50,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    spreadRadius: 1,
                    blurRadius: 1)
              ],
              borderRadius: BorderRadius.circular(8)),
          child: TextFormField(
            readOnly: readOnly,
            onTap: () => onTap!(),
            validator: (input) => validator(input),
            controller: controller,
            style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xffA7A7A7)),
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Icon(
                  iconData,
                  color: const Color(0xff29294d),
                  size: 18,
                ),
              ),
              border: InputBorder.none,
            ),
          ),
        )
      ],
    );
  }*/

  DropdownMenuItem<String> BuildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
        ),
      );
  /* Widget getWidget() {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets\images\mask.png'), fit: BoxFit.fill),
      ),
      height: Get.height * 0.3,
      child: Container(
        height: Get.height * 0.1,
        width: Get.width,
        margin: EdgeInsets.only(bottom: Get.height * 0.05),
        child: Center(child: Text("Edit")),
      ),
    );
  }*/
}

class CheckUpdated {
  isUdated() {}
}
