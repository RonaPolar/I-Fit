import 'package:flutter/material.dart';
import 'package:ifit/common/utils/app_styles.dart';

class BottomBar extends StatelessWidget {
  final IconData icon;
  final IconData selectIcon;
  final VoidCallback onTap;
  final bool isActive;

  const BottomBar({
    Key? key, 
    required this.icon,
    required this.selectIcon,
    required this.isActive,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isActive ? selectIcon : icon,
            color: isActive ? primary : Colors.black,
          ),          SizedBox(
          height: isActive ?  5: 12,  //padding between circle and icons
        ),
        if(isActive)  
        Container(  //the circle under the icons of bottom navbar when onTapped
          width: 4,
          height: 4,
          decoration: BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.circular(2)),
        )
      ]),
    );
  }
}
