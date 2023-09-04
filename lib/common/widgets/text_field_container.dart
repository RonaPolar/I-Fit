import 'package:flutter/material.dart';
import 'package:ifit/common/utils/app_styles.dart';

class TextfieldContainer extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String hitText;
  final IconData icon;
  final Widget? rightIcon;
  final bool obscureText;
  final EdgeInsets? margin;

  const TextfieldContainer({
    Key? key, // Change super.key to Key key
    required this.hitText,
    required this.icon,
    this.rightIcon,
    required this.obscureText,
    this.margin,
    this.controller,
    this.keyboardType,
  }) : super(key: key);

  @override
  State<TextfieldContainer> createState() => _TextfieldContainerState();
}

class _TextfieldContainerState extends State<TextfieldContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Styles.boxtextField,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 15),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          prefixIcon: Icon(widget.icon),
          suffixIcon: widget.rightIcon,
          hintText: widget.hitText,
          hintStyle: TextStyle(
            color: Styles.fadeTextColor,
          ),
        ),
      ),
    );
  }
}
