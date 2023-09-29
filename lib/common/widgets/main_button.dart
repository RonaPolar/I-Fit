import 'package:flutter/material.dart';
import 'package:ifit/common/utils/app_styles.dart';

class MainButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final TextStyle? textStyle; // Add a TextStyle parameter
  final Color? buttonColor;

  const MainButton({
    Key? key, // Change super.key to Key key
    required this.title,
    required this.onPressed,
    this.textStyle, // Allow customization of text style
    this.buttonColor, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height: 50,
      color: buttonColor ?? Styles.primaryColor, // Custom button color
      textColor: Styles.bgColor,
      minWidth: double.maxFinite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25), // Custom button shape
      ),
      child: Text(
        title, // Use the 'title' variable
        style: textStyle ?? Styles.mainButtonText.copyWith(color: Styles.bgColor), // Use the provided textStyle or the default style
      ),
    );
  }
}
