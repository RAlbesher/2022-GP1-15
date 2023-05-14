import 'package:circlight/Pages/CreateParent2.dart';
import 'package:circlight/Pages/ListReqAdmin.dart';
import 'package:circlight/Pages/UpdateStudent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AdminHome.dart';
import 'AdminPreviewRequest.dart';
import 'Afternoonshift-GeneralSearch.dart';
import 'AfternoonshiftAnnounForm.dart';
import 'AfternoonshiftAnnouncement.dart';
import 'AnnounAdmin.dart';

import 'AnnouncementForm.dart';
import 'CreateStudent2.dart';
import 'DashboardAfterNoon.dart';
import 'EditAdmin.dart';
import 'EditAfternoon.dart';
import 'RequestDone.dart';
import 'RequestDoneAdmin.dart';
import 'UpdateParent.dart';
import 'ViewParentProfile-GeneralSearch.dart';
import 'ViewProfileParentAfternoonShift.dart';
import 'ViewStudentprofileAfternoonshift.dart';
import 'base_screen.dart';
import 'displayParent.dart';
import 'displayStudent.dart';

import 'editStudent.dart';
import 'StudentAssign.dart';
import 'package:circlight/Pages/GenaralSearch.dart';
import 'package:circlight/Pages/StudentAssign.dart';
import 'package:circlight/Pages/viewprofileParent.dart';
import 'package:circlight/Pages/viewprofileStudent.dart';

class Nav_Afternoon extends StatefulWidget {
  final int TabValue;
  final documentId;
  final index; //********** */
  final Realtion;
  final Name;
  final username;
  final email;
  final ID;
  final Confirm; //********** */
  final nationality;
  final phone1;
  final phone2;
  final job;
  final SID;
  final Blood;
  final users; //********** */
  final currentIndex;
  final Class;
  final TheValue; //********** */
  final whichpag; //********** */
  final DropDown; //********** */
  final header;
  const Nav_Afternoon(
      {super.key,
      this.DropDown,
      required this.TabValue,
      this.documentId,
      this.Blood,
      this.index,
      this.whichpag,
      this.TheValue,
      this.SID,
      this.Class,
      this.users,
      this.currentIndex,
      this.Realtion,
      this.Confirm,
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
  State<Nav_Afternoon> createState() => _Nav();
}

class _Nav extends State<Nav_Afternoon> {
  SetTab() {
    setState(() {
      switch (widget.TabValue) {
        case 13:
          currentScreen = AfternoonshiftGeneralSearch();
          Tab = 13;
          break;

        case 2:
          currentScreen = EditAfternoon(
            documentId: widget.documentId,
            DropDown: false,
            Confirm: false,
            Index: widget.index,
            TheValue: widget.TheValue,
            whichpag: widget.whichpag,
          );
          setState(() {
            Tab = 1;
          });
          break;
        case 3:
          currentScreen = EditAfternoon(
            documentId: widget.documentId,
            DropDown: false,
            Confirm: false,
            Index: widget.index,
            TheValue: widget.TheValue,
            whichpag: widget.whichpag,
          );
          setState(() {
            Tab = 13;
          });

          break;
        case 4:
          currentScreen = DashboardAfterNoon();
          setState(() {
            Tab = 1;
          });
          break;
        case 5:
          currentScreen = EditAfternoon(
            documentId: widget.documentId,
            DropDown: false,
            Confirm: false,
            Index: widget.index,
            TheValue: widget.TheValue,
            whichpag: widget.whichpag,
          );
          setState(() {
            Tab = 19;
          });
          break;
        case 19:
          currentScreen = AfternoonshiftAnnoun();
          Tab = 19;
          break;
        case 20:
          currentScreen = AfternonnshiftAnnounForm();
          Tab = 20;
          break;

        case 26:
          currentScreen = ViewProfileParentAfternoonShift(
            documentId: widget.documentId,
          );
          Tab = 26;
          break;
        case 27:
          currentScreen = ViewStudentProfileAfternoonshift(
            users: widget.users,
            currentIndex: widget.currentIndex,
          );
          Tab = 27;
          break;
      }
    });
  }

  int _count = 0;
  int Tab = 0;
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = BaseScreen();

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
                    /* MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => Nav_Afternoon(
                                        TabValue: 16,
                                        // documentId: widget.documentId,
                                      )));
                          Tab = 16;
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
                              Image.asset("assets/images/request.png",
                                  width: 25,
                                  height: 25,
                                  color: Tab == 16
                                      ? const Color(0xff0da6c2)
                                      : Colors.grey),
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
                                  color: Tab == 16
                                      ? const Color(0xff0da6c2)
                                      : Colors.grey),
                            ),
                          )

                          // Text
                          // Column
                        ],
                      ),
                    ),*/
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
                                  builder: (context) => Nav_Afternoon(
                                        TabValue: 13,
                                        // documentId: widget.documentId,
                                      )));
                          currentScreen = GeneralSearch();
                          Tab = 13;
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
                              Image.asset("assets/images/search.png",
                                  width: 25,
                                  height: 25,
                                  color: Tab == 13
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
                              'البحث',
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: Tab == 13
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
                              builder: (context) => Nav_Afternoon(
                                    TabValue: 19,
                                    // documentId: widget.documentId,
                                  )));
                      //  currentScreen = AnnounceForm\();
                      Tab = 19;
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
                              color: Tab == 19
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
                              color: Tab == 19
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
                            currentScreen = Studentdispaly();
                            Tab = 1;
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
                                  Image.asset("assets/images/dashboard.png",
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
                                //   padding:
                                //      const EdgeInsets.only(right: 50),
                                child: Text(
                                  'لوحة المتابعة',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                      color: Tab == 1
                                          ? const Color(0xff0da6c2)
                                          : Colors.grey),
                                ),
                              )
                            ])),
                    SizedBox(
                      width: 10,
                    ),
                    /*MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => Nav_Afternoon(
                                        TabValue: 0,
                                        documentId: widget.documentId,
                                      )));
                          currentScreen = AdminHome();
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
                    ),*/
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
