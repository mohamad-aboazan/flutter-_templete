import 'package:flutter/material.dart';

import 'appColor.dart';

class MyTheme {
//!================ App Colors ====================
  static AppColor appColor = AppColor();
//!============ button text style =================
  static const TextStyle buttonsTextStyle =
      TextStyle(color: Colors.white, fontSize: 20);
  static const TextStyle hintTextStyle =
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey);
//!=============== Text styles ====================
  static const TextStyle textStyle_Bold_White_18 =
      TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white);
  static const TextStyle textStyle_Bold_Black_15 =
      TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black);
  static const TextStyle textStyle_Bold_Grey_15 =
      TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red);
  static const TextStyle textStyle_Bold_Green_15 =
      TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green);
  static const TextStyle textStyle_Bold_Black_16 =
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black);
  static const TextStyle textStyle_Bold_Primary =
      TextStyle(color: Color(0xffD65B8F), fontWeight: FontWeight.bold);
  static const TextStyle textStyle_Bold_Primary_20 = TextStyle(
      color: Color(0xffD65B8F), fontWeight: FontWeight.bold, fontSize: 20);
  static const TextStyle textStyle_Bold_Black_18 =
      TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold);
//!================== Icons =======================
  static const Widget warning = Icon(Icons.warning, color: Colors.yellow);
  static const Widget error = Icon(Icons.error, color: Colors.red);
  static const Widget success =
      Icon(Icons.check_circle_outlined, color: Colors.green);
//!================== snackbar ====================
  static Widget mySnackBar({Icon icon, String text, int seconds = 3}) {
    return SnackBar(
      duration: Duration(seconds: seconds),
      content: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            icon,
            SizedBox(width: 5),
            Text(text),
          ],
        ),
      ),
    );
  }
//!================== theme =======================

  static ThemeData myThemeData = ThemeData(
    primaryColor: appColor.primaryColor,
    accentColor: appColor.secoundaryColor,
    backgroundColor: appColor.red,
    selectedRowColor: appColor.primaryColor,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        primary: MyTheme.appColor.primaryColor,
      ),
    ),
    fontFamily: "EuclidCircular",
    // ================ Input Theme ===================
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: appColor.white,
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      labelStyle: TextStyle(color: appColor.black, fontSize: 18),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
    ),
    // ================ button Theme ===================
  );
}
