import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'CreateParent.dart';

import 'CreateStudent.dart';

import 'base_screen.dart';
import 'displayParent.dart';
import 'displayStudent.dart';

import 'edit5.dart';
import 'editStudent.dart';

class Nav extends StatefulWidget {
  final int TabValue;
  final documentId;
  final index;
  final Realtion;
  final Name;
  final username;
  final email;
  final ID;
  final Confirm;
  final nationality;
  final phone1;
  final phone2;
  final job;
  final SID;
  final Blood;
  final Class;
  final TheValue;
  final whichpag;
  final DropDown;
  final header;
  const Nav(
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
  State<Nav> createState() => _Nav();
}

class _Nav extends State<Nav> {
  SetTab() {
    setState(() {
      switch (widget.TabValue) {
        case 0:
          currentScreen = BaseScreen();
          Tab = 0;
          break;
        case 5:
          currentScreen = editparent5(
            documentId: widget.documentId,
            Confirm: false,
            Index: widget.index,
            TheValue: widget.TheValue,
            whichpag: widget.whichpag,
            DropDown: false,
          );
          Tab = 5;
          break;
        case 6:
          //  currentScreen = UpdateStudent(documentId: widget.documentId);
          Tab = 6;
          break;
        case 7:
          currentScreen = Createparent5(
            index: widget.index,
            Name: widget.Name,
            username: widget.username,
            email: widget.email,
            phone1: widget.phone1,
            phone2: widget.phone2,
            Realtion: widget.Realtion,
            header: widget.header,
            nationality: widget.nationality,
          );
          Tab = 7;
          break;
        case 8:
          currentScreen = CreateStudent(
            documentId: widget.documentId,
            index: widget.index,
            Name: widget.Name,
            username: widget.username,
            header: widget.header,
            nationality: widget.nationality,
          );
          Tab = 8;
          break;
        case 9:
          currentScreen = EditStudent(
            documentId: widget.documentId,
            DropDown: false,
            Confirm: false,
            Index: widget.index,
            TheValue: widget.TheValue,
            whichpag: widget.whichpag,
          );
          Tab = 9;
          break;
        case 10:
          currentScreen = Paretdisplay();
          Tab = 10;
          break;
        case 11:
          currentScreen = Studentdispaly();
          Tab = 11;
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
      backgroundColor: Color.fromRGBO(252, 253, 255, 1),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          //  currentScreen = Requests();
                          Tab = 3;
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
                                  color: Tab == 3
                                      ? Color(0xff42c98d)
                                      : Color.fromARGB(255, 167, 166, 166)),
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
                                  color: Tab == 3
                                      ? Color(0xff42c98d)
                                      : Colors.grey),
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
                          currentScreen = Paretdisplay();
                          Tab = 2;
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
                              Image.asset("assets/images/search.png",
                                  width: 25,
                                  height: 25,
                                  color: Tab == 2
                                      ? Color(0xff42c98d)
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
                                  color: Tab == 2
                                      ? Color(0xff42c98d)
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
                                          ? Color(0xff42c98d)
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
                                          ? Color(0xff42c98d)
                                          : Colors.grey),
                                ),
                              )
                            ])),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => Nav(
                                        TabValue: 0,
                                        documentId: widget.documentId,
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
                                      ? Color(0xff42c98d)
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
                                      ? Color(0xff42c98d)
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Stack(
        children: [
          Positioned(
            right: 10,
            left: 10,
            bottom: 30,
            child: Align(
              alignment: Alignment(0, 0.92),
              child: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    //  currentScreen = Announcement();
                    Tab = 4;
                  });
                },
                elevation: 0,
                child: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 6,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(90),
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xff0da6c2),
                          const Color(0xff42c98d),
                          const Color(0xff57d77a)
                        ],
                      ),
                    ),
                    child: Align(
                      alignment: Alignment(0.30, -0.10),
                      child: new Wrap(
                        children: [
                          Column(children: [
                            SizedBox(
                              height: 11,
                            ),
                            Image.asset(
                              "assets/images/announ.png",
                              width: 35,
                              height: 35,
                              color: Tab == 4
                                  ? Color(0xff42c98d)
                                  : Color.fromARGB(255, 255, 254, 254),
                            ),
                            SizedBox(
                              height: 17,
                            ),
                            Text(
                              'الرئيسية',
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: Tab == 4
                                      ? Color(0xff42c98d)
                                      : Colors.grey),
                            ),
                          ]),
                        ],
                      ),
                    )),
                backgroundColor: Colors.transparent,
              ),
            ),
          )
        ],
      ),
      //   floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
