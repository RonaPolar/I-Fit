import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/icon_text_icon.dart';
import 'package:ifit/common/widgets/program_row.dart';
import 'package:ifit/common/widgets/programs_chart.dart';
import 'package:ifit/screens/main_screens/program_tracker_screens/program_screens/workout_screens/workout_details.dart';
import 'package:ifit/screens/main_screens/program_tracker_screens/program_screens/workout_screens/workout_tracker.dart';

class ProgramTrackerScreen extends StatefulWidget {
  const ProgramTrackerScreen({super.key});

  @override
  State<ProgramTrackerScreen> createState() => _ProgramTrackerScreenState();
}

class _ProgramTrackerScreenState extends State<ProgramTrackerScreen> {
  @override
  Widget build(BuildContext context) {
  List recommendWorkoutArr = [
    {
      "name": "Full Body Exercises",
      "image": "assets/icons/workout-pic.png",
      "kcal": "180",
      "days": "14",
      "duration": "30",
      "progress": 0.3,
    },
    {
      "name": "Upper Body Weights",
      "image": "assets/icons/Lower-Weights.png",
      "kcal": "200",
      "duration": "30",
      "days": "10",
      "progress": 0.5,
    },
    {
      "name": "Upper Ab Exercises",
      "image": "assets/icons/Ab-workout.png",
      "kcal": "300",
      "duration": "20",
      "days": "15",
      "progress": 0.6,
    },
  ];

    List recommendMealArr = [
    {
      "name": "Blueberry Pancake",
      "image": "assets/icons/pancake.png",
      "kcal": "190",
      "categories": "Breakfast",
      "days": "15",
      "progress": 0.2,
    },
    {
      "name": "Salad",
      "image": "assets/icons/salad.png",
      "kcal": "200",
      "categories": "Lunch",
      "days": "15",
      "progress": 0.9,
    },
    {
      "name": "Salmon Nigiri",
      "image": "assets/icons/nigiri.png",
      "kcal": "300",
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
          Navigator.pop(context);
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
      title: Text('Program Activity',
      style: Styles.headlineSmall,),
    ),
    body: ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(15),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              height: 200,
              width: double.maxFinite,
              alignment: Alignment.center,
              child: ProgramsChart(),
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

          Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Latest Workout",
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
                      style: Styles.text2.copyWith(
                        color: Styles.fadeTextColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
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
                        var wObj = recommendWorkoutArr[index] as Map? ?? {};
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
                            child: ProgramRow(wObj: wObj,
                              progress: wObj["progress"] as double?,
                              ));
                      }),
                ),
                    
                const Gap(10),
                  Row(  
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Latest Meal",
                      style: Styles.title
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "See More",
                        style: Styles.text2.copyWith(
                          color: Styles.fadeTextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
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
                      var wObj = recommendMealArr[index] as Map? ?? {};
                      return InkWell(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) =>
                            //         const FinishedWorkoutView(),
                            //   ),
                            // );
                          },
                          child: ProgramRow(wObj: wObj,
                          progress: wObj["progress"] as double?,));
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