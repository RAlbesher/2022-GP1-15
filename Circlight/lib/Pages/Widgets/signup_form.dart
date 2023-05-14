import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_widgets.dart';
import '../constants.dart';

class SignUpForm extends StatefulWidget {
  // String userData;
  SignUpForm({
    // required this.userData,
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpForm();
}

class _SignUpForm extends State<SignUpForm> with TickerProviderStateMixin {
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

  //signup method
  Future _signup() async {
    setState(() {
      loading = true;
    });
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _emailContoller.text, password: _passwordController.text)
          .then((value) {
        var passwordd = _passwordController.text;
        String stringValue = passwordd.toString();
        var digest = sha1.convert(utf8.encode(stringValue)).toString();

        FirebaseFirestore.instance
            .collection("Delegator")
            .doc(value.user!.uid)
            .set({
          "Email": _emailContoller.text,
          "UserName": _UsernamelContoller.text,
          "Password": digest,
          "ID": _ID.text,
          "Name": _Name.text,
        });
        FirebaseFirestore.instance
            .collection("Users")
            .doc(value.user!.uid)
            .set({
          "Email": _emailContoller.text,
          "userId": value.user!.uid.toString(),
          "userRole": "delegator"
        });
      });
      //}

      await showCupertinoDialog(context: context, builder: CreateDialog);
    } on FirebaseAuthException catch (e) {
      print(e);
    }

    Navigator.of(context).pop();
  }

//conntrollers
  final _key = GlobalKey<FormState>();
  TextEditingController _emailContoller = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _UsernamelContoller = TextEditingController();
  TextEditingController _ConformpasswordController = TextEditingController();
  TextEditingController _ID = TextEditingController();
  TextEditingController _Phonenumber = TextEditingController();
  TextEditingController _Name = TextEditingController();

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
  Widget build(BuildContext context) {
    CollectionReference Parent =
        FirebaseFirestore.instance.collection("Delegator");
    getEmail();
    getUserName();
    return Form(
      key: _key,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: TextFormField(
                onChanged: (val) => _key.currentState?.validate(),
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                controller: _Name,
                validator: (value) {
                  if (value!.isEmpty)
                    return "أرجو منك تعبئه الحقل الفارغ ";
                  else {
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
                  hintText: "الاسم",
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 14),
                  labelText: "أدخل الاسم",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
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
          ////////////////////////////////////////////////
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: TextFormField(
                onChanged: (val) => _key.currentState?.validate(),
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                controller: _UsernamelContoller,
                validator: (value) {
                  if (value!.isEmpty)
                    return "أرجو منك تعبئه الحقل الفارغ ";
                  else {
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
                  hintText: "أدخل اسم المستخدم",
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 14),
                  labelText: "اسم المستخدم",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: TextFormField(
                onChanged: (val) => _key.currentState?.validate(),
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                controller: _ID,
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^(?:[+0][1-9])?[0-9]{10,12}$').hasMatch(value!))
                    return "أرجو منك تعبئه الحقل بطريقه صحيحه حيث يتكون من 10 ارقام";
                  else {
                    return null;
                  }
                },
                maxLength: 10,
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
                  hintText: "أدخل رقم الهوية /الإقامة",
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 14),
                  labelText: "أدخل رقم الهوية /الإقامة",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: TextFormField(
                onChanged: (val) => _key.currentState?.validate(),
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                controller: _Phonenumber,
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^(?:[+0][1-9])?[0-9]{10,12}$').hasMatch(value!))
                    return "أرجو منك تعبئه الحقل بطريقه صحيحه حيث يتكون من 10 ارقام";
                  else {
                    return null;
                  }
                },
                maxLength: 10,
                onSaved: (email) {},
                showCursor: true,
                cursorColor: const Color(0xff42c98d),
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
                  labelText: " رقم الجوال ",
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 14),
                  hintText: "أدخل رقم الجوال ",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
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

          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
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
                cursorColor: const Color(0xff42c98d),
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
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 14),
                  hintText: "أدخل البريد الإلكتروني",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: TextFormField(
                onChanged: (val) => _key.currentState?.validate(),
                controller: _passwordController,
                obscureText:
                    !_passwordVisible, //This will obscure text dynamically
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
                // obscureText: true,
                showCursor: true,
                cursorColor: const Color(0xFF2E295F),
                decoration: InputDecoration(
                  filled: true, //<-- SEE HERE
                  fillColor: Colors.white,

                  hintText: " الرقم السري",
                  // Here is key idea
                  suffixIcon: IconButton(
                    icon: Icon(
                      // Based on passwordVisible state choose the icon
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    onPressed: () {
                      // Update the state i.e. toogle the state of passwordVisible variable
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
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
                    padding: const EdgeInsets.all(defaultPadding),
                    child: Icon(
                      Icons.lock,
                      color: const Color(0xFF2E295F),
                      size: 22,
                    ),
                  ),
                ),
              ),
            ),
            /*child: TextFormField(
              controller: _passwordController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Password cannot be empty';
                } else
                  return null;
              },
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                hintText: " الرقم السري",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),*/
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: TextFormField(
                onChanged: (val) => _key.currentState?.validate(),
                controller: _ConformpasswordController,
                obscureText:
                    !_passwordVisible2, //This will obscure text dynamically
                validator: (value) {
                  if (value!.isEmpty) {
                    return "أرجو منك تعبئه الحقل الفارغ ";
                  }
                  if (_passwordController.text !=
                      _ConformpasswordController.text) {
                    return 'الرقم السري غير متطابق ';
                  } else
                    return null;
                },
                textInputAction: TextInputAction.next,
                //obscureText: true,
                showCursor: true,
                cursorColor: const Color(0xFF2E295F),
                decoration: InputDecoration(
                  filled: true, //<-- SEE HERE
                  fillColor: Colors.white,
                  //for hide show the password
                  suffixIcon: IconButton(
                    icon: Icon(
                      // Based on passwordVisible state choose the icon
                      _passwordVisible2
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    onPressed: () {
                      // Update the state i.e. toogle the state of passwordVisible variable
                      setState(() {
                        _passwordVisible2 = !_passwordVisible2;
                      });
                    },
                  ),
                  hintText: "تأكيد الرقم السري",
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
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: Icon(
                      Icons.lock,
                      color: const Color(0xFF2E295F),
                      size: 22,
                    ),
                  ),
                ),
              ),
            ),
            /*child: TextFormField(
              controller: _ConformpasswordController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Password cannot be empty';
                }
                if (_passwordController.text !=
                    _ConformpasswordController.text) {
                  return 'الرقم السري غير متطابق ';
                } else
                  return null;
              },
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                hintText: "تأكيد الرقم السري ",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),*/
          ),
          const SizedBox(height: defaultPadding / 2),
          const SizedBox(height: defaultPadding),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
            child: FFButtonWidget(
              onPressed: () {
                if (_key.currentState != null &&
                    _key.currentState!.validate()) {
                  _signup();
                }
                /* Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => Nav(
                          TabValue: 0,
                          documentId: "",
                        ),
                      ));*/
              },
              text: "تسجيل ",
              options: FFButtonOptions(
                width: double.infinity,
                height: 50,
                color: const Color(0xFF11AAB8),
                textStyle: FlutterFlowTheme.of(context).subtitle2.override(
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
            height: 100,
          )
          /* ElevatedButton(
            onPressed: () {},
            child: Text("تسجيل الدخول "),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ),
              );
            },
          ),*/
        ],
      ),
    );
  }
/*void signInUser() async {
    dynamic authResult =
        await _auth.loginUser(_emailContoller.text, _passwordController.text);
    if (authResult == null) {
      print('Sign in error. could not be able to login');
    } else {
      _emailContoller.clear();
      _passwordController.clear();
      //Navigator.pushNamed(context, '/dashboard');
    }
  }*/
}

Widget CreateDialog(BuildContext context) {
  return AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
    title: Text("تسجيل حساب",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 18,
            color: Color.fromRGBO(31, 31, 31, 1),
            fontWeight: FontWeight.bold)),
    content: Text(
      "تم تسجبل حسابك بنجاح بإمكانك الدخول لحسابك ",
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
                  color: const Color(0xFF11AAB8),
                  fontWeight: FontWeight.bold))),
    ],
  );
}
