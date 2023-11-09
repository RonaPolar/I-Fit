import 'dart:math';

import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/main_button.dart';
import 'package:ifit/common/widgets/toggle_switch.dart';
import 'package:ifit/screens/main_screens/program_tracker_screens/meal_screens/meal_details.dart';
import 'package:ifit/screens/main_screens/program_tracker_screens/workout_screens/workout_details.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';

class OngoingProgramScreen extends StatefulWidget {
  const OngoingProgramScreen({super.key});

  @override
  State<OngoingProgramScreen> createState() => _OngoingProgramScreenState();
}

class _OngoingProgramScreenState extends State<OngoingProgramScreen> {
  List latestWorkoutArr = [
    {
      "name": "Full Body Exercises",
      "image": "assets/icons/workout-pic.png",
      "kcal": "180",
      "days": "14",
      "duration": "30",
      "exercise": "10",
      "progress": 0.3,
    },
    {
      "name": "Upper Body Weights",
      "image": "assets/icons/Lower-Weights.png",
      "kcal": "200",
      "duration": "30",
      "days": "10",
      "exercise": "11",
      "progress": 0.5,
    },
    {
      "name": "Upper Ab Exercises",
      "image": "assets/icons/Ab-workout.png",
      "kcal": "300",
      "duration": "20",
      "days": "15",
      "exercise": "12",
      "progress": 0.6,
    },
  ];

    List latestMealArr = [
    {
      "name": "Blueberry Pancake",
      "image": "assets/images/meal/pancake.png",
      "kcal": "190",
      "fats": "100",
      "proteins": "176",
      "sugar": "50",
      "categories": "Breakfast",
      "days": "15",
      "progress": 0.2,
    },
    {
      "name": "Salad",
      "image": "assets/images/meal/salad.png",
      "kcal": "200",
      "fats": "100",
      "proteins": "300",
      "sugar": "50",
      "categories": "Lunch",
      "days": "15",
      "progress": 0.9,
    },
    {
      "name": "Salmon Nigiri",
      "image": "assets/images/meal/nigiri.png",
      "kcal": "300",
      "fats": "170",
      "proteins": "400",
      "sugar": "79",
      "categories": "Dinner",
      "days": "15",
      "progress": 0.5,
    },
  ];


  @override
  Widget build(BuildContext context) {
  List<dynamic> combinedList = [...latestWorkoutArr, ...latestMealArr];
  combinedList.shuffle(Random());
  // List<Widget> items = [];

    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: SizedBox(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: combinedList.length,
                    itemBuilder: (context, index) {
                      var item = combinedList[index] as Map? ?? {};
              
                      if (item.containsKey("duration") && item.containsKey("kcal")) {
                        // It's a workout item
                        return InkWell(
                          onTap: () {
                            Navigator.push(context,
                              MaterialPageRoute(
                                builder: (context) =>
                                  WorkoutDetails(dObj: item),
                              ),
                            );
                          },
                          child: OngoingRow(image: item["image"], 
                            title: item["name"], 
                            bottomText: "${item["duration"]} minutes | ${item["kcal"]} Calories",
                            progress: item["progress"] as double?,
                            progressText: item["days"],
                            icon: FluentSystemIcons.ic_fluent_more_vertical_regular,
                            showToggleSwitch: false,));
                      } else {
                        // It's a meal item
                        return InkWell(
                          onTap: () {
                            Navigator.push(context,
                              MaterialPageRoute(
                                builder: (context) =>
                                  MealDetails(dObj: item),
                              ),
                            );
                          },
                          child: OngoingRow(image: item["image"], 
                            title: item["name"], 
                            bottomText: "${item["categories"]} | ${item["kcal"]} Calories",
                            progress: item["progress"] as double?,
                            progressText: item["days"],
                            icon: FluentSystemIcons.ic_fluent_more_vertical_regular,
                            showToggleSwitch: false,
                            ));
                      }
                    },
                  ),
                ),
              ),
            ],
          )
        ]
      )
    );
  }
}


class OngoingRow extends StatefulWidget {
  final String image;
  final String title;
  final String bottomText;
  final double? progress;
  final String? progressText;
  final IconData icon;
  final bool showToggleSwitch;

  const OngoingRow({
    super.key,
    this.progress, // Provide a default value of null
    this.icon = FluentSystemIcons.ic_fluent_chevron_right_filled, // Provide a default icon
    this.showToggleSwitch = true,
    required this.image,
    required this.title,
    required this.bottomText,
    this.progressText, // Provide a default value to show the ToggleSwitch
  });

  @override
  State<OngoingRow> createState() => _OngoingRowState();
}

class _OngoingRowState extends State<OngoingRow> {
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
                widget.image,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.title, style: Styles.text15bold),
                Text(
                  widget.bottomText,
                  style: Styles.normal.copyWith(
                    fontSize: 12,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                if (widget.progress != null &&
                    widget.progressText !=
                        null) // Conditionally render the progress bar
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
                        "${widget.progressText!} days", // Display the duration here
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
            SizedBox(
              height: 30,
              width: 78,
              child: MainButton(title: "Cancel", 
                textStyle: Styles.seeMore.copyWith(
                color: Colors.white,),
                buttonColor: Styles.secondColor,
                onPressed: (){}))
        ],
      ),
    );
  }
}