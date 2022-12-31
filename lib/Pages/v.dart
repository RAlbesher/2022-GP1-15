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

class page extends StatefulWidget {
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

  page(
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
  State<page> createState() => _CreateDelegator();
}

class _CreateDelegator extends State<page> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "btn",
      child: Center(
        child: Container(
          height: 500,
          width: 500,
          child: DecoratedBox(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  const Color(0xff42c98d),
                  const Color(0xff42c98d),
                  const Color(0xff0da6c2),

                  //add more colors
                ]),
                borderRadius: BorderRadius.circular(500),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
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
                /*await showCupertinoDialog(
                                      context: context, builder: CreateDialog);*/
              },
              child: Padding(
                padding: EdgeInsets.only(
                  left: 18,
                  right: 18,
                ),
                child: Text(
                  "",
                  style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
