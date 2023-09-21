import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:ifit/common/utils/app_styles.dart';

class MoreIcon extends StatefulWidget {
  final List<String> options;
  final IconData? iconData;

  const MoreIcon({
    Key? key,
    required this.options,
    this.iconData, // Make iconData nullable
  }) : super(key: key);

  @override
  State<MoreIcon> createState() => _MoreIconState();
}

class _MoreIconState extends State<MoreIcon> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      child: widget.iconData != null // Check if iconData is provided
          ? Icon(
              widget.iconData, // Use the provided iconData parameter
              size: 20,
              color: Colors.black,
            )
          : Container(
              margin: const EdgeInsets.all(12),
              height: 30,
              width: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                FluentSystemIcons.ic_fluent_more_filled, // Use the default icon
                size: 20,
                color: Colors.black,
              ),
            ),
      onSelected: (String value) {
        // Handle the option tap here based on the selected value
      },
      itemBuilder: (BuildContext context) {
        return widget.options.map((option) {
          return PopupMenuItem<String>(
            value: option,
            child: Text(option, style: Styles.text2),
          );
        }).toList();
      },
    );
  }
}
