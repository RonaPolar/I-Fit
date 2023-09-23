import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';

class NextNavigation extends StatelessWidget {
  final String title;
  final TextStyle? titleTextStyle;
  final IconData? iconData;
  final VoidCallback onTap;
  final IconData? leftIcon; // Change the type to Widget?
  final Color? nextIconColor;

  const NextNavigation({
    Key? key,
    required this.title,
    this.titleTextStyle,
    this.iconData,
    required this.onTap,
    this.leftIcon,
    this.nextIconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (iconData != null) ...[
            Icon(
              iconData,
            ),
            const Gap(10), // Add some spacing between icon and text
          ],
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: titleTextStyle ??
                    Styles.textStyle.copyWith(
                      color: Colors.black,
                      fontSize: 16
                     ),
                ),
                Icon(
                  leftIcon ?? Icons.navigate_next,
                  color: nextIconColor ?? Colors.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class IconText extends StatelessWidget {
  final String title;
  final TextStyle? titleTextStyle;
  final IconData? iconData;
  final VoidCallback onTap;
  final IconData? leftIcon; // Change the type to Widget?
  final Color? nextIconColor;

  const IconText({
    Key? key,
    required this.title,
    this.titleTextStyle,
    this.iconData,
    required this.onTap,
    this.leftIcon,
    this.nextIconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (iconData != null) ...[
            Icon(
              iconData,
            ),
            const Gap(10), // Add some spacing between icon and text
          ],
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: titleTextStyle ??
                    Styles.textStyle.copyWith(
                      color: Colors.black,
                      fontSize: 16
                     ),
                ),
                  Icon(
                    leftIcon,
                  ),
                ],
            ),
          ),
        ],
      ),
    );
  }
}

