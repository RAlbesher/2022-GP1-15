import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

import 'Nav_Afternoon.dart';

class DashboardAfterNoon extends StatefulWidget {
  const DashboardAfterNoon({Key? key}) : super(key: key);

  @override
  _DashboardAfterNoon createState() => _DashboardAfterNoon();
}

class _DashboardAfterNoon extends State<DashboardAfterNoon>
    with TickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        elevation: 1.5,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: _iconColorTween.value,
        ),
        automaticallyImplyLeading: false,
        title: Text(
          "قائمه طلبات اولياء الأمور",
          textAlign: TextAlign.start,
          style: TextStyle(color: _iconColorTween.value),
        ),
        centerTitle: true,
        actions: [],
        titleSpacing: 0.0,
      ),*/
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: SingleChildScrollView(
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
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 16,
                                                          color: Color.fromARGB(
                                                              255,
                                                              222,
                                                              58,
                                                              47)),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  CupertinoPageRoute(
                                                      builder: (context) =>
                                                          Nav_Afternoon(
                                                            TabValue: 2,
                                                            documentId:
                                                                FirebaseAuth
                                                                    .instance
                                                                    .currentUser!
                                                                    .uid
                                                                    .toString(),
                                                            Confirm: 0,
                                                            DropDown: 0,
                                                            TheValue: "",
                                                            index: 0,
                                                            whichpag: 0,
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
                                            "لوحة المتابعة",
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

                ///
                ///
                ///
                ///
                ///
                //
              ]),
        ),
      ),
    );
  }
}
