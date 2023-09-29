import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/more_icon.dart';
import 'package:ifit/common/widgets/program_row.dart';
import 'package:ifit/common/widgets/charts/workout_linechart.dart';
import 'package:ifit/screens/main_screens/program_tracker_screens/workout_screens/workout_details.dart';
import 'package:ifit/screens/main_screens/program_tracker_screens/workout_screens/workout_schedule.dart';

class MealTrackerScreen extends StatefulWidget {

  const MealTrackerScreen({super.key});

  @override
  State<MealTrackerScreen> createState() => _MealTrackerScreenState();
}

class _MealTrackerScreenState extends State<MealTrackerScreen> {

  List what2TrainArr = [
    {
      "name": "Full Body Workout",
      "image": "assets/icons/workout-pic.png",
      "exercise": "12",
      "duration": "40",
    },
    {
      "name": "Upper Body Workout",
      "image": "assets/icons/Upper-Weights.png",
      "exercise": "10",
      "duration": "30",
    },
    {
      "name": "Ab Workout",
      "image": "assets/icons/Ab-workout.png",
      "exercise": "11",
      "duration": "30",
    },
    {
      "name": "Lower Body Workout",
      "image": "assets/icons/Lower-Weights.png",
      "exercise": "10",
      "duration": "30",
    },
  ];

  List upcomingMealArr = [
    {
      "name": "Blueberry Pancake",
      "image": "assets/icons/pancake.png",
      "day": "Monday",
      "time": "9:00am",
    },
    {
      "name": "Salad",
      "image": "assets/icons/salad.png",
      "day": "Monday",
      "time": "10:00am",
    },
    {
      "name": "Salmon Nigiri",
      "image": "assets/icons/nigiri.png",
      "day": "Monday",
      "time": "4:00pm",
    },
  ];

  
@override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red.shade400.withOpacity(0.9),
      child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled){
            return [
              SliverAppBar(
                backgroundColor: Colors.transparent,
                centerTitle: true,
                // pinned: true,
                elevation: 0,
                expandedHeight: 54,
                leading: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(12),
                      height: 30,
                      width: 30,
                    alignment: Alignment.center,
                    child: const Icon(
                      FluentSystemIcons.ic_fluent_chevron_left_filled,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
                title: Text('Meal Tracker',
                style: Styles.headline20),
                actions: [
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    height: 30,
                    width: 30,
                    alignment: Alignment.center,
                    child: const MoreIcon(options: ['This Week','This Month'], iconData: FluentSystemIcons.ic_fluent_more_filled,
                    ),
                  ),
                ],
              ),
              SliverAppBar(
                backgroundColor: Colors.transparent,
                centerTitle: true,
                elevation: 0,
                leadingWidth: 0,
                leading: const SizedBox(),
                expandedHeight: 200,
                flexibleSpace: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.maxFinite,
                  child: const LineChartWidget(),
                ),
              ),
            ];
          }, 
          body:Container(  //Meal Chart
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                color: Styles.bgColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25), topRight: Radius.circular(25))
                ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    const Gap(10),
                    Container(
                      width: 50,
                      height: 4,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(3)),
                    ),
                    const Gap(20),
                    // Container(
                    //   padding:
                    //       const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    //   decoration: BoxDecoration(
                    //     color: Styles.secondColor.withOpacity(0.3),
                    //     borderRadius: BorderRadius.circular(15),),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Text(
                    //         'Daily Workout Schedule',
                    //         style: Styles.text2.copyWith(
                    //           fontWeight: FontWeight.bold),
                    //       ),
                    //       SizedBox(
                    //         width: 80,
                    //         height: 30,
                    //           child: MainButton(
                    //             title: "Check",
                    //           onPressed: () {
                    //             Navigator.of(context).push(
                    //               MaterialPageRoute(
                    //               builder: (context) => const WorkoutSchedule()));
                    //           },
                    //           textStyle: const TextStyle(
                    //             fontSize: 14,
                    //             fontWeight: FontWeight.bold,
                    //             color: Colors.white,
                    //           ),
                    //         )),                    
                    //         ],
                    //       ),
                    //     ),

                    // const Gap(15),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Text(
                        "Daily Meal Schedule",
                        style: Styles.title
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                            builder: (context) => const WorkoutSchedule()));
                        },
                        child: Text(
                          "See More",
                          style: Styles.seeMore
                          ),
                        )
                      ],
                    ),
                    ListView.builder( //WorkoutRowContainer Content
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: upcomingMealArr.length,
                        itemBuilder: (context, index) {
                          var schedObj = upcomingMealArr[index] as Map? ?? {};
                          return InkWell(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) =>
                                //          WorkoutDetails(dObj: schedObj),
                                //   ),
                                // );
                              },
                              child: ScheduledProgram(wObj: schedObj));
                        }),

                    const Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Find Something to Eat",
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
                          return What2TrainContainer(wObj: what2TrainObj, 
                            onPressed: (obj) {  //wObj
                                Navigator.push( //there will be major changes
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => WorkoutDetails(dObj: what2TrainObj)
                                  ),
                                );
                              },
                            );
                        }),


                  ],  //Main children
                ),
              ),
            ),
          ),  //Main top
        ),
    );
  }
}

