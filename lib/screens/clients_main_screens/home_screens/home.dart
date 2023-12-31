import 'package:fl_chart/fl_chart.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/main_button.dart';
import 'package:ifit/common/widgets/icon_text_icon.dart';
import 'package:ifit/common/widgets/program_widgets.dart';
import 'package:ifit/screens/clients_main_screens/home_screens/activity_tracker.dart';
import 'package:ifit/screens/clients_main_screens/main_bottom_bar.dart';
import 'package:ifit/screens/clients_main_screens/home_screens/notifications.dart';
import 'package:ifit/screens/clients_main_screens/program_tracker_screens/meal_screens/meal_details.dart';
import 'package:ifit/screens/clients_main_screens/program_tracker_screens/meal_screens/meal_tracker.dart';
import 'package:ifit/screens/clients_main_screens/program_tracker_screens/program_schedule/program_schedule.dart';
import 'package:ifit/screens/clients_main_screens/program_tracker_screens/workout_screens/workout_details.dart';
import 'package:ifit/screens/clients_main_screens/program_tracker_screens/workout_screens/workout_tracker.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';
import 'package:dotted_dashed_line/dotted_dashed_line.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  List recommendWorkoutArr = [
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
    },
  ];

    List recommendMealArr = [
    {
      "name": "Blueberry Pancake",
      "image": "assets/images/meal/pancake.png",
      "rate": "4.9",
      "kcal": "190",
      "fats": "199",
      "proteins": "305",
      "sugar": "150",
      "categories": "Breakfast",
    },
    {
      "name": "Salad",
      "image": "assets/images/meal/salad.png",
      "rate": "4.6",
      "kcal": "200",
      "fats": "100",
      "proteins": "300",
      "sugar": "50",
      "categories": "Lunch",
    },
    {
      "name": "Salmon Nigiri",
      "image": "assets/images/meal/nigiri.png",
      "rate": "4.3",
      "kcal": "300",
      "fats": "250",
      "proteins": "310",
      "sugar": "100",
      "categories": "Dinner",
    },
  ];

  List schedArr = [
    {"title": "7pm - 8pm", "subtitle": "Stretching"},
    {"title": "5pm - 6:30pm", "subtitle": "Full Body"},
    {"title": "8am - 9pm", "subtitle": "Abdominal"},
    {"title": "7:30am - 7:50am", "subtitle": "Stretching"},
    {"title": "6:30am - 7am", "subtitle": "Meal"},
  ];

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        children: [
          Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome Back,',
                        style: Styles.text15normal,
                      ),
                      Text(
                        'Juan Dela Cruz',
                        style: Styles.headline20,
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const NotificationScreen()));
                      },
                      icon: const Icon(
                          FluentSystemIcons.ic_fluent_alert_regular))
                ],
              ),
              const Gap(20),

              Container(
                height: 120,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 0, 0, 72),
                    borderRadius: BorderRadius.circular(20)),
                child: Stack(alignment: Alignment.center, children: [
                  Image.asset(
                    "assets/images/Dots.png",
                    height: 120,
                    width: double.maxFinite,
                    fit: BoxFit.fitHeight,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "BMI (Body Mass Index)",
                              style: Styles.text15bold.copyWith(
                                  color: Colors.white,
                                  ),
                            ),
                            Text(
                              "You have a normal weight",
                              style: Styles.seeMore.copyWith(
                                  color: Colors.white.withOpacity(0.7),
                                  ),
                            ),
                            const Gap(12),
                            SizedBox(
                                width: 110,
                                height: 30,
                                child: MainButton(
                                  title: "View More",
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => const ProfileNavBar()));
                                  },
                                  textStyle: Styles.seeMore.copyWith(
                                    color: Colors.white,
                                  ),
                                )),
                          ],
                        ),
                        AspectRatio(
                          aspectRatio: 1,
                          child: PieChart(
                            PieChartData(
                              pieTouchData: PieTouchData(
                                touchCallback:
                                    (FlTouchEvent event, pieTouchResponse) {},
                              ),
                              startDegreeOffset: 250,
                              borderData: FlBorderData(
                                show: false,
                              ),
                              sectionsSpace: 1,
                              centerSpaceRadius: 0,
                              sections: showingSections(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
              ),
            
            const Gap(15),
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              decoration: BoxDecoration(
                color: Styles.secondColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(15),),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Today Target',
                    style: Styles.text15bold.copyWith(
                      color: Colors.black,
                      ),
                  ),
                  SizedBox(
                    width: 80,
                    height: 30,
                      child: MainButton(
                        title: "Check",
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                          builder: (context) => const ActivityTracker()));
                      },
                      textStyle: Styles.seeMore.copyWith(
                        color: Colors.white,
                      ),
                    )),                    
                    ],
                  ),
                ),
            const Gap(20),

            Text(
              'Activity Today',
               style: Styles.title
            ),
            const Gap(10),
            Row(
            children: [
              Expanded( //Schedule Container
                child: Container(
                  height: 315,
                  padding: const EdgeInsets.symmetric(
                      vertical: 15, horizontal: 15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(color: Colors.black26, blurRadius: 2)
                      ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NextNavigation(title: 'Schedule',
                          nextIconColor: Styles.fadeTextColor,
                          titleTextStyle: Styles.text15bold.copyWith(
                            color: Styles.fadeTextColor,
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const MealSched(),
                            ));
                          },),
                          Text(
                            "Monday",
                            style: Styles.seeMore.copyWith(
                                color: Styles.secondColor.withOpacity(0.5),
                                fontWeight: FontWeight.w700,
                                ),
                          ),
                        const Gap(5),
                        Row( //text at Schedule
                          children: [
                            SimpleAnimationProgressBar(
                            height: 235,
                            width: 20,
                            backgroundColor: Colors.grey.shade200,
                            foregrondColor: Colors.white,
                            ratio: 0.8, //1 is 100%
                            direction: Axis.vertical,
                            curve: Curves.fastLinearToSlowEaseIn,
                            duration: const Duration(seconds: 3),
                            borderRadius: BorderRadius.circular(15),
                            gradientColor: LinearGradient(
                                colors: [Styles.secondColor.withOpacity(0.5), Styles.secondColor],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter),
                            ),
                            const Gap(10),
                            Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Gap(2),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: schedArr.map((wObj) { //schedule content
                                  var isLast = wObj == schedArr.last;
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 10,
                                            height: 10,
                                            decoration: BoxDecoration(
                                              color: Styles.secondColor
                                                  .withOpacity(0.5),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                          ),
                                          if (!isLast)
                                            DottedDashedLine(
                                                height: 40,
                                                width: 0,
                                                dashColor: Styles
                                                    .secondColor
                                                    .withOpacity(0.5),
                                                axis: Axis.vertical)
                                        ],
                                      ),
                                      const Gap(5), //gap between text and line
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [ //waterArry
                                          Text(
                                            wObj["title"].toString(),
                                            style: Styles.normal.copyWith(
                                              fontSize: 12,
                                              color: Styles.fadeTextColor,
                                            ),
                                          ),
                                          Text(
                                            wObj["subtitle"].toString(),
                                            style: Styles.normal.copyWith(
                                                fontSize: 12,
                                                color: Styles.secondColor.withOpacity(0.5),
                                                ),
                                          ),
                                        ],
                                      )
                                    ],
                                  );
                                }).toList(),
                              )
                            ],
                          ))
                        ],
                        ),
                      ],
                    ),
                ),
              ),
              
              ],),
              const Gap(20),

            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Workout Recommendation",
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
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: recommendWorkoutArr.length,
                  itemBuilder: (context, index) {
                  var wObj = recommendWorkoutArr[index] as Map? ?? {};
                  return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WorkoutDetails(dObj: wObj)),
                        );
                      },
                      child: BigContainer(image: wObj["image"], 
                        title: wObj["name"], 
                        bottomText: "${wObj["duration"]} minutes | ${wObj["kcal"]} kcal",));
                }),
              ),
                
            const Gap(15),
            Row(  
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Meal Recommendation",
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
            SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: recommendMealArr.length,
                  itemBuilder: (context, index) {
                  var mObj = recommendMealArr[index] as Map? ?? {};
                  return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MealDetails(dObj: mObj)),
                        );
                      },
                      child: BigContainer(image: mObj["image"], 
                        title: mObj["name"], 
                        bottomText: "${mObj["categories"]} | ${mObj["kcal"]} kcal",));
                }),
              ),
              ],
            ),
          ),
        ],
      ),
    );
  }

//BMI pIE cHART
  List<PieChartSectionData> showingSections() {
    return List.generate(
      2,
      (i) {
        switch (i) {
          case 0:
            return PieChartSectionData(
                color: primary,
                value: 20.1,
                title: '',
                radius: 45,
                titlePositionPercentageOffset: 0.55,
                badgeWidget: Text(
                  "20.1",
                  style: Styles.text12.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ));
          case 1:
            return PieChartSectionData(
              color: Colors.white,
              value: 75,
              title: '',
              radius: 40,
              titlePositionPercentageOffset: 0.55,
            );

          default:
            throw Error();
        }
      },
    );
  }
}