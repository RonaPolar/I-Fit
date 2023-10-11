import 'package:flutter/material.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/toggle_switch.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';


//For Meal Row
class MealRow extends StatefulWidget {
  final Map mObj;
  final double? progress; // Make progress optional
  final IconData icon; // Add an icon parameter
  final bool showToggleSwitch; // Add a p
  
  const MealRow({super.key, 
  required this.mObj, 
  this.progress, // Provide a default value of null
  this.icon = FluentSystemIcons.ic_fluent_chevron_right_filled, // Provide a default icon
  this.showToggleSwitch = true, // Provide a default value to show the ToggleSwitch
  });

  @override
  State<MealRow> createState() => _MealRowState();
}

class _MealRowState extends State<MealRow> {
  @override
  Widget build(BuildContext context) {
    final String name = widget.mObj["name"].toString();
    final String kcal = widget.mObj["kcal"]?.toString() ?? '';
    final String categories = widget.mObj["categories"]?.toString() ?? ''; // Make categories optional
    final String days = widget.mObj["days"]?.toString() ?? ''; // Make categories optional
    final String schedule = widget.mObj["schedule"]?.toString() ?? ''; // Make categories optional
    final String time = widget.mObj["time"]?.toString() ?? ''; // Make categories optional

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
                widget.mObj["image"].toString(),
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
                  name,
                  style: Styles.text15bold
                ),
                if (schedule.isNotEmpty) // Display schedule and time if available
                  Text(
                    "$schedule | $time",
                    style: Styles.normal.copyWith(
                      fontSize: 12,
                    ),
                  ),
                if (schedule.isEmpty) // Display kcal and categories if available
                  Text(
                    "$kcal Calories | $categories",
                    style: Styles.normal.copyWith(
                      fontSize: 12,
                    ),
                  ),
                const SizedBox(height: 4,),
                if (widget.progress != null) // Conditionally render the progress bar
                  Row(
                    children: [
                      SimpleAnimationProgressBar(
                        height: 15,
                        width: 150,
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
                      Text(
                        "$days days", // Display the duration here
                        style: Styles.normal.copyWith(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
          if (widget.showToggleSwitch) // Conditionally render the ToggleSwitch
            const ToggleSwitch(),
          if (!widget.showToggleSwitch) // Conditionally render the default icon
            IconButton(
              onPressed: () {},
              icon: Icon(
                widget.icon,
                size: 30,
                color: Styles.secondColor,
              ),
            ),
        ],
      ),
    );
  }
}


class MealRecom extends StatefulWidget {
  final Map mObj;
  final int index;
  const MealRecom({super.key, required this.mObj,  required this.index});

  @override
  State<MealRecom> createState() => _MealRecomState();
}

class _MealRecomState extends State<MealRecom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: 160,
      decoration: BoxDecoration(
        color: Styles.secondColor.withOpacity(0.4),
          borderRadius:  BorderRadius.circular(25)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
              widget.mObj["image"].toString(),
              width: 80,
              height: 80,
              fit: BoxFit.contain,
            ),
          const Gap(5),
          Text(
            widget.mObj["name"],
            style: Styles.seeMore.copyWith(
              color: Colors.black,
            ),
          ),
          Text(
            "${widget.mObj["categories"]} | ${widget.mObj["kcal"]} kCal",
            style: Styles.normal.copyWith(
              fontSize: 12,
              color: Colors.black,
            ),
          ),
          const Gap(12),
          Text(
            "View",
            style: Styles.seeMore.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
            ),  
        
        ],
      ),
    );
  }
}