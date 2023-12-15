import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/program_widgets.dart';
import 'package:ifit/screens/experts_main_screens/exp_discover_screens/my_programs/exp_my_programs.dart';
import 'package:ifit/screens/experts_main_screens/exp_discover_screens/view_screens/workout_screen.dart/exp_workout_category.dart';
import 'package:ifit/screens/experts_main_screens/exp_discover_screens/view_screens/workout_screen.dart/view_workout.dart';



class ExpWorkoutScreen extends StatefulWidget {
  const ExpWorkoutScreen({super.key});

  @override
  State<ExpWorkoutScreen> createState() => _ExpWorkoutScreenState();
}

class _ExpWorkoutScreenState extends State<ExpWorkoutScreen> {
  List what2TrainArr = [
    {
      "name": "Full Body",
      "image": "assets/icons/workout-pic.png",
      "workoutNumber": "130",
    },
    {
      "name": "Upper Body",
      "image": "assets/icons/Upper-Weights.png",
      "workoutNumber": "130",
    },
    {
      "name": "Abdominal",
      "image": "assets/icons/Ab-workout.png",
      "workoutNumber": "130",
    },
    {
      "name": "Lower Body",
      "image": "assets/icons/Lower-Weights.png",
      "workoutNumber": "130",
    },
  ];

  List upcomingWorkoutArr = [
    {
      "name": "Full Body Exercises",
      "image": "assets/icons/workout-pic.png",
      "rate": "4.7",
      "schedule": "Monday",
      "categories": "Full Body",
      "time": "9:00am",
      "kcal": "320",
      "exercise": "10",
      "duration": "30",
      "days": "21",
      "clients": "21",
    },
    {
      "name": "Upper Body Weights",
      "image": "assets/icons/Lower-Weights.png",
      "rate": "4.3",
      "schedule": "Monday",
      "categories": "Upper Body",
      "time": "10:00am",
      "kcal": "210",
      "exercise": "10",
      "duration": "30",
      "days": "15",
      "clients": "11",
    },
    {
      "name": "Ab Exercises",
      "image": "assets/icons/Ab-workout.png",
      "rate": "4.5",
      "schedule": "Monday",
      "categories": "Abdominal",
      "time": "4:00pm",
      "kcal": "260",
      "exercise": "10",
      "duration": "30",
      "days": "14",
      "clients": "19",
    },
  ];
  
@override
  Widget build(BuildContext context) {
  
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
        title: Text(
          'Workout Programs',
          style: Styles.headline20),
      ),

        body:ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                  child: Container(
                    width: 150,
                    height: 150,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: primary,
                      borderRadius: BorderRadius.circular(75),
                    ),
                    child: FittedBox(
                      child: Text(
                        "16",
                        textAlign: TextAlign.center,
                        style: Styles.headlineBig.copyWith(
                            color: Colors.white,
                          ),
                      ),
                      ),
                    ),
                ),

                  const Gap(20),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text(
                      "Workout Created",
                      style: Styles.title
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ExpCreatedProgram()));
                      },
                      child: Text(
                        "See More",
                        style: Styles.seeMore),
                      )
                    ],
                  ),
                  ListView.builder( //WorkoutRowContainer Content
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: upcomingWorkoutArr.length,
                      itemBuilder: (context, index) {
                        var wObj = upcomingWorkoutArr[index] as Map? ?? {};
                        return InkWell(
                            onTap: () {
                              Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                   ViewWorkoutDetails(dObj: wObj),
                              ),
                            );
                            },
                            child: ProgramRow(image: wObj["image"], 
                          title: wObj["name"], 
                          bottomText: "${wObj["duration"]} minutes | ${wObj["clients"]} Clients", 
                          showToggleSwitch: false,));
                      }),
            
                  const Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Category",
                        style: Styles.title
                      ),
                    ],
                  ),
                  ListView.builder( //WorkoutRowContainer Content
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: what2TrainArr.length,
                      itemBuilder: (context, index) {
                        var what2TrainObj = what2TrainArr[index] as Map? ?? {};
                        return What2Container(wObj: what2TrainObj, 
                          onPressed: (obj) {  //wObj
                              Navigator.push( //there will be major changes
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ExpWorkoutCategory(wObj: what2TrainObj)),
                              );
                            },
                          );
                      }),
            
            
                ],  //Main children
              ),
            ),
          ],
        ),  //Main top
      );
  }
}