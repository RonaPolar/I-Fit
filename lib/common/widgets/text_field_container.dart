import 'package:flutter/material.dart';
import 'package:ifit/common/utils/app_styles.dart';

class TextfieldContainer extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String hitText;
  final IconData? icon;
  final String? imagePath;
  final Widget? rightIcon;
  final bool obscureText;
  final EdgeInsets? margin;

  const TextfieldContainer({
    Key? key,
    required this.hitText,
    this.icon,
    this.rightIcon,
    required this.obscureText,
    this.margin,
    this.controller,
    this.keyboardType, this.imagePath,
  }) : super(key: key);

  @override
  State<TextfieldContainer> createState() => _TextfieldContainerState();
}

class _TextfieldContainerState extends State<TextfieldContainer> {
  @override
  Widget build(BuildContext context) {
    Widget? prefixIcon;
    if (widget.icon != null) {
      prefixIcon = Icon(widget.icon);
    } else if (widget.imagePath != null) {
      prefixIcon = Image.asset(widget.imagePath!, scale: 10, fit: BoxFit.scaleDown);
    }

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
          prefixIcon: prefixIcon,
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


class DisplayTextContainer extends StatefulWidget {
  final String hitText;
  final IconData icon;
  final Widget? rightIcon;
  final EdgeInsets? margin;

  const DisplayTextContainer({
    Key? key,
    required this.hitText,
    required this.icon,
    this.rightIcon,
    this.margin, required bool obscureText,
  }) : super(key: key);

  @override
  State<DisplayTextContainer> createState() => _DisplayTextContainerState();
}

class _DisplayTextContainerState extends State<DisplayTextContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Styles.boxtextField,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          Icon(widget.icon, color: Styles.fadeTextColor),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              widget.hitText,
              style: TextStyle(
                fontSize: 16,
                color: Styles.fadeTextColor,
              ),
            ),
          ),
          if (widget.rightIcon != null) widget.rightIcon!,
        ],
      ),
    );
  }
}





class BigTextField extends StatefulWidget {
  final String hintText;

  const BigTextField({super.key, this.hintText = 'Input Message'});

  @override
  State<BigTextField> createState() => _BigTextFieldState();
}

class _BigTextFieldState extends State<BigTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Styles.boxtextField,
        borderRadius: BorderRadius.circular(15),
      ),
      child: SingleChildScrollView(
        child: TextField(
          maxLines: null,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(5),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: Styles.fadeTextColor,
            ),
          ),
        ),
      ),
    );
  }
}