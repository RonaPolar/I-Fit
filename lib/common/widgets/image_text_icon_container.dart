import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';

class ImageTextIcon extends StatefulWidget {
  final String title;
  final String text;
  final ImageProvider imageProvider;
  final VoidCallback onTap;
  final IconData customIcon;

  const ImageTextIcon({super.key, 
    required this.title,
    required this.text, 
    required this.imageProvider, 
    required this.onTap,
    this.customIcon = FluentSystemIcons.ic_fluent_chevron_right_filled});

  @override
  State<ImageTextIcon> createState() => _ImageTextIconState();
}

class _ImageTextIconState extends State<ImageTextIcon> {
   @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 15, horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(color: Colors.black26, blurRadius: 2)
        ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Image
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: widget.imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Gap(5),
            // Title and Text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(5), // Space between title and text
                  Text(
                    widget.text,
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            // Custom Icon (Default is Chevron Right)
            Icon(
              widget.customIcon,
              color: Styles.secondColor,
            ),
          ],
        ),
      ),
    );
  }
}