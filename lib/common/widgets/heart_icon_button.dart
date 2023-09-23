import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';

class HeartIconButton extends StatefulWidget {
  const HeartIconButton({super.key});

  @override
  State<HeartIconButton> createState() => _HeartIconButtonState();
}

class _HeartIconButtonState extends State<HeartIconButton> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        setState(() {
          isLiked = !isLiked; // Toggle the like state
        });
      },
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero, 
      ),
      child: Icon(
        isLiked
            ? FluentSystemIcons.ic_fluent_heart_filled // Filled heart when liked
            : FluentSystemIcons.ic_fluent_heart_regular, // Regular heart when not liked
        size: 20,
        color: isLiked ? Colors.red : Colors.black, // Red when liked, black when not liked
      ),
    );
  }
}