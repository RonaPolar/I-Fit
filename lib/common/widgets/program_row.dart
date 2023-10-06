import 'package:flutter/material.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/main_button.dart';
import 'package:ifit/common/widgets/toggle_switch.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';

//For Workout Row
class WorkoutRow extends StatefulWidget {
  final Map wObj;
  final double? progress; // Make progress optional
  final IconData icon; // Add an icon parameter
  final bool showToggleSwitch; // Add a parameter to control whether to show the ToggleSwitch

  const WorkoutRow({
    Key? key,
    required this.wObj,
    this.progress, // Provide a default value of null
    this.icon = FluentSystemIcons.ic_fluent_chevron_right_filled, // Provide a default icon
    this.showToggleSwitch = true, // Provide a default value to show the ToggleSwitch
  }) : super(key: key);

  @override
  State<WorkoutRow> createState() => _WorkoutRowState();
}

class _WorkoutRowState extends State<WorkoutRow> {
  @override
  Widget build(BuildContext context) {
    final String name = widget.wObj["name"].toString();
    final String kcal = widget.wObj["kcal"]?.toString() ?? '';
    final String duration = widget.wObj["duration"]?.toString() ?? '';
    final String categories = widget.wObj["categories"]?.toString() ?? ''; // Make categories optional
    final String days = widget.wObj["days"]?.toString() ?? ''; // Make categories optional
    final String schedule = widget.wObj["schedule"]?.toString() ?? ''; // Make categories optional
    final String time = widget.wObj["time"]?.toString() ?? ''; // Make categories optional

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
                if (schedule.isEmpty && categories.isEmpty) // Display kcal and duration if available
                  Text(
                    "$kcal Calories | $duration minutes",
                    style: Styles.normal.copyWith(
                      fontSize: 12,
                    ),
                  ),
                if (schedule.isEmpty && categories.isNotEmpty) // Display kcal and categories if available
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



//What To Eat and Train Next
class What2Container extends StatefulWidget {
final Map wObj;
final Function(Map obj) onPressed;


  const What2Container({super.key, required this.wObj, required this.onPressed});

  @override
  State<What2Container> createState() => _What2ContainerState();
}

class _What2ContainerState extends State<What2Container> {
  @override
  Widget build(BuildContext context) {
    final String name = widget.wObj["name"].toString();
    final String foodNumber = widget.wObj["foodNumber"]?.toString() ?? '';
    final String workoutNumber = widget.wObj["workoutNumber"]?.toString() ?? '';

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
        color: Styles.secondColor.withOpacity(0.6),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: Styles.text15bold
                ),
                if (foodNumber.isEmpty) // Display kcal and categories if available
                Text(
                  "$workoutNumber Programs",
                  style: Styles.normal.copyWith(
                    fontSize: 12,
                  ),
                ),
                if (foodNumber.isNotEmpty) // Display kcal and categories if available
                Text(
                  "$foodNumber Programs",
                  style: Styles.normal.copyWith(
                    fontSize: 12,
                  ),
                ),
                
                const Gap(10),
                SizedBox(
                    width: 110,
                    height: 30,
                      child: MainButton(
                        title: "View More",
                        buttonColor: Styles.primaryColor,
                        onPressed: () => widget.onPressed(widget.wObj),
                      textStyle: Styles.seeMore.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )),  
              ],
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),   
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
                ClipRRect(
                  child: Image.asset(
                    widget.wObj["image"].toString(),
                    width: 80,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                ),
            ],
          ),
        ],
        
      ),
    );
  }
}

