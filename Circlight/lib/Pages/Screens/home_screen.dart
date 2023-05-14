import 'package:circlight/Pages/Screens/login_screen.dart';
import 'package:circlight/Pages/Screens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/background.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen(
      {
      // required this.user,
      required this.userName,
      int? TabValue,
      String? documentId});

  // String user;
  String userName;

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
            userName,
            style: TextStyle(color: Colors.white38),
          ),
        ),
        body: Column(children: [
          Text(
            userName,
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
          InkWell(
            onTap: () {
              /*    Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => Viewparentprof(
                            documentId: FirebaseAuth.instance.currentUser!.uid
                                .toString(),
                            Confirm: false,
                            Index: 1,
                            TheValue: '',
                            whichpag: 0,
                            DropDown: false,
                          )));*/
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
          TextButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).push(
                  CupertinoPageRoute(builder: (context) => WelcomeScreen()));
            },
            child: Text(
              "تسجيل خروج",
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
          )
        ]),
      ),
    );
  }
}
