import 'package:circlight/Pages/Nav.dart';
import 'package:circlight/Pages/RequestDelegator.dart';
import 'package:circlight/Pages/Screens/welcome_screen.dart';
import 'package:circlight/flutter_flow/flutter_flow_icon_button.dart';
import 'package:circlight/flutter_flow/flutter_flow_theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'Delegator.dart';

class AdminHome extends StatefulWidget {
  AdminHome({
    Key? key,
  }) : super(key: key);

  // late String userId;

  @override
  _AdminHome createState() => _AdminHome();
}

class _AdminHome extends State<AdminHome> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  CollectionReference request =
      FirebaseFirestore.instance.collection('Student');
  CollectionReference Parent = FirebaseFirestore.instance.collection('Parent');
  List<String> docPname = [];
  List<String> StudentName = [];
  List<String> ParentName = [];
  List<String> ParentID = [];
  int CountStudent = -1;
  int SnapCount = 0;
  int ParentCount = -1;

  int count = 0;
  bool ShowRequest = false;
  RequestDelegator Req = new RequestDelegator(
      DName: "",
      Dusername: "",
      isAccepted: "false",
      isActive: "false",
      SID: "");
  var ID;
  TextEditingController NName = TextEditingController();
  CollectionReference NameSchool =
      FirebaseFirestore.instance.collection('Admin');
  var SchoolId = FirebaseAuth.instance.currentUser!.uid.toString();

  getSchoolName() async {
    print(".....................");
    await NameSchool.doc(SchoolId).get().then((value) {
      print("lllllllllllllllllllnnnnnnnnnnnnnn");
      print(NName.text);
      setState(() {
        NName..text = value["SchoolName"];
      });
    });
  }

  @override
  void initState() {
    getSchoolName();

    super.initState();
  }

  get userName => userName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xFFF1F4F8),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(0),
                          ),
                          child: Image.asset(
                            'assets/images/Screenshot_(497).png',
                            width: 421.3,
                            height: 200,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0, -0.71),
                        child: Stack(
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0, 0.01),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 10, 16, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(""),

                                        // InkWell(
                                        //     onTap: () {
                                        //       Navigator.push(
                                        //         context,
                                        //         CupertinoPageRoute(
                                        //           builder: (context) {
                                        //             return SelectUserRoleScreen();
                                        //           },
                                        //         ),
                                        //       );
                                        //     },
                                        //     child: Image.asset(
                                        //       'assets/images/turn-off.png',
                                        //       height: 30,
                                        //       width: 45,
                                        //     )),
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                CupertinoPageRoute(
                                                    builder: (context) => Nav(
                                                          documentId:
                                                              FirebaseAuth
                                                                  .instance
                                                                  .currentUser!
                                                                  .uid
                                                                  .toString(),
                                                          TabValue: 25,
                                                          Confirm: false,
                                                          TheValue: "",
                                                          whichpag: 0,
                                                          DropDown: false,
                                                          index: 0,
                                                        )));
                                          },
                                          child: Container(
                                            width: 45,
                                            height: 45,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.asset(
                                              'assets/images/userAvatar.png',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24, 16, 16, 0),
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(3.86, 0.74),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    2, 0, 6, 0),
                                            child: Text(
                                              NName.text,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .title1
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color:
                                                        const Color(0xFF11AAB8),
                                                    fontSize: 32,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5, 0, 6, 0),
                                            child: Text(
                                              'مرحبا',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .title1
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: Colors.white,
                                                        fontSize: 32,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 10, 20, 12),
                                    child: Container(
                                      width: double.infinity,
                                      height: 120,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 4,
                                            color: Color(0x34090F13),
                                            offset: Offset(0, 2),
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 0, 12, 8),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                "تمثل سلامة وراحة الأطفال في المدرسة مسؤولية مشتركة يجب أن نتحملها جميعاً"),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.98, -0.77),
                                              child: Image.asset(
                                                'assets/icons/Circlight.png',
                                                width: 115,
                                                height: 100,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Align(
                                                //    algnment: AlignmentDirectional(
                                                //       0.30, -0.1),

                                                ),
                                            /* Expanded(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.98, -0.77),
                                                    child: Text(
                                                      'تمثل سلامة وراحة الأطفال في المدرسة مسؤولية مشتركة يجب أن نتحملها جميعاً.',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText2
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: Color(
                                                                    0xFF57636C),
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),*/
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 7,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10, left: 20, right: 20, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "إدارة الحسـابـات",
                          style: const TextStyle(
                            color: Color.fromRGBO(67, 171, 186, 1),
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(.1),
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
                                "assets/icons/parent.png",
                                height: 120.0,
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => Nav(
                                              TabValue: 10,
                                              Name: "",
                                              username: "",
                                              Blood: "",
                                              Class: "",
                                              ID: "",
                                              Realtion: "",
                                              documentId: "",
                                              email: "",
                                            )));
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
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(.1),
                              blurRadius: 4.0,
                              spreadRadius: .05,
                            ), //BoxShadow
                          ],
                        ),
                        child: Container(
                          child: Align(
                            child: GestureDetector(
                              child: Image.asset(
                                'assets/icons/student_icon.png',
                                height: 120.0,
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => Nav(
                                              TabValue: 11,
                                              documentId: "",
                                              Blood: "",
                                              Confirm: "",
                                              TheValue: "",
                                              header: "",
                                            )));
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future GetNames(snap) async {
    List<String> StudentID = [];

    try {
      for (var i = 0; snap[i] != null; i++) {
        SnapCount += 1;
        StudentID.add(snap[i]["StudentID"]);
      }
    } catch (error) {
      //   print("error");
    }
    //print("SnapppppppppppppppppppppppppppppppCount");
    print(SnapCount);
    for (var j = 0; j < StudentID.length; j++) {
      await request.doc(StudentID[j]).get().then((value) {
        //StudentName.add(value.get('Name'));
        //   print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
        //   print("StID");
        //   print(StudentID[j]);

        //  print(StudentName[0]);
        // Access your after your get the data
        count = 1;

        StudentName.add(value["Name"]);
        ParentID.add(value["ParentId"]);
        //  print(value["ParentId"]);

        //  print("Starteddd");
        for (var i = 0; i < StudentName.length; i++) {
          //    print("*******************************************");
          print(StudentName[i]);
        }
      });
    }
//--------------------------------
    //  print("........................................................");
    //  print(ParentID.length);
    for (var j = 0; j < ParentID.length; j++) {
      //   print(ParentID[j]);
      await Parent.doc(ParentID[j]).get().then((value) {
        //StudentName.add(value.get('Name'));

        //    print("pID");
        //   print(ParentID[j]);

        //  print(StudentName[0]);
        // Access your after your get the data
        count = 1;

        ParentName.add(value["Name"]);
        //   print("=============================================");
        //  print(value["Name"]);
        //   print("Starteddd");
      });
    }

    // print(StudentName[0]);
  }

  Widget DialogAccepted(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      title: const Text(' طلب تفويض',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold)),
      content: const Text("تم قبول طلب التفويض بنجاح",
          textAlign: TextAlign.center,
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pop(
              context,
            );
          },
          child: const Text('موافق',
              style: TextStyle(
                  color: const Color(0xff0da6c2), fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }

  Widget CreateDialog3(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      title: const Text('حذف الطلب',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold)),
      content: const Text('هل انت متأكد انك تريد طلب التفويض هذا؟',
          textAlign: TextAlign.center,
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pop(
              context,
            );
          },
          child: const Text('إلغاء',
              style:
                  TextStyle(color: Colors.grey, fontWeight: FontWeight.w400)),
        ),
        TextButton(
            onPressed: () {
              Navigator.pop(context);

              Req.DeleteRequests(ID);
            },
            child: const Text("موافق",
                style: TextStyle(
                    color: const Color(0xFF11AAB8),
                    fontWeight: FontWeight.w600))),
      ],
    );
  }
}
