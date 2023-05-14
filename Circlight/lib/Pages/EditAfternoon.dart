import 'dart:math';
import 'package:circlight/Pages/Nav_Afternoon.dart';

import 'package:circlight/Pages/AfternoonShift.dart';
import 'package:circlight/Pages/DelegatorHome.dart';
import 'package:circlight/Pages/NavDelegator.dart';
import 'package:circlight/Pages/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:circlight/Pages/Delegator.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../flutter_flow/flutter_flow_theme.dart';

import '../flutter_flow/flutter_flow_widgets.dart';
import 'Screens/welcome_screen.dart';
import 'base_screen.dart';

import 'header_widget.dart';
import 'viewprofileDelegator.dart';

// this is the edit for parent
class EditAfternoon extends StatefulWidget {
  var isChanged = "";
  var isDropDown = false;
  var whichpag = 0;
  var Index = 1;
  var TheValue = "";

  bool Confirm;
  bool DropDown;
  String documentId;

  EditAfternoon({
    Key? key,
    required this.documentId,
    required this.whichpag,
    // ignore: non_constant_identifier_names
    required this.Index,
    required this.TheValue,
    required this.Confirm,
    required this.DropDown,
  }) : super(key: key);

  @override
  State<EditAfternoon> createState() => _EditAfternoon();
  getData(change) {
    isChanged = change;
  }
}

class _EditAfternoon extends State<EditAfternoon>
    with TickerProviderStateMixin {
  int t = 0;
  bool isFieldChange = false;
  late bool isDrop = widget.DropDown;
  bool isDropDown = false;
  var IsSave;
  double _headerHeight = 250;
  int _changedNumber = 0, _selectedNumber = 1;
  var DropValue;
  int C = 0;
  late String DBvalue = "";
  // this is the list for the relatives

  String OldValue = "";

  String isDiscard = "false";
  final formKey = GlobalKey<FormState>();
  Aftershift parenta = new Aftershift(
    Email: "",
    APassword: "",
    SchoolName: "",
    Username: "",
  );

  bool RelativeCh = false;
//for username uniqueness
  List<String> docEmails = [];

  List<String> docUserName = [];

  List<String> docAfternoon = [];
  bool check = true;

  get Name => Name;
  Future getEmail() async {
    await FirebaseFirestore.instance.collection("Afternoonshift").get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            // print(document["Email"]);

            docEmails.add(document["Email"]);
          }),
        );
  }

//for username uniqueness

  Future getUserName() async {
    await FirebaseFirestore.instance.collection("Afternoonshift").get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            docUserName.add(document["UserName"]);
          }),
        );
  }

  //get admin ID

  // Future getAdminID() async {
  //   await FirebaseFirestore.instance.collection("Admin").get().then(
  //         (snapshot) => snapshot.docs.forEach((document) {
  //           // print(document["Email"]);

  //           docAdmin.add(document.reference.id);
  //         }),
  //       );
  // }

  late String Dvalue;
  late int Inx;
  CollectionReference Parents =
      FirebaseFirestore.instance.collection("Afternoonshift");
  final DRef = FirebaseFirestore.instance;
  List<String> docIDs = [];
  final key = GlobalKey<FormState>();
  TextEditingController Username = TextEditingController();
  TextEditingController AAPassword = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController SchoolName = TextEditingController();

  bool isEmailCorrect = false;
  bool isDone = false;

  String Field = "None";
  String UpdatedValue = "";
  int DEIndex = 1;
  late bool save;
  late TextEditingController controller;

  late FixedExtentScrollController scrollController;
  String Title = "";
  int DropIndex = 0;
  late bool isSaved = widget.Confirm;
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
        ColorTween(begin: Colors.white, end: const Color(0xFF29294D))
            .animate(_ColorAnimationController);

    _TextAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 0));

    _transTween = Tween(begin: Offset(-10, 40), end: Offset(-10, 0))
        .animate(_TextAnimationController);
    scrollController = FixedExtentScrollController(initialItem: DEIndex);
    controller = TextEditingController(text: Field);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    scrollController.dispose();
    controller.dispose();
    Email.dispose();
    AAPassword.dispose();
    SchoolName.dispose();
    Username.dispose();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    getEmail();

    getUserName();

    //getAdminID();
    // ignore: deprecated_member_use
    IsSave = List<int>.filled(5, 0);

    int whichpagee = widget.whichpag;
    String TheValuee = widget.TheValue;
    int WIndex = widget.Index;
    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    String change = widget.isChanged;
    var size = MediaQuery.of(context).size;

    int Tab = 0;

    Widget currentScreen = BaseScreen();

    // initState();
    // dispose();
    return FutureBuilder<DocumentSnapshot>(
        future: Parents.doc(widget.documentId).get(),
        builder: ((context, snapshot) {
          try {
            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;
              final String jsonString = jsonEncode(data);
              parenta.Email = data["Email"];
              //parentx.Name = CurrentID;
              parenta.APassword = "**********";

              parenta.SchoolName = data["SchoolName"];
              print(data["SchoolName"]);
              parenta.Username = data["UserName"];
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
        Title = "البريد الالكتروني ";
        break;
      case 2:
        Title = "تغيير رمز الدخول ";
        break;
      case 3:
        Title = "اسم المدرسة";
        break;
      case 4:
        Title = "اسم المستخدم";
        break;
    }
    return Scaffold(
        backgroundColor: Color.fromRGBO(252, 253, 255, 1),
        appBar: AppBar(
          elevation: 3,
          automaticallyImplyLeading: false,
          title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 80,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      Title,
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.black38),
                    ),
                  ),
                ),
              ]),
          actions: [
            IconButton(
              onPressed: () {
                if (check == true) {
                  if (formKey.currentState!.validate()) {
                    if (save == false) {
                      Navigator.pop(context);
                    }
                    if (save == true) {
                      print(value);

                      showCupertinoDialog(
                          context: context, builder: CreateDialog3);
                    }
                  }
                }
              },
              icon: Icon(
                Icons.arrow_forward_ios_outlined,
                size: 16,
                color: Colors.grey,
              ),
              color: Colors.grey,
            ),
          ],
          backgroundColor: Color(0xFFffffff),
        ),
        key: _scaffoldKey,
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
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(22, 0, 22, 16),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    //t(DocId, Field, Name)
                                    if (save == false) {
                                      Navigator.pop(context);
                                    }

                                    switch (Field) {
                                      case "Email":
                                        await FirebaseAuth.instance.currentUser!
                                            .updateEmail(Email.text.toString());
                                        UpdatedValue = Email.text;
                                        break;
                                      case "Password":
                                        var randompass =
                                            Random().nextInt(10000) +
                                                10000000000000000;
                                        await FirebaseAuth.instance.currentUser!
                                            .updatePassword(
                                                AAPassword.text.toString());
                                        String stringValue =
                                            randompass.toString();
                                        var digest = sha1
                                            .convert(utf8.encode(stringValue))
                                            .toString();
                                        await FirebaseFirestore.instance
                                            .collection("Afternoonshift")
                                            .doc(FirebaseAuth
                                                .instance.currentUser!.uid
                                                .toString())
                                            .set(
                                                {"Password": digest.toString()},
                                                SetOptions(merge: true));
                                        UpdatedValue = digest.toString();
                                        break;
                                      case "SchoolName":
                                        UpdatedValue = SchoolName.text;
                                        break;
                                      case "UserName":
                                        UpdatedValue = Username.text;
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
                                      Future.delayed(const Duration(
                                              milliseconds: 1500))
                                          .then((value) {
                                        Navigator.push(
                                            context,
                                            CupertinoPageRoute(
                                                builder: (context) =>
                                                    Nav_Afternoon(
                                                      documentId:
                                                          widget.documentId,
                                                      Confirm: save,
                                                      index: 2,
                                                      TheValue: SchoolName.text,
                                                      whichpag: 0,
                                                      DropDown: isDrop,
                                                      TabValue: 2,
                                                    )));
                                      });
                                    }

                                    // print("lllllllllllllllllllllllllllll");
                                    // print(Field);
                                    await parenta.UpdateAftershift(
                                        widget.documentId, Field, UpdatedValue);

                                    /* Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => editparent5(
                              documentId: widget.documentId,
                            )));*/

                                    // //

                                    //
                                  }
                                },
                                text: " حفظ",
                                options: FFButtonOptions(
                                  width: 340,
                                  height: 50,
                                  color: const Color(0xFF11AAB8),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                          fontFamily: 'Outfit',
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 80,
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
        Field = "Email";
        OldValue = parenta.Email;
        Fields = Directionality(
          textDirection: TextDirection.rtl,
          child: TextFormField(
            controller: Email..text = parenta.Email,
            textAlign: TextAlign.right,
            style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xffA7A7A7)),
            showCursor: true,
            cursorColor: const Color(0xFF29294D),
            decoration: InputDecoration(
              labelText: "البريد الالكتروني ",
              hintText: "something@email.com",
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 12),
              labelStyle: const TextStyle(
                  color: const Color(0xFF29294D),
                  fontSize: 12,
                  fontWeight: FontWeight.w300),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Icon(
                  Icons.email,
                  size: 18,
                  color: const Color(0xFF29294D),
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: const Color(0xFF29294D), width: 1),
                  borderRadius: BorderRadius.circular(10)),
              floatingLabelStyle: const TextStyle(
                  color: const Color(0xFF29294D),
                  fontSize: 12,
                  fontWeight: FontWeight.w300),
              focusedBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: const Color(0xFF29294D), width: 2),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            validator: (value) {
              if (OldValue != Email.text) {
                save = true;
              }

              if (value!.isEmpty)
                return "أرجو منك تعبئه الحقل الفارغ ";
              else {
                for (var i = 0; i < docEmails.length; i++) {
                  if (value == docEmails[i]) {
                    if (OldValue == value) {
                      check = false;
                    }

                    if (check != false) {
                      return "البريد الإلكتروني مستخدم مسبقا ";
                    }
                  }
                }

                return null;
              }
            },
          ),
        );
        break;
      case 2:
        Field = "Password";
        OldValue = parenta.APassword;
        AAPassword.text = parenta.APassword;
        Fields = Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Form(
                key: key,
                child: TextFormField(
                  controller: AAPassword,
                  onChanged: (val) => key.currentState?.validate(),
                  //to take text from user input
                  textAlign: TextAlign.right,

                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      //fontWeight: FontWeight.w600,
                      color: Colors.grey),
                  showCursor: true,
                  cursorColor: const Color(0xFF29294D),

                  decoration: InputDecoration(
                    hintText: " أدخل رمز الدخول",
                    labelText: " رمز الدخول ",
                    hintStyle:
                        const TextStyle(color: Colors.grey, fontSize: 12),
                    labelStyle: const TextStyle(
                        color: const Color(0xFF29294D),
                        fontSize: 12,
                        fontWeight: FontWeight.w300),
                    prefixIcon: Padding(
                      padding:
                          const EdgeInsets.only(right: 12, top: 9, left: 9),
                      child: Container(
                        //  padding: const EdgeInsets.only(right: 5),

                        child: Column(children: [
                          Image.asset("assets/icons/padlock.png",
                              width: 20, height: 20, color: Color(0xFF29294D)),
                        ]),
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: const Color(0xFF29294D), width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    floatingLabelStyle: const TextStyle(
                        color: const Color(0xFF29294D),
                        fontSize: 12,
                        fontWeight: FontWeight.w300),
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: const Color(0xFF29294D), width: 2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  validator: (value) {
                    if (OldValue != AAPassword.text) {
                      save = true;
                    }

                    if (value!.isEmpty) {
                      return "أرجو منك تعبئه الحقل الفارغ ";
                    }
                    if (!RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                        .hasMatch(value!)) {
                      return "يجب عليك الالتزام بشروط الرقم السري التالية من فضلك:\n - حرف واحد كبيرة على الأقل\n - حرف واحد صغير على الاقل\n - رقم واحد على الاقل  \n  - حرف واحد خاص على الاقل (! @ # \$ & * ~) \n -يجب ان يتكون الرقم السري من 6 خانات";
                    } else
                      return null;
                  },
                ),
              ),
            ),
          ),
        );
        break;

      case 3:
        Field = "SchoolName";
        OldValue = parenta.SchoolName;
        Fields = Directionality(
          textDirection: TextDirection.rtl,
          child: TextFormField(
            controller: SchoolName..text = parenta.SchoolName,
            //to take text from user input
            textAlign: TextAlign.right,

            style: GoogleFonts.poppins(
                fontSize: 14,
                //fontWeight: FontWeight.w600,
                color: Colors.grey),
            showCursor: true,
            cursorColor: const Color(0xFF29294D),

            decoration: InputDecoration(
              hintText: " أدخل اسم المدرسة",
              labelText: "اسم المدرسة",
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 12),
              labelStyle: const TextStyle(
                  color: const Color(0xFF29294D),
                  fontSize: 12,
                  fontWeight: FontWeight.w300),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Icon(
                  Icons.person,
                  size: 22,
                  color: const Color(0xFF29294D),
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: const Color(0xFF29294D), width: 1),
                  borderRadius: BorderRadius.circular(10)),
              floatingLabelStyle: const TextStyle(
                  color: const Color(0xFF29294D),
                  fontSize: 12,
                  fontWeight: FontWeight.w300),
              focusedBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: const Color(0xFF29294D), width: 2),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            validator: (value) {
              if (OldValue != SchoolName.text) {
                save = true;
              }

              if (value!.isEmpty)
                return "أرجو منك تعبئه الحقل الفارغ ";
              else {
                for (var i = 0; i < docUserName.length; i++) {
                  if (value == docUserName[i]) {
                    if (OldValue == value) {
                      check = false;
                    }

                    if (check != false) {
                      return "اسم المستخدم مستخدم مسبقا ";
                    }
                  }
                }

                return null;
              }
            },
          ),
        );
        break;

      case 4:
        Field = "UserName";
        OldValue = parenta.Username;
        Fields = Directionality(
          textDirection: TextDirection.rtl,
          child: TextFormField(
            controller: Username..text = parenta.Username,
            //to take text from user input
            textAlign: TextAlign.right,

            style: GoogleFonts.poppins(
                fontSize: 14,
                //fontWeight: FontWeight.w600,
                color: Colors.grey),
            showCursor: true,
            cursorColor: const Color(0xFF29294D),

            decoration: InputDecoration(
              hintText: " أدخل اسم المستخدم",
              labelText: "اسم المستخدم",
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 12),
              labelStyle: const TextStyle(
                  color: const Color(0xFF29294D),
                  fontSize: 12,
                  fontWeight: FontWeight.w300),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Icon(
                  Icons.person,
                  size: 22,
                  color: const Color(0xFF29294D),
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: const Color(0xFF29294D), width: 1),
                  borderRadius: BorderRadius.circular(10)),
              floatingLabelStyle: const TextStyle(
                  color: const Color(0xFF29294D),
                  fontSize: 12,
                  fontWeight: FontWeight.w300),
              focusedBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: const Color(0xFF29294D), width: 2),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            validator: (value) {
              if (OldValue != Username.text) {
                save = true;
              }

              if (value!.isEmpty)
                return "أرجو منك تعبئه الحقل الفارغ ";
              else {
                for (var i = 0; i < docUserName.length; i++) {
                  if (value == docUserName[i]) {
                    if (OldValue == value) {
                      check = false;
                    }

                    if (check != false) {
                      return "اسم المستخدم مستخدم مسبقا ";
                    }
                  }
                }

                return null;
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
                      height: 210,
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/images/formbackground.png',
                            width: double.infinity,
                            height: 230,
                            fit: BoxFit.cover,
                          ),
                          Align(
                            alignment: AlignmentDirectional(-0.06, 0.74),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 12, 0, 0),
                              child: Text(
                                "تحديث معلومات مدير المدرسة",
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
                                        color: const Color(0xFF29294D),
                                        size: 16,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding:
                                          EdgeInsets.only(left: 2, bottom: 10),
                                      child: Text(
                                        style: GoogleFonts.poppins(
                                            fontSize: 13.5,
                                            fontWeight: FontWeight.w600,
                                            color: Color.fromARGB(
                                                255, 188, 187, 187)),
                                        parenta.Email,
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
                                        'البريد الالكتروني ',
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
                                builder: (context) => Nav_Afternoon(
                                  index: 1,
                                  documentId: widget.documentId,
                                  TheValue: AAPassword.text,
                                  whichpag: 1,
                                  Confirm: false,
                                  DropDown: isDrop,
                                  TabValue: 2,
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
                                        color: const Color(0xFF29294D),
                                        size: 16,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding:
                                          EdgeInsets.only(left: 2, bottom: 10),
                                      child: Text(
                                        style: GoogleFonts.poppins(
                                            fontSize: 13.5,
                                            fontWeight: FontWeight.w600,
                                            color: Color.fromARGB(
                                                255, 188, 187, 187)),
                                        parenta.APassword,
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          right: 20, bottom: 10),
                                      child: Text(
                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: const Color(0xFF29294D)),
                                        'تغيير رمز الدخول',
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
                                builder: (context) => Nav_Afternoon(
                                  index: 2,
                                  documentId: widget.documentId,
                                  TheValue: AAPassword.text,
                                  whichpag: 1,
                                  Confirm: false,
                                  DropDown: isDrop,
                                  TabValue: 2,
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
                                        color: const Color(0xFF29294D),
                                        size: 16,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding:
                                          EdgeInsets.only(left: 2, bottom: 10),
                                      child: Text(
                                        style: GoogleFonts.poppins(
                                            fontSize: 13.5,
                                            fontWeight: FontWeight.w600,
                                            color: Color.fromARGB(
                                                255, 188, 187, 187)),
                                        parenta.SchoolName,
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
                                        "اسم المدرسة ",
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
                                builder: (context) => Nav_Afternoon(
                                  index: 3,
                                  documentId: widget.documentId,
                                  TheValue: AAPassword.text,
                                  whichpag: 1,
                                  Confirm: false,
                                  DropDown: isDrop,
                                  TabValue: 2,
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
                                        color: const Color(0xFF29294D),
                                        size: 16,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding:
                                          EdgeInsets.only(left: 2, bottom: 10),
                                      child: Text(
                                        style: GoogleFonts.poppins(
                                            fontSize: 13.5,
                                            fontWeight: FontWeight.w600,
                                            color: Color.fromARGB(
                                                255, 188, 187, 187)),
                                        parenta.Username,
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
                                        "اسم المستخدم",
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
                                builder: (context) => Nav_Afternoon(
                                  index: 2,
                                  documentId: widget.documentId,
                                  TheValue: AAPassword.text,
                                  whichpag: 1,
                                  Confirm: false,
                                  DropDown: isDrop,
                                  TabValue: 2,
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
                    SizedBox(
                      height: 32.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(30, 20, 22, 16),
                          child: FFButtonWidget(
                            onPressed: () async {
                              isSaved = true;
                              if (isSaved == true || widget.isDropDown) {
                                showCupertinoDialog(
                                    context: context, builder: CreateDialog2);
                              }
                              // print(isSaved);
                              // if (isSaved == true || widget.isDropDown) {
                              //   showCupertinoDialog(
                              //       context: context, builder: CreateDialog2);
                              // }
                            },
                            text: " حفظ",
                            options: FFButtonOptions(
                              width: 340,
                              height: 50,
                              color: const Color(0xFF11AAB8),
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                      fontFamily: 'Outfit',
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(22, 0, 22, 16),
                      child: FFButtonWidget(
                        onPressed: () async {
                          showCupertinoDialog(
                              context: context, builder: CreateDialog8);
                        },
                        text: "تسجيل خروج",
                        options: FFButtonOptions(
                          width: 340,
                          height: 50,
                          color: Color.fromARGB(255, 199, 7, 7),
                          textStyle: FlutterFlowTheme.of(context)
                              .subtitle2
                              .override(
                                  fontFamily: 'Outfit',
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 80,
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
                          Container(
                            padding: const EdgeInsets.only(right: 5),
                          ),
                          SizedBox(
                            width: 55,
                          ),
                        ]),
                    actions: [
                      IconButton(
                        onPressed: () async {
                          if (widget.isDropDown != true) {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => const Nav_Afternoon(
                                          TabValue: 4,
                                        )));
                          }

                          print("hhhhhhhhhhhhhh");
                          if (widget.isDropDown == true) {
                            showCupertinoDialog(
                                context: context, builder: CreateDialog);
                          }
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
            ]),
          ),
        ));
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
                    'فيصل الشمري',
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
                    'اسم مدير المدرسة',
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

  Widget CreateDialog8(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      title: const Text("تسجيل خروج ",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color.fromRGBO(31, 31, 31, 1),
              fontWeight: FontWeight.bold)),
      content: const Text("هل أنت متأكد أنك تريد تسجيل الخروج؟",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color.fromRGBO(31, 31, 31, 1),
          )),
      actions: [
        TextButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).push(
                  CupertinoPageRoute(builder: (context) => WelcomeScreen()));
            },
            child: Text("نعم ",
                style: TextStyle(
                    color: const Color(0xFF11AAB8),
                    fontWeight: FontWeight.w600))),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "لا",
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
            )),
      ],
    );
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
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      title: const Text("تجاهل التغييرات",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color.fromRGBO(31, 31, 31, 1),
              fontWeight: FontWeight.bold)),
      content: const Text("إذا عدت الآن، فستفقد التغييرات",
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => Nav_Afternoon(
                            documentId: widget.documentId,
                            Confirm: save,
                            index: 2,
                            TheValue: SchoolName.text,
                            whichpag: 0,
                            DropDown: isDrop,
                            TabValue: 2,
                          )));
            },
            child: const Text("تجاهل التغييرات",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromARGB(255, 197, 24, 24),
                    fontWeight: FontWeight.bold))),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("الاستمرار في التحرير"),
        ),
      ],
    );
  }

  Widget CreateDialog3(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      title: const Text("تجاهل التغييرات",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold)),
      content: const Text("إذا عدت الآن، فستفقد التغييرات",
          textAlign: TextAlign.center,
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => Nav_Afternoon(
                            documentId: widget.documentId,
                            Confirm: save,
                            index: 2,
                            TheValue: SchoolName.text,
                            whichpag: 0,
                            DropDown: isDrop,
                            TabValue: 2,
                          )));
            },
            child: const Text("تجاهل التغييرات",
                style: TextStyle(
                    color: const Color(0xFF29294D),
                    fontWeight: FontWeight.bold))),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("الاستمرار في التحرير"),
        ),
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
        "المعلومات الشخصيه",
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
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      title: const Text("تحديث معلومات مدير المدرسة",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color.fromRGBO(31, 31, 31, 1),
              fontWeight: FontWeight.bold)),
      content: const Text("تم تحديث المعلومات بنجاح",
          textAlign: TextAlign.center,
          style: TextStyle(color: Color.fromRGBO(31, 31, 31, 1))),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.of(context).push(CupertinoPageRoute(
                  builder: (context) => Nav_Afternoon(
                        TabValue: 4,
                      )));
            },
            child: const Text("موافق",
                style: TextStyle(
                    color: const Color(0xFF29294D),
                    fontWeight: FontWeight.bold))),
      ],
    );
  }
}
