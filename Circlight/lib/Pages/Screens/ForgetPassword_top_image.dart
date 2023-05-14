import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';
import 'package:circlight/Pages/Nav.dart';
import 'package:flutter/cupertino.dart';

class ForgetPassword_top_image extends StatelessWidget {
  const ForgetPassword_top_image({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        color: Colors.red,
        child: Column(
          children: [
            Row(children: <Widget>[
              Container(
                  child: Align(
                alignment: AlignmentDirectional(1.01, -12.99),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 16,
                      ),
                      color: Colors.white,
                    ),
                    Align(
                      alignment: AlignmentDirectional(1.01, 0),
                      child: Container(
                        padding: const EdgeInsets.only(right: 50),
                        child: Text(
                          "   إعادة تعيين كلمة المرور",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 0,
                    ),
                  ],
                ),
              )),
            ]),
            ////////////////////////////
            Text(
              "".toUpperCase(),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: defaultPadding),
            Row(
              children: [
                const Spacer(),
                Expanded(
                  flex: 2,
                  child: Image.asset("assets/icons/circlight_icon_500.png"),
                ),
                const Spacer(),
              ],
            ),
            //SizedBox(height: defaultPadding),
          ],
        ));
  }
}
