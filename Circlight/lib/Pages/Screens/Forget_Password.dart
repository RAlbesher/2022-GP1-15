import 'package:circlight/Pages/Nav.dart';
import 'package:flutter/material.dart';
import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_widgets.dart';
//import 'Nav.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({
    Key? key,
  }) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPassword();
}

class _ForgetPassword extends State<ForgetPassword>
    with TickerProviderStateMixin {
  //defining a lists
  List<String> docEmails = [];
  List<String> docUserName = [];

  //for Email uniqueness
  Future getEmail() async {
    await FirebaseFirestore.instance.collection("Delegator").get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            // print(document["Email"]);
            docEmails.add(document["Email"]);
          }),
        );
  }

  //for username uniqueness
  Future getUserName() async {
    await FirebaseFirestore.instance.collection("Delegator").get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            docUserName.add(document["UserName"]);
          }),
        );
  }

//conntrollers
  final _key = GlobalKey<FormState>();
  TextEditingController _emailContoller = TextEditingController();

  late Animation _colorTween, _iconColorTween, _icon2ColorTween;
  late TextEditingController controller;
  var Real;
  late FixedExtentScrollController scrollController;
  late AnimationController _ColorAnimationController;
  late AnimationController _TextAnimationController;
  late Animation<Offset> _transTween;
  int NumIndex = 0;
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
  }

  bool _passwordVisible = false;
  bool _passwordVisible2 = false;
  var loading = false;
  @override
  void dispose() {
    _emailContoller.dispose();
    super.dispose();
  }

  Future PasswordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailContoller.text.trim());
      await showCupertinoDialog(context: context, builder: CreateDialog1);
    } on FirebaseAuthException catch (e) {
      print(e);
      await showCupertinoDialog(context: context, builder: CreateDialog);
    }
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference Parent =
        FirebaseFirestore.instance.collection("Delegator");
    getEmail();
    getUserName();
    return Container(
        height: 800,
        // color: Colors.red,
        child: Column(
          children: [
            Row(children: <Widget>[
              Container(
                  child: Align(
                alignment: AlignmentDirectional(1.01, -12.99),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 16,
                      ),
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 55,
                    ),
                    Align(
                      alignment: AlignmentDirectional(1.01, 0),
                      child: Container(
                        padding: const EdgeInsets.only(right: 50),
                        child: Text(
                          "   إعادة تعيين كلمة المرور",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              )),
            ]),
            ////////////////////////////
            Text(
              "".toUpperCase(),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: defaultPadding),
            Row(
              children: [
                const Spacer(),
                Expanded(
                  flex: 2,
                  child: Image.asset("assets/icons/circlight_icon_500.png"),
                ),
                const Spacer(),
              ],
            ),
            Form(
              key: _key,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(22, 4, 22, 16),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: TextFormField(
                        onChanged: (val) => _key.currentState?.validate(),
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        controller: _emailContoller,
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value!))
                            return "أرجو منك تعبئه الحقل بطريقه صحيحة مثل something@gmail.com ";
                          else {
                            for (var i = 0; i < docEmails.length; i++) {
                              if (value == docEmails[i]) {
                                return "البريد الإلكتروني مستخدم مسبقا ";
                              }
                            }
                            return null;
                          }
                        },
                        onSaved: (email) {},
                        showCursor: true,
                        cursorColor: const Color(0xFF2E295F),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                            top: 30.0,
                            bottom: 10,
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(defaultPadding),
                            child: Icon(
                              Icons.message,
                              color: Color.fromARGB(139, 46, 41, 95),
                              size: 22,
                            ),
                          ),
                          alignLabelWithHint: true,
                          filled: true, //<-- SEE HERE
                          fillColor: Colors.white,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: "البريد الإلكتروني",
                          labelStyle:
                              TextStyle(color: Colors.grey, fontSize: 14),
                          hintText: "أدخل البريد الإلكتروني",
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 14),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(139, 46, 41, 95),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                              color: Color.fromARGB(139, 46, 41, 95),
                              width: 0.5,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(139, 46, 41, 95),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: defaultPadding / 2),
                  const SizedBox(height: defaultPadding),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(22, 4, 22, 16),
                    child: FFButtonWidget(
                      onPressed: () {
                        PasswordReset();
                        if (_key.currentState != null &&
                            _key.currentState!.validate()) {}
                        /* Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => Nav(
                          TabValue: 0,
                          documentId: "",
                        ),
                      ));*/
                      },
                      text: "إعادة تعيين كلمة المرور ",
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
                ],
              ),
            )
          ],
        ));
  }
}

Widget CreateDialog(BuildContext context) {
  return AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
    title: Text(" إعاده تعيين كلمة المرور",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 18,
            color: Color.fromRGBO(31, 31, 31, 1),
            fontWeight: FontWeight.bold)),
    content: Text(
      "يرجى التحقق من البريد الإلكتروني المدخل",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 14),
    ),
    actions: <Widget>[
      TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("موافق",
              style: TextStyle(
                  color: const Color(0xFF2E295F),
                  fontWeight: FontWeight.bold))),
    ],
  );
}

Widget CreateDialog1(BuildContext context) {
  return AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
    title: Text(" إعاده تعيين كلمة المرور",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 18,
            color: Color.fromRGBO(31, 31, 31, 1),
            fontWeight: FontWeight.bold)),
    content: Text(
      "!تم إرسال البريد الإلكتروني بنجاح",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 14),
    ),
    actions: <Widget>[
      TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("موافق",
              style: TextStyle(
                  color: const Color(0xFF2E295F),
                  fontWeight: FontWeight.bold))),
    ],
  );
}
