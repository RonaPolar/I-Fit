import 'package:flutter/material.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';

class MealRowContainer extends StatelessWidget {
  final Map mealObj;

  const MealRowContainer({Key? key, 
  required this.mealObj}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
        color: Styles.bgColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 2)],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Container(
              width: 60,
              height: 60,
              color: Styles.secondColor.withOpacity(0.6),
              child: Image.asset(
                mealObj["image"].toString(),
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(width: 15,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mealObj["name"].toString(),
                  style: Styles.text2.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "${mealObj["kcal"].toString()} Calories | ${mealObj["categories"].toString()}",
                  style: TextStyle(
                    color: Styles.fadeTextColor,
                    fontSize: 12,
                  ),
                ),
                const Gap(5),
                // Remove the SimpleAnimationProgressBar from here
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              FluentSystemIcons.ic_fluent_chevron_right_filled,
              size: 30,
              color: Styles.secondColor,
            ),
          ),
        ],
      ),
    );
  }
}
