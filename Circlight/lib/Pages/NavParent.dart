//import 'package:circlight/Pages/Pick-Up.dart';

import 'package:circlight/Pages/DelRequest.dart';
import 'package:circlight/Pages/ListRequest.dart';
import 'package:circlight/Pages/ParentREQ.dart';
import 'package:circlight/Pages/ReqMissing.dart';
import 'package:circlight/Pages/RequestDone.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'AnnounParent.dart';
import 'lisetDelegator.dart';
import 'EditP.dart';
import 'ParentHome.dart';
import 'Pick_up.dart';
import 'PreviewReqParent.dart';
import 'base_screen.dart';
import 'displayParent.dart';
import 'displayStudent.dart';

import 'editStudent.dart';
import 'StudentAssign.dart';
import 'package:circlight/Pages/GenaralSearch.dart';
import 'package:circlight/Pages/StudentAssign.dart';
import 'package:circlight/Pages/viewprofileParent.dart';
import 'package:circlight/Pages/viewprofileStudent.dart';

import 'listDel.dart';

class NavParent extends StatefulWidget {
  final int TabValue;
  final TheValue; //********** */
  final whichpag; //********** */
  final DropDown; //********** */
  final documentId;
  final Confirm; //********** */
  final index; //********** */
  const NavParent({
    super.key,
    this.DropDown,
    required this.TabValue,
    this.documentId,
    this.index,
    this.whichpag,
    this.TheValue,
    this.Confirm,
  });

  @override
  State<NavParent> createState() => _NavParent();
}

class _NavParent extends State<NavParent> {
  SetTab() {
    setState(() {
      switch (widget.TabValue) {
        case 10:
          currentScreen = ListDelegatorx();
          Tab = 10;
          break;
        case 1:
          currentScreen = PreviewReqParent(
            documentId: widget.documentId,
          );
          Tab = 1;
          break;

        case 0:
          currentScreen = ParentHome();
          Tab = 0;
          break;

        case 4:
          currentScreen = FeaturedScreenX();
          Tab = 4;
          break;
        case 14:
          currentScreen = AnnounParent();
          Tab = 14;
          break;
        case 17:
          currentScreen = ListReqq();
          Tab = 17;
          break;

        case 19:
          currentScreen = ReqMissing(
            documentId: widget.documentId,
          );
          Tab = 19;
          break;
        case 20:
          currentScreen = DelRequest();
          break;
        case 22:
          currentScreen = PRequest();
          Tab = 17;
          break;
        case 23:
          currentScreen = EditP(
            Confirm: false,
            DropDown: false,
            TheValue: widget.TheValue,
            Index: widget.index,
            documentId: widget.documentId,
            whichpag: widget.whichpag,
          );
          Tab = 23;
          break;
        case 28:
          currentScreen = RequestDone3(
            documentId: widget.documentId,
          );
          Tab = 28;
          break;
      }
    });
  }

  int _count = 0;
  int Tab = 0;
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = ListDelegatorx();

  @override
  Widget build(BuildContext context) {
    final List<Widget> Screens = [
      BaseScreen(),
      Paretdisplay(),
      Studentdispaly(),
    ];
    SetTab();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      bottomNavigationBar: SizedBox(
        height: 65,
        child: BottomAppBar(
          child: Container(
            height: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          //currentScreen = Requests();
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => NavParent(
                                        TabValue: 17,
                                        // documentId: widget.documentId,
                                      )));
                          Tab = 17;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              //     padding: const EdgeInsets.only(right: 50),
                              child: Align(
                            child: Column(children: [
                              SizedBox(
                                height: 11,
                              ),
                              Image.asset("assets/images/REQ2.png",
                                  width: 25,
                                  height: 25,
                                  color: Tab == 17
                                      ? const Color(0xff0da6c2)
                                      : Color.fromARGB(255, 167, 166, 166))
                            ]),
                          )),
                          SizedBox(
                            height: 3,
                          ),
                          Container(
                            //  padding: const EdgeInsets.only(right: 50),
                            child: Text(
                              'الطلبات',
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: Tab == 17
                                      ? const Color(0xff0da6c2)
                                      : Color.fromARGB(255, 167, 166, 166)),
                            ),
                          )

                          // Text
                          // Column
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => NavParent(
                                        TabValue: 14,
                                        // documentId: widget.documentId,
                                      )));
                          currentScreen = AnnounParent();
                          Tab = 14;
                        });
                        /* setState(() {
                          currentScreen = Paretdisplay();
                          Tab = 2;
                        });*/
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              //     padding: const EdgeInsets.only(right: 50),
                              child: Align(
                            child: Column(children: [
                              SizedBox(
                                height: 11,
                              ),
                              Image.asset("assets/images/announ.png",
                                  width: 25,
                                  height: 25,
                                  color: Tab == 14
                                      ? const Color(0xff0da6c2)
                                      : Color.fromARGB(255, 167, 166, 166)),
                            ]),
                          )),
                          SizedBox(
                            height: 3,
                          ),
                          Container(
                            //  padding: const EdgeInsets.only(right: 50),
                            child: Text(
                              'الإعلانات',
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: Tab == 14
                                      ? const Color(0xff0da6c2)
                                      : Color.fromARGB(255, 167, 166, 166)),
                            ),
                          ),
                          // Text
                          // Column
                        ],
                      ),
                    ),
                  ],
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => NavParent(
                                    TabValue: 4,
                                    // documentId: widget.documentId,
                                  )));
                      currentScreen = FeaturedScreenX();
                      Tab = 4;
                    });
                    /* setState(() {
                          currentScreen = Paretdisplay();
                          Tab = 2;
                        });*/
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          //     padding: const EdgeInsets.only(right: 50),
                          child: Align(
                        child: Column(children: [
                          SizedBox(
                            height: 11,
                          ),
                          Image.asset("assets/images/route.png",
                              width: 25,
                              height: 25,
                              color: Tab == 4
                                  ? const Color(0xff0da6c2)
                                  : Color.fromARGB(255, 167, 166, 166)),
                        ]),
                      )),
                      SizedBox(
                        height: 3,
                      ),
                      Container(
                        //  padding: const EdgeInsets.only(right: 50),
                        child: Text(
                          'أستلام الطفل',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: Tab == 4
                                  ? const Color(0xff0da6c2)
                                  : Color.fromARGB(255, 167, 166, 166)),
                        ),
                      ),
                      // Text
                      // Column
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          setState(() {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => NavParent(
                                          TabValue: 10,
                                          // documentId: widget.documentId,
                                        )));
                            currentScreen = ListDelegatorx();
                            Tab = 10;
                          });
                        },
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  //    padding:
                                  //        const EdgeInsets.only(right: 50),
                                  child: Align(
                                child: Column(children: [
                                  SizedBox(
                                    height: 11,
                                  ),
                                  Image.asset("assets/images/delegate.png",
                                      width: 25,
                                      height: 25,
                                      color: Tab == 10
                                          ? const Color(0xff0da6c2)
                                          : Color.fromARGB(255, 167, 166, 166)),
                                ]),
                              )),
                              SizedBox(
                                height: 3,
                              ),
                              Container(
                                //   padding:
                                //      const EdgeInsets.only(right: 50),
                                child: Text(
                                  'قائمة المفوضين',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                      color: Tab == 10
                                          ? const Color(0xff0da6c2)
                                          : Color.fromARGB(255, 167, 166, 166)),
                                ),
                              )
                            ])),
                    SizedBox(
                      width: 10,
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => NavParent(
                                        TabValue: 0,
                                      )));
                          currentScreen = ParentHome();
                          Tab = 0;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              //     padding: const EdgeInsets.only(right: 50),
                              child: Align(
                            child: Column(children: [
                              SizedBox(
                                height: 11,
                              ),
                              Image.asset("assets/images/homepage.png",
                                  width: 25,
                                  height: 25,
                                  color: Tab == 0
                                      ? const Color(0xff0da6c2)
                                      : Color.fromARGB(255, 167, 166, 166)),
                            ]),
                          )),
                          SizedBox(
                            height: 3,
                          ),
                          Container(
                            //  padding: const EdgeInsets.only(right: 50),
                            child: Text(
                              'الرئيسية',
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: Tab == 0
                                      ? const Color(0xff0da6c2)
                                      : Color.fromARGB(255, 167, 166, 166)),
                            ),
                          )
                          // Text
                          // Column
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      //   floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
