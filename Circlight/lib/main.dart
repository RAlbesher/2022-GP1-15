import 'package:circlight/Pages/Announcereq444.dart';
import 'package:circlight/Pages/DelegatorHome.dart';
import 'package:circlight/Pages/NavDelegator.dart';
import 'package:circlight/Pages/NavParent.dart';
import 'package:circlight/Pages/Nav_Afternoon.dart';
import 'package:circlight/Pages/ParentREQ.dart';
import 'package:circlight/Pages/Screens/welcome_screen.dart';
import 'package:circlight/Pages/UpdateStudent.dart';
import 'package:circlight/Pages/displayParent.dart';
import 'package:circlight/Pages/listAdmin.dart';
import 'package:circlight/Pages/listDel.dart';
//import 'package:circlight/Pages/ggggggg.dart';

//import 'package:circlight/page/home_page.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:circlight/Pages/firebase_options.dart';

// import 'Screens/Signup/RequestForm.dart';
// import 'Screens/Signup/components/RequestParent.dart';
import 'Pages/AdminPreviewRequest.dart';
import 'Pages/DashboardAfterNoon.dart';
import 'Pages/DelRequest.dart';
import 'Pages/UpdateParent.dart';
import 'Pages/firsttime_screen.dart';
import 'Pages/lisetDelegator.dart';
import 'Pages/ListReqAdmin.dart';
import 'Pages/ListRequest.dart';
import 'Pages/Nav.dart';
import 'Pages/RequestDoneAdmin.dart';
import 'flutter_flow/flutter_flow_util.dart';

Future main() async {
//start of firebase connection
  WidgetsFlutterBinding.ensureInitialized();
  /* ErrorWidget.builder = (FlutterErrorDetails details) => Center(
        child: CircularProgressIndicator(),
      );*/
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(LoginUiApp());

  //end firebase connection
}

class LoginUiApp extends StatelessWidget {
  Color _primaryColor = const Color(0xff0da6c2);
  Color _accentColor = const Color(0xff57d77a);

  // Design color
  // Color _primaryColor= HexColor('#FFC867');
  // Color _accentColor= HexColor('#FF3CBD');

  // Our Logo Color
  // Color _primaryColor= HexColor('#D44CF6');
  // Color _accentColor= HexColor('#5E18C8');

  // Our Logo Blue Color
  //Color _primaryColor= HexColor('#651BD2');
  //Color _accentColor= HexColor('#320181');

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // title: 'Flutter Login UI',
        title: 'Circlight',
        theme: ThemeData(
          fontFamily: 'Poppins',
          primaryColor: _primaryColor,
          accentColor: _accentColor,
          primarySwatch: Colors.grey,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              shape: const StadiumBorder(),
              maximumSize: const Size(double.infinity, 56),
              minimumSize: const Size(double.infinity, 56),
            ),
          ),
          textTheme: const TextTheme(
            titleLarge: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
            bodyLarge: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            bodyMedium: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            displayMedium: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
        home: //DelegatorHome(),
            //  ListDelegator()
            /*  Nav(
          TabValue: 0,
        )*/
            /*Nav(
          TabValue: 0,
        )*/

            //  AdminHome()
            //  DelegatorPending()
            //]  DelegatorStudent()
            // WelcomeScreen(),
            //  ListDelegator()
            //  ListRequest()
            /* DelegatorHome(
          user: "",
          userName: "",
        )*/
            /* HomePage2(
          TabValue: 0,
        )*/
            // ParentReqq()
            /*  PreviewReqAdmin(
          documentId: "uR7ugZqi8pLKPeBLkLFY",
        )*/
            //  ListRequest()
            /*  PreviewReqParent(
          documentId: "uR7ugZqi8pLKPeBLkLFY",
        )*/
            // ListDelegator()
            //   ListReqAdmin()

            /*  HomePage2(
        TabValue: 0,
        documentId: "",
      ),*/
            //ListRequest()
            //  ListReqAdmin()
            //     NavParent(
            //   TabValue: 3,
            // )
            //ParentReqq()
            //    Announcement()
            //  ParentReq()
            /*    HomePage2(
          TabValue: 0,
        )*/
            // UploadExample()
            //     RequestForm()
            //  NavDel(TabValue: 1),
            //    Delegatordisplay()
            // DelegatorPending()
            /*  NavParent(
        TabValue: 0,
      ),*/
            //  GeneralSearch(),
            //  CreateDelegator()
            // Paretdisplay()
            /*  NavDel(
          TabValue: 0,
        )*/
            /*   NavDel(
          TabValue: 0,
          user: "",
          userName: "",
        )*/
            /*  NavParent(
          TabValue: 0,
        )*/
            /* NavParent(
          TabValue: 0,
          // documentId: "ygLcTZpEaae4Si93R4aF",
        )*/
            //  ListRequest23()
            /*   NavDel(
          TabValue: 0,
        )*/
            //   DelegatorHome()
            /*   NavDel(
          TabValue: 0,
        )*/
            // DelegatorHome()
            /*  NavParent(
          TabValue: 0,
        )*/
            //  ListRequest23()
            //  Studentdispaly()
            // WelcomeScreen()
            //  ListDelegatorr4()
            // ListDelegatorx()
            /*  Nav(
          TabValue: 0,
        )*/

            //  WelcomeScreen()
            /* NavParent(
          TabValue: 0,
        )*/
            /* UpdateParent(
          documentId: "0Jr69j8ubnGz7zT4JDn0",
          whichpag: 0,
          Index: 0,
          Confirm: false,
          DropDown: false,
          TheValue: "",
        )*/
            /*  AdminPreviewRequest(
          documentId: "13XsR9UhMBxhmaopWhF5",
        )*/
            /*  Nav(
          TabValue: 0,
        )*/
            /*  Nav(
          TabValue: 0,
        )*/
            WelcomeScreen(
                //  TabValue: 0,
                )
        //  ListReqAdminn33()
        //FirstTimeScreen(userName: "",)
        /* PreviewReqParent(
          documentId: 'ygLcTZpEaae4Si93R4aF',
        )*/
        //   DelegatorStudent()
        /*    NavParent(
          TabValue: 0,
        )*/

        //ListRequest()
        // Createparent5(index: 0),
        // Delegatordisplay(),
        );
  }
}
