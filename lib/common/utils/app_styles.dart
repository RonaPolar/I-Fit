import 'package:flutter/material.dart';

Color primary = const Color.fromARGB(255, 139, 0, 0);

class Styles {
  static Color primaryColor = primary;
  static Color secondColor = const Color.fromRGBO(255, 0, 0, 72);
  static List<Color> gradientColor = [const Color.fromRGBO(255, 0, 0, 72).withOpacity(0.5), const Color.fromRGBO(255, 0, 0, 72)];
  
  static Color bgColor = const Color(0xFFFFFFFF);
  static Color textColor = const Color(0xFF000000);
  static Color fadeTextColor = Colors.black54;
  static Color boxtextField = const Color(0xFFEEEEEE);

  static TextStyle normal = TextStyle(fontSize: 14, color: fadeTextColor,fontWeight: FontWeight.normal);
  static TextStyle text12 = TextStyle(fontFamily: 'Raleway', fontSize: 12, color: textColor,fontWeight: FontWeight.normal);
  static TextStyle text15normal = TextStyle(fontFamily: 'Raleway', fontSize: 15, color: textColor,fontWeight: FontWeight.normal);
  static TextStyle text15bold = TextStyle(fontFamily: 'Raleway', fontSize: 15, color: textColor,fontWeight: FontWeight.bold);
  static TextStyle text18 = TextStyle(fontFamily: 'Raleway', fontSize: 18, color: textColor,fontWeight: FontWeight.normal);
  static TextStyle title = TextStyle(fontFamily: 'Raleway', fontSize: 18, color: textColor,fontWeight: FontWeight.bold);
  static TextStyle seeMore = TextStyle(fontFamily: 'Raleway', fontSize: 14, color: fadeTextColor,fontWeight: FontWeight.bold);

  static TextStyle mainButtonText = TextStyle(fontFamily: 'Raleway', fontSize: 22, color: textColor,fontWeight: FontWeight.bold);
  static TextStyle headline20 = TextStyle(fontFamily: 'Raleway', fontSize: 20, color: textColor,fontWeight: FontWeight.bold);
  static TextStyle headline25 = TextStyle(fontFamily: 'Raleway', fontSize: 25, color: textColor,fontWeight: FontWeight.bold);
  static TextStyle headlineBig = TextStyle(fontFamily: 'RobotoMono', fontSize: 30, color: textColor,fontWeight: FontWeight.bold);
}
