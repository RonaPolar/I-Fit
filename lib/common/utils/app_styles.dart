import 'package:flutter/material.dart';

Color primary = const Color.fromARGB(255, 139, 0, 0);

class Styles {
  static Color primaryColor = primary;
  static Color secondColor = const Color.fromRGBO(255, 0, 0, 72);
  static Color bgColor = const Color(0xFFFFFFFF);
  static Color textColor = const Color(0xFF000000);
  static Color fadeTextColor = const Color(0xFF9E9E9E);
  static Color boxtextField = const Color(0xFFEEEEEE);

  static TextStyle text = TextStyle(fontFamily: 'Raleway', fontSize: 10, color: textColor,fontWeight: FontWeight.normal);
  static TextStyle text2 = TextStyle(fontFamily: 'Raleway', fontSize: 15, color: textColor,fontWeight: FontWeight.normal);
  static TextStyle textStyle = TextStyle(fontFamily: 'Raleway', fontSize: 18, color: textColor,fontWeight: FontWeight.normal);

  static TextStyle buttonText = TextStyle(fontFamily: 'Raleway', fontSize: 22, color: textColor,fontWeight: FontWeight.bold);
  static TextStyle headlineSmall = TextStyle(fontFamily: 'Raleway', fontSize: 20, color: textColor,fontWeight: FontWeight.bold);
  static TextStyle headline = TextStyle(fontFamily: 'Raleway', fontSize: 25, color: textColor,fontWeight: FontWeight.bold);
  static TextStyle headlineBig = TextStyle(fontFamily: 'RobotoMono', fontSize: 30, color: textColor,fontWeight: FontWeight.bold);
}
