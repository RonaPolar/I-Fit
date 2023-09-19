import 'package:flutter/material.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';

class WorkoutRowContainer extends StatefulWidget {
  final Map wObj;
  final double? progress; // Make progress optional

  const WorkoutRowContainer({
    Key? key,
    required this.wObj,
    this.progress, // Provide a default value of null
  }) : super(key: key);

  @override
  State<WorkoutRowContainer> createState() => _WorkoutRowContainerState();
}

class _WorkoutRowContainerState extends State<WorkoutRowContainer> {
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
                widget.wObj["image"].toString(),
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
                  widget.wObj["name"].toString(),
                  style: Styles.text2.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "${widget.wObj["kcal"].toString()} Calories | ${widget.wObj["time"].toString()} minutes",
                  style: TextStyle(
                    color: Styles.fadeTextColor,
                    fontSize: 12,
                  ),
                ),
                const Gap(5),
                if (widget.progress != null) // Conditionally render the progress bar
                  SimpleAnimationProgressBar(
                    height: 15,
                    width: 165,
                    backgroundColor: Colors.grey.shade200,
                    foregrondColor: Styles.secondColor,
                    ratio: widget.progress!,
                    direction: Axis.horizontal,
                    curve: Curves.fastLinearToSlowEaseIn,
                    duration: const Duration(seconds: 3),
                    borderRadius: BorderRadius.circular(7.5),
                    gradientColor: LinearGradient(
                      colors: Styles.gradientColor,
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
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
