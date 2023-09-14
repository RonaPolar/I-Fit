import 'package:flutter/material.dart';
import 'package:ifit/common/utils/app_styles.dart';

class NextNavigationContainer extends StatelessWidget {
  final String title;
  final IconData? iconData;
  final VoidCallback onTap;

  const NextNavigationContainer({super.key, 
  required this.title, 
  this.iconData, 
  required this.onTap});

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
          ],
          Text(
            title,
            style: Styles.text2.copyWith(
              color: Styles.fadeTextColor,
              fontWeight: FontWeight.bold),
          ),
         Icon(Icons.navigate_next,
          color: Styles.fadeTextColor,),
        ],
      ),
    );
  }
}
