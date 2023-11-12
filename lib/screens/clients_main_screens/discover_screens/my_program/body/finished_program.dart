import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/program_widgets.dart';
import 'package:ifit/screens/clients_main_screens/program_tracker_screens/meal_screens/meal_details.dart';
import 'package:ifit/screens/clients_main_screens/program_tracker_screens/workout_screens/workout_details.dart';

class FinishedProgramScreen extends StatefulWidget {
  const FinishedProgramScreen({super.key});

  @override
  State<FinishedProgramScreen> createState() => _FinishedProgramScreenState();
}

class _FinishedProgramScreenState extends State<FinishedProgramScreen> {
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
                          child: ProgramRow(image: item["image"], 
                            title: item["name"], 
                            bottomText: "${item["duration"]} minutes | ${item["kcal"]} Calories",
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
                          child: ProgramRow(image: item["image"], 
                            title: item["name"], 
                            bottomText: "${item["categories"]} | ${item["kcal"]} Calories",
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