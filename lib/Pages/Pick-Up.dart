//import 'package:education_app/constants/color.dart';
//import 'package:education_app/constants/size.dart';
//import 'package:education_app/main.dart';
//import 'package:education_app/models/category.dart';

//import 'package:education_app/screens/details_screen.dart';
//import 'package:education_app/widgets/circle_button.dart';
//import 'package:education_app/widgets/lesson_card.dart';

import 'package:circlight/Pages/Nav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_database/firebase_database.dart';

//import '../widgets/search_testfield.dart';
import 'base_screen.dart';
import 'displayParent.dart';
import 'displayStudent.dart';

// ignore: deprecated_member_use
final DBref = FirebaseDatabase.instance.reference();
int ledStatus = 0;
bool isLoading = false;

class PickUp extends StatefulWidget {
  const PickUp({Key? key}) : super(key: key);

  @override
  _PickUp createState() => _PickUp();
}

class _PickUp extends State<PickUp> {
  @override
  Widget build(BuildContext context) {
    const kBottomNavigationBarItemSize = 24.0;
    const kCategoryCardImageSize = 120.0;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(252, 253, 255, 1),
        body: Column(
          children: const [
            AppBar(),
            Body(),
          ],
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 90, left: 20, right: 20, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [],
          ),
        ),
        Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                //color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.04),
                    blurRadius: 4.0,
                    spreadRadius: .05,
                  ), //BoxShadow
                ],
              ),
              child: Container(
                child: Align(
                  //alignment: Alignment.center,
                  // child: Image.asset(
                  //   'assets/icons/parent.png',
                  //   height: kCategoryCardImageSize, //image size
                  // ),

                  child: GestureDetector(
                    child: Image.asset(
                      "assets/icons/BlueZone.png",
                      height: 120.0,
                      //fit: BoxFit.fill
                      //width: 130,
                    ),
                    onTap: () {
                      LightBlue();
                    },
                  ),
                ),
              ),
            ),
            // SizedBox(
            //   height: 40,
            // ),

            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                //color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.04),
                    blurRadius: 4.0,
                    spreadRadius: .05,
                  ), //BoxShadow
                ],
              ),
              child: Container(
                child: Align(
                  child: GestureDetector(
                    child: Image.asset(
                      'assets/icons/YellowZone.png',
                      height: 120.0,
                    ),
                    onTap: () {
                      LightYellow();
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 25, // <-- SEE HERE
        ),
        Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                //color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.04),
                    blurRadius: 4.0,
                    spreadRadius: .05,
                  ), //BoxShadow
                ],
              ),
              child: Container(
                child: Align(
                  //alignment: Alignment.center,
                  // child: Image.asset(
                  //   'assets/icons/parent.png',
                  //   height: kCategoryCardImageSize, //image size
                  // ),

                  child: GestureDetector(
                    child: Image.asset(
                      "assets/icons/GreenZone.png",
                      height: 120.0,
                    ),
                    onTap: () {
                      LightGreen();
                    },
                  ),
                ),
              ),
            ),
            // SizedBox(
            //   height: 40,
            // ),

            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                //color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.04),
                    blurRadius: 4.0,
                    spreadRadius: .05,
                  ), //BoxShadow
                ],
              ),
              child: Container(
                child: Align(
                  child: GestureDetector(
                    child: Image.asset(
                      'assets/icons/RedZone.png',
                      height: 120.0,
                    ),
                    onTap: () {
                      LightRed();
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // padding:
        // //     const EdgeInsets.only(top: 0, left: 0, right: 0), //here is مرحبًا ;

        // height: 300,
        // width: double.infinity,
        // decoration: const BoxDecoration(
        //   borderRadius: BorderRadius.only(
        //     //topRight: Radius.circular(20),
        //     //topLeft: Radius.circular(20),
        //     bottomLeft: Radius.circular(20),
        //     bottomRight: Radius.circular(20),
        //   ),
        //   gradient: LinearGradient(
        //     begin: Alignment.topLeft,
        //     end: Alignment.bottomRight,
        //     stops: [0.1, 0.5],
        //     colors: [const Color(0xff42c98d), const Color(0xff0da6c2)],
        //   ),
        // ),
        );
  }
}

Future LightBlue() async {
  setrbgcolors(Colors.blue);
  //create a function to set color in realtime  database
}

Future LightGreen() async {
  setrbgcolors(Color.fromARGB(255, 23, 170, 28));
}

Future LightRed() async {
  setrbgcolors(Color.fromARGB(255, 171, 23, 13));
}

Future LightYellow() async {
  setrbgcolors(Colors.yellow);
}

final ref = FirebaseDatabase.instance.ref();

//setpower
setstatusofpower({bool value = false}) {
  ref.child("/power").set(value ? 1 : 0);
}

setrbgcolors(Color color) {
  print("hellrbg");
  String value = color.red.toString() +
      "," +
      color.blue.toString() +
      "," +
      color.green.toString();
  ref.child("/rbg").set(value);
}
