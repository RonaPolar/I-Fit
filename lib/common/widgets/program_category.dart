import 'package:flutter/material.dart';
import 'package:ifit/common/utils/app_styles.dart';

class SmallCategoryCell extends StatelessWidget {
  final Map cObj;
  final int index;
  const SmallCategoryCell({super.key, required this.cObj, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(3),
      width: 80,
      decoration: BoxDecoration(
        color: Styles.secondColor.withOpacity(0.6),
          borderRadius:  BorderRadius.circular(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:  BorderRadius.circular(20)),
          
              child: Image.asset(
                  cObj["image"].toString(),
                  fit: BoxFit.contain,
                ),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 8),
            child: Text(
              cObj["name"],
              maxLines: 1,
              style: Styles.text12.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        
        ],
      ),
    );
  }
}