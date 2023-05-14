import 'package:circlight/Pages/Screens/login_screen.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class SignUpScreenTopImage extends StatelessWidget {
  // String userData;
  SignUpScreenTopImage({
    // required this.userData,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
                // SizedBox(
                //   width: 100,
                // ),
                SizedBox(
                  width: 65,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "إنشاء حساب المفوض",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                // SizedBox(
                //   width: 150,
                // ),
              ],
            ),
          ),
        ]),
        ////////////////////////////
        /* Text(
          "".toUpperCase(),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),*/
        //  SizedBox(height: defaultPadding),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Expanded(
              flex: 2,
              child: Container(
                  height: 110,
                  width: 110,
                  child: Image.asset("assets/icons/circlight_icon_5000.png")),
            ),
            const Spacer(),
          ],
        ),

        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LoginScreen(
                            // user: userData,
                            )),
                  );
                },
                child: Text(
                  " تسجيل الدخول ",
                  style: TextStyle(
                      fontSize: 17,
                      color: const Color(0xFF11AAB8),
                      fontWeight: FontWeight.w600),
                ),
              ),
              Text(
                "هل لديك حساب ؟",
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              ),
            ]),
        // SizedBox(height: defaultPadding),
      ],
    );
  }
}
