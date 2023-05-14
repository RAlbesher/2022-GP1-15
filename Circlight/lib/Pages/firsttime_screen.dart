//import 'package:education_app/constants/color.dart';
//import 'package:education_app/constants/size.dart';
import 'dart:convert';
import 'dart:math';

import 'package:circlight/Pages/constants.dart';
import 'package:circlight/Pages/Screens/home_screen.dart';
import 'package:circlight/Pages/Screens/welcome_screen.dart';
import 'package:circlight/flutter_flow/flutter_flow_theme.dart';
import 'package:circlight/main.dart';
import 'package:encryptor/encryptor.dart';
import 'package:crypto/crypto.dart';

//import 'package:education_app/models/category.dart';

//import 'package:education_app/screens/details_screen.dart';
//import 'package:education_app/widgets/circle_button.dart';
//import 'package:education_app/widgets/lesson_card.dart';
import 'package:circlight/Pages/Nav.dart';
import 'package:circlight/Pages/Screens/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

//import '../widgets/search_testfield.dart';

import '../flutter_flow/flutter_flow_widgets.dart';
import 'ParentHome.dart';
import 'Widgets/background_widget.dart';
import 'base_screen.dart';
import 'displayParent.dart';
import 'displayStudent.dart';

class FirstTimeScreen extends StatefulWidget {
  FirstTimeScreen({
    Key? key,
    // required this.user,
    required this.userName,
  }) : super(key: key);
  // String user;
  String userName;
  @override
  _FirstTimeScreen createState() => _FirstTimeScreen();
}

class _FirstTimeScreen extends State<FirstTimeScreen> {
  TextEditingController passwordController = TextEditingController();
  final _key = GlobalKey<FormState>();
  Future<void> changeParentPassword() async {
    var randompass = Random().nextInt(10000) + 10000000000000000;
    await FirebaseAuth.instance.currentUser!
        .updatePassword(passwordController.text.toString());
    String stringValue = randompass.toString();
    var digest = sha1.convert(utf8.encode(stringValue)).toString();
    await FirebaseFirestore.instance
        .collection("Parent")
        .doc(FirebaseAuth.instance.currentUser!.uid.toString())
        .set({"Password": digest.toString()}, SetOptions(merge: true));
    // FirebaseAuth.instance.currentUser!.uid;
    Navigator.of(context)
        .push(CupertinoPageRoute(builder: (context) => ParentHome()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Expanded(
        child: Background(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: Form(
              key: _key,
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          const Spacer(),
                          Expanded(
                            flex: 2,
                            child: Image.asset(
                                "assets/icons/circlight_icon_500.png"),
                          ),
                          const Spacer(),
                        ],
                      ),
                      Wrap(
                        children: [
                          Directionality(
                            textDirection: TextDirection.rtl,
                            //width: MediaQuery.of(context).size.width * 0.8,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: TextFormField(
                                controller: passwordController,
                                onChanged: (val) =>
                                    _key.currentState?.validate(),
                                validator: (value) {
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
                                textInputAction: TextInputAction.next,
                                showCursor: true,
                                //textAlign: TextAlign.right,
                                cursorColor: const Color(0xFF11AAB8),
                                decoration: InputDecoration(
                                  filled: true, //<-- SEE HERE
                                  fillColor: Colors.white,
                                  hintText: "من فضلك أدخل كلمة مرور جديدة",
                                  hintStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(139, 46, 41, 95),
                                      width: 0.5,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(139, 46, 41, 95),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(139, 46, 41, 95),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  prefixIcon: Padding(
                                    padding:
                                        const EdgeInsets.all(defaultPadding),
                                    child: Icon(
                                      Icons.lock,
                                      color: Color.fromARGB(139, 46, 41, 95),
                                      size: 22,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(22, 4, 22, 16),
                        child: FFButtonWidget(
                          onPressed: () {
                            checkFparentValue(passwordController.text);
                            changeParentPassword();
                          },
                          text: "حفظ",
                          options: FFButtonOptions(
                            width: double.infinity,
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
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void checkFparentValue(String textFieldValue) async {
  bool isFirstTime = true;
  FirebaseFirestore.instance
      .collection("Parent")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .get()
      .then((value) {
    if (value.exists) {
      Map<String, dynamic> dataa = {};
      dataa.addAll(value.data() as Map<String, dynamic>);
      if (textFieldValue.isEmpty) {
        isFirstTime = false;
        FirebaseFirestore.instance
            .collection("Parent")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .set({"PfirstTime": false}, SetOptions(merge: true));
      } else {
        FirebaseFirestore.instance
            .collection("Parent")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .set({"PfirstTime": true}, SetOptions(merge: true));
      }
    }
  });
}
