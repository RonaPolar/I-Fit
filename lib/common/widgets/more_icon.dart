import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:ifit/common/utils/app_styles.dart';

class MoreIcon extends StatefulWidget {
  final List<String> options;
  final IconData iconData;

  const MoreIcon({
    Key? key,
    required this.options,
    this.iconData = FluentSystemIcons.ic_fluent_more_filled,
  }) : super(key: key);

  @override
  State<MoreIcon> createState() => _MoreIconState();
}

class _MoreIconState extends State<MoreIcon> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      child: widget.iconData == FluentSystemIcons.ic_fluent_more_filled
          ? Container(
              margin: const EdgeInsets.all(12),
              height: 30,
              width: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                widget.iconData, // Use the provided iconData parameter
                size: 20,
                color: Colors.black,
              ),
            )
          : Icon(
              widget.iconData, // Use the provided iconData parameter
              size: 20,
              color: Colors.black,
            ),
      onSelected: (String value) {
        // Handle the option tap here based on the selected value
      },
      itemBuilder: (BuildContext context) {
        return widget.options.map((option) {
          return PopupMenuItem<String>(
            value: option,
            child: Text(option,
            style: Styles.text2),
          );
        }).toList();
      },
    );
  }
}
