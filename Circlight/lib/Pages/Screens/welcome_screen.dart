import 'package:circlight/Pages/Screens/login_screen.dart';
import 'package:circlight/Pages/Screens/signup_screen.dart';
import 'package:flutter/material.dart';

import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_widgets.dart';
import '../Widgets/background_widget.dart';
import '../Widgets/welcome_image.dart';

class WelcomeScreen extends StatelessWidget {
  // String admin = "Admin";
  // String parent = "Parent";
  // String delegator = "Delegator";

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const WelcomeImage(),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(22, 4, 22, 16),
                child: FFButtonWidget(
                  onPressed: () {
                    goToSignInScreen(context);
                  },
                  text: 'تسجيل الدخول',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 50,
                    color: const Color(0xFF11AAB8),
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Outfit',
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(22, 4, 22, 16),
                child: FFButtonWidget(
                  onPressed: () {
                    goToSignInScreenForDelegator(context);
                  },
                  text: "إنشاء حساب كمفوض",
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 50,
                    color: const Color(0xFF11AAB8),
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Outfit',
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              // Text("A"),
              // Text("B"),
              // Text("C"),
            ]),
          ),
        ),
      ),
    );
  }
}

void goToSignInScreenForDelegator(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SignUpScreen()),
  );
}

void goToSignInScreen(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => LoginScreen()),
  );
}
