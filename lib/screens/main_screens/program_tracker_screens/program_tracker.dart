import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/icon_text_icon.dart';
import 'package:ifit/common/widgets/main_button.dart';
import 'package:ifit/common/widgets/charts/programs_chart.dart';
import 'package:ifit/common/widgets/program_widgets.dart';
import 'package:ifit/screens/main_screens/main_bottom_bar.dart';
import 'package:ifit/screens/main_screens/program_tracker_screens/meal_screens/meal_details.dart';
import 'package:ifit/screens/main_screens/program_tracker_screens/meal_screens/meal_tracker.dart';
import 'package:ifit/screens/main_screens/program_tracker_screens/program_schedule/program_schedule.dart';
import 'package:ifit/screens/main_screens/program_tracker_screens/workout_screens/workout_details.dart';
import 'package:ifit/screens/main_screens/program_tracker_screens/workout_screens/workout_tracker.dart';

class ProgramTrackerScreen extends StatefulWidget {
  const ProgramTrackerScreen({super.key});

  @override
  State<ProgramTrackerScreen> createState() => _ProgramTrackerScreenState();
}

class _ProgramTrackerScreenState extends State<ProgramTrackerScreen> {
  @override
  Widget build(BuildContext context) {
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
  
    // var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Styles.bgColor,
      appBar: AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
      leading: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
            builder: (context) => const HomeNavBar()));
        },
        child: Container(
          margin: const EdgeInsets.all(12),
            height: 30,
            width: 30,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10)),
          child: const Icon(
            FluentSystemIcons.ic_fluent_chevron_left_filled,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      title: Text('Program Tracker',
      style: Styles.headline20,),
    ),
    body: ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: LegendsListWidget(
                    legends: [
                      // Legend('Pilates', pilateColor),
                      Legend('Workouts', Styles.secondColor),
                      Legend('Meal', Styles.primaryColor),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  height: 200,
                  width: double.maxFinite,
                  alignment: Alignment.center,
                  child: ProgramsChart(),
                ),
              ],
            ),

            const Gap(10),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.grey.shade500,
                    width: 1, // Adjust the border width as needed
                  ),
                  bottom: BorderSide(
                    color: Colors.grey.shade500,
                    width: 1, // Adjust the border width as needed
                  ),
                ),
              ),
              width: double.maxFinite,
              alignment: Alignment.center,
              // color: Styles.secondColor.withOpacity(0.3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButtonText(iconData: FluentSystemIcons.ic_fluent_timer_filled, title: 'Ongoing',
                  onTap: (){},),
                  IconButtonText(iconData: FluentSystemIcons.ic_fluent_heart_filled, title: 'Favorites',
                  onTap: (){},),
                  IconButtonText(iconData: FluentSystemIcons.ic_fluent_checkmark_circle_filled, title: 'Finished',
                  onTap: (){},),
                  IconButtonText(iconData: FluentSystemIcons.ic_fluent_star_filled, title: 'Rate',
                  onTap: (){},),
                ],
              )
            ),           

            const Gap(10),
            Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              decoration: BoxDecoration(
                color: Styles.secondColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(15),),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Daily Schedule',
                    style: Styles.text15bold
                  ),
                  SizedBox(
                    width: 80,
                    height: 30,
                      child: MainButton(
                        title: "Check",
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                          builder: (context) => const MealSched()));
                      },
                      textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        ),
                      )),                    
                      ],
                    ),
                  ),

                  const Gap(15),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Workout Tracker",
                      style: Styles.title
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const WorkoutTrackerScreen()
                              ),
                            );
                      },
                      child: Text(
                        "See More",
                        style: Styles.seeMore
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    child: ListView.builder( //WorkoutRowContainer Content
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 2, //recommendWorkoutArr.length
                        itemBuilder: (context, index) {
                          var wObj = latestWorkoutArr[index] as Map? ?? {};
                          return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                      WorkoutDetails(dObj: wObj),
                                  ),
                                );
                              },
                              child: ProgramRow(image: wObj["image"], 
                              title: wObj["name"], 
                              bottomText: "${wObj["duration"]} minutes | ${wObj["kcal"]} Calories",
                              progress: wObj["progress"] as double?,
                              progressText: wObj["days"],
                              showToggleSwitch: false,));
                        }),
                  ),
                      
                  const Gap(10),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Meal Tracker",
                      style: Styles.title
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const MealTrackerScreen()
                              ),
                            );
                      },
                      child: Text(
                        "See More",
                        style: Styles.seeMore
                        ),
                      )
                    ],
                  ),
                  ListView.builder( //MealRowContainer Content
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 2, //recommendWorkoutArr.length
                      itemBuilder: (context, index) {
                        var mObj = latestMealArr[index] as Map? ?? {};
                        return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MealDetails(dObj: mObj)),
                              );
                            },
                            child: ProgramRow(image: mObj["image"], 
                              title: mObj["name"], 
                              bottomText: "${mObj["categories"]} | ${mObj["kcal"]} Calories",
                              progress: mObj["progress"] as double?,
                              progressText: mObj["days"],
                              showToggleSwitch: false,
                              ));
                      }),
                ],
              ),
            ),
              
              

          ],  //main Children
        ),

      ],
    ),
  );
}
}