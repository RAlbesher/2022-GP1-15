import 'package:circlight/Pages/ParentHome.dart';
import 'package:flutter/material.dart';
import 'package:circlight/constants.dart';
import 'package:circlight/responsive.dart';
import '../../components/background.dart';
import '../Widgets/sign_up_top_image.dart';
import 'ForgetPassword_top_image.dart';
import 'Forget_Password.dart';

class ForgetPassword_Button extends StatelessWidget {
  const ForgetPassword_Button({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: const MobileSignupScreen(),
          desktop: Row(
            children: [
              /* const Expanded(
                child: ForgetPassword_top_image(),
              ),*/
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(
                      width: 450,
                      child: ForgetPassword(),
                    ),
                    SizedBox(height: defaultPadding / 2),
                    // SocalSignUp()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MobileSignupScreen extends StatelessWidget {
  const MobileSignupScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        //  const ForgetPassword_top_image(),
        Row(
          children: const [
            // Spacer(),
            Expanded(
              //  flex: 8,
              child: ForgetPassword(),
            ),
            //  Spacer(),
          ],
        ),
        // const SocalSignUp()
      ],
    );
  }
}
