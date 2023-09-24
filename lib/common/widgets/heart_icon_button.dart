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
      child: Column(
        mainAxisSize: MainAxisSize.min, // Make sure the row takes the minimum required space
        children: [
          Icon(
            isLiked
                ? FluentSystemIcons.ic_fluent_heart_filled // Filled heart when liked
                : FluentSystemIcons.ic_fluent_heart_regular, // Regular heart when not liked
            size: 20,
            color: isLiked ? Colors.red : Colors.black, // Red when liked, black when not liked
          ),
          const SizedBox(width: 4), // Add some spacing between icon and text
          Text(
            isLiked ? 'Remove from Favorites' : 'Add to Favorites',
            style: TextStyle(
              color: isLiked ? Colors.red : Colors.black, // Match the color of the icon
              fontSize: 14, // You can adjust the font size as needed
            ),
          ),
        ],
      ),
    );
  }
}
