//import 'package:education_app/constants/color.dart';
//import 'package:education_app/constants/icons.dart';
//import 'package:education_app/constants/size.dart';
//import 'package:education_app/screens/featuerd_screen.dart';
import 'package:circlight/Pages/featuerd_screen.dart';
import 'package:flutter/material.dart';

import 'featured_screenAfternoon.dart';

class BaseScreenAfternoon extends StatefulWidget {
  const BaseScreenAfternoon({Key? key}) : super(key: key);

  @override
  _BaseScreenAfternoonState createState() => _BaseScreenAfternoonState();
}

class _BaseScreenAfternoonState extends State<BaseScreenAfternoon> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    FeaturedScreenAfternoon(),
    FeaturedScreenAfternoon(),
    FeaturedScreenAfternoon(),
    FeaturedScreenAfternoon(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(252, 253, 255, 1),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),

      //bottomNavigationBar: BottomNavigationBar(
      // type: BottomNavigationBarType.fixed,
      //selectedItemColor: kPrimaryColor,

      //elevation: 0,

      // items: [
      //   BottomNavigationBarItem(
      //     activeIcon: Image.asset(
      //       icFeatured,
      //       height: kBottomNavigationBarItemSize,
      //     ),
      //     icon: Image.asset(
      //       icFeaturedOutlined,
      //       height: kBottomNavigationBarItemSize,
      //     ),
      //     label: "Featured",
      //   ),
      //   BottomNavigationBarItem(
      //     activeIcon: Image.asset(
      //       icLearning,
      //       height: kBottomNavigationBarItemSize,
      //     ),
      //     icon: Image.asset(
      //       icLearningOutlined,
      //       height: kBottomNavigationBarItemSize,
      //     ),
      //     label: "My Learning",
      //   ),
      //   BottomNavigationBarItem(
      //     activeIcon: Image.asset(
      //       icWishlist,
      //       height: kBottomNavigationBarItemSize,
      //     ),
      //     icon: Image.asset(
      //       icWishlistOutlined,
      //       height: kBottomNavigationBarItemSize,
      //     ),
      //     label: "Wishlist",
      //   ),
      //   BottomNavigationBarItem(
      //     activeIcon: Image.asset(
      //       icSetting,
      //       height: kBottomNavigationBarItemSize,
      //     ),
      //     icon: Image.asset(
      //       icSettingOutlined,
      //       height: kBottomNavigationBarItemSize,
      //     ),
      //     label: "Settings",
      //   ),
      // ],
      //currentIndex: _selectedIndex,
      //onTap: (int index) {
      //setState(() {
      //_selectedIndex = index;
      //});
      //}),
    );
  }
}
