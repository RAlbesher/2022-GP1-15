import 'package:circlight/Pages/UpdateParent.dart';
import 'package:flutter/material.dart';
import 'package:circlight/Pages/Search.dart';
import 'package:circlight/Pages/Requests.dart';

import 'package:circlight/Pages/announcement.dart';
import 'package:circlight/Pages/AdminHome.dart';
import 'package:circlight/Pages/DashBoard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'CreateParent.dart';

import 'UpdateStudent.dart';
import 'displayParent.dart';
import 'displayStudent.dart';

import 'edit5.dart';

class Nav extends StatefulWidget {
  final int TabValue;
  final String documentId;

  const Nav({super.key, required this.TabValue, required this.documentId});

  @override
  State<Nav> createState() => _Nav();
}

class _Nav extends State<Nav> {
  SetTab() {
    setState(() {
      switch (widget.TabValue) {
        case 5:
          currentScreen = editparent5(
            documentId: widget.documentId,
            Confirm: false,
            Index: 1,
            TheValue: "",
            whichpag: 0,
          );
          Tab = 5;
          break;
        case 6:
          currentScreen = UpdateStudent(documentId: widget.documentId);
          Tab = 6;
          break;
        case 7:
          currentScreen = Createparent5(
            index: 1,
          );
          Tab = 7;
          break;
      }
    });
  }

  int _count = 0;
  int Tab = 0;
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Announcement();

  @override
  Widget build(BuildContext context) {
    final List<Widget> Screens = [
      Paretdisplay(),
      AdminHome(),
      Requests(),
      Studentdispaly(),
      Announcement(),
      UpdateParent(documentId: widget.documentId),
      UpdateStudent(documentId: widget.documentId)
    ];
    SetTab();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      bottomNavigationBar: SizedBox(
          height: 60,
          child: BottomAppBar(
              child: Container(
                  height: 50.0,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MaterialButton(
                              minWidth: 40,
                              onPressed: () {
                                setState(() {
                                  currentScreen = AdminHome();
                                  Tab = 0;
                                });
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Icon(
                                      Icons.home_outlined,
                                      color: Tab == 0
                                          ? Color(0xff42c98d)
                                          : Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    'الرئيسية',
                                    style: TextStyle(
                                        fontSize: 8,
                                        color: Tab == 0
                                            ? Color(0xff42c98d)
                                            : Colors.grey),
                                  )
                                  // Text
                                  // Column
                                ],
                              ),
                            ),
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
                                      Icon(
                                        Icons.space_dashboard_outlined,
                                        color: Tab == 1
                                            ? Color(0xff42c98d)
                                            : Colors.grey,
                                      ),
                                      Text(
                                        'لوحة المتابعة',
                                        style: TextStyle(
                                            fontSize: 8,
                                            color: Tab == 1
                                                ? Color(0xff42c98d)
                                                : Colors.grey),
                                      )
                                      // Text
                                      // Column
                                    ]))
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                                  Icon(
                                    Icons.search_outlined,
                                    color: Tab == 2
                                        ? Color(0xff42c98d)
                                        : Colors.grey,
                                  ),
                                  Text(
                                    'البحث',
                                    style: TextStyle(
                                        fontSize: 8,
                                        color: Tab == 2
                                            ? Color(0xff42c98d)
                                            : Colors.grey),
                                  )
                                  // Text
                                  // Column
                                ],
                              ),
                            ),
                            MaterialButton(
                                minWidth: 40,
                                onPressed: () {
                                  setState(() {
                                    currentScreen = Requests();
                                    Tab = 3;
                                  });
                                },
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.message_sharp,
                                        color: Tab == 3
                                            ? Color(0xff42c98d)
                                            : Colors.grey,
                                      ),
                                      Text(
                                        ' الطلبات ',
                                        style: TextStyle(
                                            fontSize: 8,
                                            color: Tab == 3
                                                ? Color(0xff42c98d)
                                                : Colors.grey),
                                      )
                                      // Text
                                      // Column
                                    ]))
                          ],
                        )
                      ])))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            currentScreen = Announcement();
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
          child: Icon(FontAwesomeIcons.microblog),
        ),
        backgroundColor: Colors.transparent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
