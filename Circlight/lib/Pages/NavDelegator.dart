import 'package:circlight/Pages/editDelegator.dart';
import 'package:circlight/Pages/viewprofileDelegator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'DelegatorHome.dart';

import 'DelegatorStudents.dart';
import 'Pick_up.dart';
import 'base_screen.dart';
import 'displayParent.dart';
import 'displayStudent.dart';

import 'package:circlight/Pages/GenaralSearch.dart';

class NavDel extends StatefulWidget {
  final int TabValue;
  final TheValue; //********** */
  final whichpag; //********** */
  final DropDown; //********** */
  final documentId;
  final Confirm; //********** */
  final index; //

  const NavDel({
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
  State<NavDel> createState() => _NavDel();
}

class _NavDel extends State<NavDel> {
  SetTab() {
    setState(() {
      switch (widget.TabValue) {
        case 0:
          currentScreen = DelegatorHome();
          Tab = 0;
          break;

        case 1:
          currentScreen = DelegatorStudent();
          Tab = 1;
          break;
        case 3:
          currentScreen = FeaturedScreenX();
          Tab = 3;
          break;

        case 7:
          currentScreen = editDelegator(
            Confirm: false,
            DropDown: false,
            TheValue: widget.TheValue,
            Index: widget.index,
            documentId: widget.documentId,
            whichpag: widget.whichpag,
          );
          break;

        case 8:
          break;
        case 9:
          break;
        case 10:
          break;
        case 11:
          break;

        case 12:
          break;

        case 13:
          break;

        case 14:
          break;

        case 15:
          break;
      }
    });
  }

  int _count = 0;
  int Tab = 0;
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = DelegatorHome();

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
                                  builder: (context) => NavDel(
                                        TabValue: 1,

                                        // documentId: widget.documentId,
                                      )));
                          // currentScreen = DelegatorPending();
                          Tab = 1;
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
                              Image.asset("assets/images/list.png",
                                  width: 25,
                                  height: 25,
                                  color: Tab == 1
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
                              'الطلاب',
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: Tab == 1
                                      ? const Color(0xff0da6c2)
                                      : Colors.grey),
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
                              builder: (context) => NavDel(
                                    TabValue: 3,

                                    // documentId: widget.documentId,
                                  )));
                      currentScreen = FeaturedScreenX() as Widget;
                      Tab = 3;
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
                              color: Tab == 3
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
                              color: Tab == 133
                                  ? const Color(0xff0da6c2)
                                  : Colors.grey),
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
                                  builder: (context) => NavDel(
                                        TabValue: 0,
                                      )));
                          currentScreen = BaseScreen();
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
                                      : Colors.grey),
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