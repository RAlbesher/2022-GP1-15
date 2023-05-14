import 'package:circlight/Pages/DelegatorHome.dart';
import 'package:circlight/Pages/Nav.dart';
import 'package:circlight/Pages/NavDelegator.dart';
import 'package:circlight/Pages/NavParent.dart';
import 'package:circlight/Pages/Nav_Afternoon.dart';
import 'package:circlight/Pages/featuerd_screen.dart';
import 'package:circlight/Pages/firsttime_screen.dart';
import 'package:circlight/Pages/Screens/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_widgets.dart';
import '../ParentHome.dart';
import '../Screens/ForgetPassword_Button.dart';
import '../Screens/signup_screen.dart';
import '../constants.dart';
import 'already_account.dart';
import 'login_screen_top_image.dart';

class LoginForm extends StatefulWidget {
  // String userroll;

  // LoginForm({
  //   required this.userroll,
  //   Key? key,
  // }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _passwordVisible = true;
  final TextEditingController emailControllerForSignIn =
      TextEditingController();
  String userRolee = "";
  final TextEditingController passwordControllerForSignIn =
      TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  final formKey = GlobalKey<FormState>();
  bool isFirstTime = false;
  Future signIn(BuildContext context) async {
    // print(widget.userroll.toString());
    try {
      // isLoading.value = true;

      await auth
          .signInWithEmailAndPassword(
              email: emailControllerForSignIn.text.trim(),
              password: passwordControllerForSignIn.text.trim())
          .then((value) {
        // FirebaseFirestore.instance.collection("Users").get().then((value) {
        //   for (var docSnapshot in value.docs) {

        //   print('${docSnapshot.id} => ${docSnapshot.data()}');
        // }
        // });
        FirebaseFirestore.instance
            .collection("Users")
            .doc(auth.currentUser!.uid.toString())
            .get()
            .then((docSnapshot) {
          if (docSnapshot.exists) {
            userRolee = docSnapshot.data()!["userRole"].toString();
            print(userRolee.toString());

            if (userRolee == "admin") {
              FirebaseFirestore.instance
                  .collection("Admin")
                  .doc(value.user!.uid)
                  .get()
                  .then((value) {
                if (value.exists) {
                  print("1");
                  var name = value.get("SchoolName");

                  Navigator.of(context).push(CupertinoPageRoute(
                      builder: (context) => Nav(
                            TabValue: 0,
                            documentId: FirebaseAuth.instance.currentUser!.uid
                                .toString(),
                          )));
                  // Navigator.of(context).push(CupertinoPageRoute(
                  //     builder: (context) => StudentScreen(userName: name, user: widget.userData)
                  // ));
                } else {
                  print("1");
                  const snackBar = SnackBar(
                    content:
                        Text('رمز الدخول أو البريد الإلكتروني المدخل خاطئ'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              });
            } else if (userRolee == "Afternoonshift") {
              FirebaseFirestore.instance
                  .collection("Afternoonshift")
                  .doc(value.user!.uid)
                  .get()
                  .then((value) {
                if (value.exists) {
                  print("1");
                  var name = value.get("SchoolName");

                  Navigator.of(context).push(CupertinoPageRoute(
                      builder: (context) => Nav_Afternoon(
                            TabValue: 4,
                          )));
                  // Navigator.of(context).push(CupertinoPageRoute(
                  //     builder: (context) => StudentScreen(userName: name, user: widget.userData)
                  // ));
                } else {
                  print("1");
                  const snackBar = SnackBar(
                    content:
                        Text('رمز الدخول أو البريد الإلكتروني المدخل خاطئ'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              });
            } else if (userRolee == "parent") {
              bool isFirstTime = true;
              FirebaseFirestore.instance
                  .collection("Parent")
                  .doc(value.user!.uid)
                  .get()
                  .then((value) {
                if (value.exists) {
                  Map<String, dynamic> dataa = {};
                  dataa.addAll(value.data() as Map<String, dynamic>);
                  if (dataa["PfirstTime"] == false) {
                    isFirstTime = false;
                    FirebaseFirestore.instance
                        .collection("Parent")
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .set({"PfirstTime": true}, SetOptions(merge: true));
                  }
                  print("2");
                  var name = value.get("Name");

                  if (isFirstTime == false) {
                    print("Yes successfully");
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => FirstTimeScreen(userName: name)));
                  } else {
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => NavParent(
                              TabValue: 0,
                              documentId: FirebaseAuth.instance.currentUser!.uid
                                  .toString(),
                            )));
                  }

                  // Navigator.of(context).push(CupertinoPageRoute(
                  //     builder: (context) => ParentScreen(userName: name, user: widget.userData)
                  // ));
                } else {
                  const snackBar = SnackBar(
                    content:
                        Text('رمز الدخول أو البريد الإلكتروني المدخل خاطئ'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              });
            } else {
              FirebaseFirestore.instance
                  .collection("Delegator")
                  .doc(value.user!.uid)
                  .get()
                  .then((value) {
                if (value.exists) {
                  print("3");

                  var name = value.get("UserName");
                  // DocumentSnapshot user = snapshot.data.documents[index];
                  // String documentId = user.id;
                  Navigator.of(context).push(CupertinoPageRoute(
                      builder: (context) => NavDel(
                            TabValue: 0,
                            documentId: FirebaseAuth.instance.currentUser!.uid
                                .toString(),
                          )));
                  // Navigator.of(context).push(CupertinoPageRoute(
                  //     builder: (context) => DelegatorScreen(userName: name, user: widget.userData)
                  // ));
                } else {
                  const snackBar = SnackBar(
                    content:
                        Text('رمز الدخول أو البريد الإلكتروني المدخل خاطئ'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              });
            }
          } else {
            // create the document
          }
        });

        // if (widget.userroll == "Admin") {
        //   FirebaseFirestore.instance
        //       .collection("Admin")
        //       .doc(value.user!.uid)
        //       .get()
        //       .then((value) {
        //     if (value.exists) {
        //       print("1");
        //       var name = value.get("SchoolName");

        //       Navigator.of(context).push(
        //           CupertinoPageRoute(builder: (context) => FeaturedScreen()));
        //       // Navigator.of(context).push(CupertinoPageRoute(
        //       //     builder: (context) => StudentScreen(userName: name, user: widget.userData)
        //       // ));
        //     } else {
        //       print("1");
        //       const snackBar = SnackBar(
        //         content: Text('هذا الحساب غير مسجل حاول مره أخرى'),
        //       );
        //       ScaffoldMessenger.of(context).showSnackBar(snackBar);
        //     }
        //   });
        // } else if (widget.userroll == "Parent") {
        //   bool isFirstTime = true;
        //   FirebaseFirestore.instance
        //       .collection("Parent")
        //       .doc(value.user!.uid)
        //       .get()
        //       .then((value) {
        //     if (value.exists) {
        //       Map<String, dynamic> dataa = {};
        //       dataa.addAll(value.data() as Map<String, dynamic>);
        //       if (dataa["PfirstTime"] == false) {
        //         isFirstTime = false;
        //         FirebaseFirestore.instance
        //             .collection("Parent")
        //             .doc(FirebaseAuth.instance.currentUser!.uid)
        //             .set({"PfirstTime": true}, SetOptions(merge: true));
        //       }
        //       print("2");
        //       var name = value.get("Name");

        //       if (isFirstTime == false) {
        //         print("Yes successfully");
        //         Navigator.of(context).push(CupertinoPageRoute(
        //             builder: (context) => FirstTimeScreen(
        //                 user: widget.userroll, userName: name)));
        //       } else {
        //         Navigator.of(context).push(CupertinoPageRoute(
        //             builder: (context) =>
        //                 HomeScreen(user: widget.userroll, userName: name)));
        //       }

        //       // Navigator.of(context).push(CupertinoPageRoute(
        //       //     builder: (context) => ParentScreen(userName: name, user: widget.userData)
        //       // ));
        //     } else {
        //       const snackBar = SnackBar(
        //         content: Text('هذا الحساب غير مسجل حاول مره أخرى'),
        //       );
        //       ScaffoldMessenger.of(context).showSnackBar(snackBar);
        //     }
        //   });
        // } else {
        //   FirebaseFirestore.instance
        //       .collection("Delegator")
        //       .doc(value.user!.uid)
        //       .get()
        //       .then((value) {
        //     if (value.exists) {
        //       print("3");

        //       var name = value.get("UserName");
        //       // DocumentSnapshot user = snapshot.data.documents[index];
        //       // String documentId = user.id;
        //       Navigator.of(context).push(CupertinoPageRoute(
        //           builder: (context) => DelegatorHome(
        //                 userName: name,
        //                 user: widget.userroll,
        //               )));
        //       // Navigator.of(context).push(CupertinoPageRoute(
        //       //     builder: (context) => DelegatorScreen(userName: name, user: widget.userData)
        //       // ));
        //     } else {
        //       const snackBar = SnackBar(
        //         content: Text('هذا الحساب غير مسجل حاول مره أخرى'),
        //       );
        //       ScaffoldMessenger.of(context).showSnackBar(snackBar);
        //     }
        //   });
        // }
      });
    } on FirebaseAuthException catch (e) {
      // isLoading.value = false;
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text('خطأ في تسجيل الدخول '),
      //     action: SnackBarAction(
      //       label: 'Undo',
      //       onPressed: () {
      //         // Some code to undo the change.
      //       },
      //     ),
      //   ),
      // );
      if (e.code == 'user-not-found') {
        print('لم يتم العثور على البريد الإلكتروني');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('رمز الدخول أو البريد الإلكتروني المدخل خاطئ'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          ),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('رمز الدخول أو البريد الإلكتروني المدخل خاطئ'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          ),
        );
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 900,
        width: 800,
        //  color: Colors.red,
        child: Column(children: [
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
                    width: 40,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )),
          ]),
          const LoginScreenTopImage(),
          Form(
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(22, 4, 22, 16),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: TextFormField(
                        controller: emailControllerForSignIn,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        // onSaved: (email) {},
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
                    )),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(22, 4, 22, 16),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextFormField(
                      // textDirection: TextDirection.RTL,
                      controller: passwordControllerForSignIn,
                      textInputAction: TextInputAction.next,
                      obscureText: _passwordVisible,
                      showCursor: true,
                      cursorColor: const Color(0xFF2E295F),
                      decoration: InputDecoration(
                        filled: true, //<-- SEE HERE
                        fillColor: Colors.white,
                        hintText: " الرقم السري",
                        suffixIcon: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            _passwordVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          onPressed: () {
                            // Update the state i.e. toogle the state of passwordVisible variable
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                        labelStyle: TextStyle(color: Colors.grey, fontSize: 14),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(139, 46, 41, 95),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
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
                ),
                const SizedBox(height: defaultPadding),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(22, 4, 22, 16),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await signIn(context);
                    },
                    text: "تسجيل الدخول",
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
                const SizedBox(height: defaultPadding),
                AlreadyHaveAnAccountCheck(
                  press: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) {
                          return ForgetPassword_Button(
                              // user: widget.userroll,
                              );
                        },
                      ),
                    );
                  },
                ),
                // ************************** To TEST ************************

                // ************************** To TEST ************************
              ],
            ),
          ),
        ]));
  }
}
