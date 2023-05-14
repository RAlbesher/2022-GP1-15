import 'package:circlight/Pages/Nav_Afternoon.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:circlight/Pages/Admin.dart';
import 'package:circlight/Pages/Nav.dart';
import 'package:get/get.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../models/user_data.dart';
import 'ViewStudentProfile-GeneralSearch.dart';
import 'ViewStudentprofileAfternoonshift.dart';

class AfternoonshiftGeneralSearch extends StatefulWidget {
  const AfternoonshiftGeneralSearch({Key? key}) : super(key: key);

  @override
  State<AfternoonshiftGeneralSearch> createState() =>
      _AfternoonshiftGeneralSearch();
}

class _AfternoonshiftGeneralSearch extends State<AfternoonshiftGeneralSearch>
    with TickerProviderStateMixin {
  String? searchname;
  List<StudentModel> users = [];
  TextEditingController search = TextEditingController();
  bool isLoading = false;
  bool isfound = false;
  int num = 0;
  late AnimationController _ColorAnimationController;
  late AnimationController _TextAnimationController;
  late Animation _colorTween, _iconColorTween, _icon2ColorTween;
  late Animation<Offset> _transTween;
  late TabController _tabController;
  @override
  void initState() {
    showUsers();
    super.initState();
    print("init cal");
    _ColorAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 0));
    _colorTween = ColorTween(begin: Colors.transparent, end: Colors.white)
        .animate(_ColorAnimationController);
    _iconColorTween = ColorTween(begin: Colors.grey, end: Colors.grey)
        .animate(_ColorAnimationController);
    _icon2ColorTween =
        ColorTween(begin: Colors.white, end: const Color(0xff42c98d))
            .animate(_ColorAnimationController);

    _TextAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 0));

    _transTween = Tween(begin: Offset(-10, 40), end: Offset(-10, 0))
        .animate(_TextAnimationController);
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  showUsers() {
    try {
      users.clear();
      setState(() {});
      FirebaseFirestore.instance
          .collection("Student")
          .snapshots()
          .listen((event) {
        users.clear();
        setState(() {});
        for (int i = 0; i < event.docs.length; i++) {
          StudentModel dataModel = StudentModel.fromJson(event.docs[i].data());
          users.add(dataModel);
          print(
            users[i].Name.toString(),
          );
        }
        setState(() {});
      });
      setState(() {});
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    //double _headerHeight = 150;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
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
                            bottomLeft: Radius.circular(35),
                            bottomRight: Radius.circular(35),
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(0),
                          ),
                          child: Image.asset(
                            'assets/images/CirclightHeader.png',
                            width: 500.3,
                            height: 85,
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
                                        30, 36, 23, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            " ",
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 16,
                                                    color: Color.fromARGB(
                                                        255, 222, 58, 47)),
                                          ),
                                        ),

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
                                                    builder: (context) =>
                                                        Nav_Afternoon(
                                                          documentId:
                                                              FirebaseAuth
                                                                  .instance
                                                                  .currentUser!
                                                                  .uid
                                                                  .toString(),
                                                          TabValue: 3,
                                                          Confirm: false,
                                                          TheValue: "",
                                                          whichpag: 0,
                                                          DropDown: false,
                                                          index: 0,
                                                        )));
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
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
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
                                        50, 40, 0, 6),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "قائمة الطلاب",
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white),
                                        ),
                                      ],
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
                height: 20,
              ),
              Container(
                height: 40,
                width: 370,
                //height: 230,
                padding: EdgeInsets.only(right: 5, top: 0, left: 5),
                child: Padding(
                  padding: EdgeInsets.only(right: 5, top: 0, left: 5),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        search = search;
                        isfound = false;
                        num = 0;
                      });
                    },
                    textAlign: TextAlign.right,
                    controller: search,
                    decoration: InputDecoration(
                        hintText: "..بحث",
                        hintStyle: TextStyle(color: Colors.grey.shade600),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey.shade400,
                          size: 20,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.all(8),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                BorderSide(color: Colors.grey.shade300)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                BorderSide(color: Colors.grey.shade300))),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              isLoading
                  ? Center(child: CircularProgressIndicator())
                  : Expanded(
                      child: ListView.builder(
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: users.length,
                          itemBuilder: (context, index) {
                            if (users[index]
                                .Name!
                                .contains(search.text.toLowerCase())) {
                              isfound = true;
                              num = 1;
                              return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) => Nav_Afternoon(
                                                  TabValue: 27,
                                                  users: users,
                                                  currentIndex: index,
                                                )));
                                  },
                                  child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 5, 5, 5),
                                      child: Container(
                                          width: 367.6,
                                          height: 58.3,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 4,
                                                color: Color(0x33000000),
                                                offset: Offset(0, 2),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Stack(
                                              /* mainAxisAlignment:
                                                  MainAxisAlignment.start,*/
                                              alignment: Alignment.center,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 20, 0, 70),
                                                      child: Icon(
                                                        Icons
                                                            .chevron_left_rounded,
                                                        color:
                                                            Color(0xFF57636C),
                                                        size: 20,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.94, 0.08),
                                                  child: Container(
                                                    width: 3,
                                                    height: 42,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFF29294D),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                  ),
                                                ), //to only show the allowed people to admin
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.77, -0.59),
                                                  child: Text(
                                                    users[index]
                                                        .Name
                                                        .toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              Color(0xFF101213),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ),
                                              ]))));
                            } else {
                              if (num == 0) {
                                num = 1;
                                return Center(
                                  child: Container(
                                      child: Text('لا يوجد اسم مطابق')),
                                );
                              }
                              return Container();
                            }
                          }),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
