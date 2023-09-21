import 'package:fl_chart/fl_chart.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/programs_chart.dart';
import 'package:ifit/common/widgets/program_row.dart';
import 'package:ifit/common/widgets/main_button.dart';
import 'package:ifit/common/widgets/next_navigation_container.dart';
import 'package:ifit/screens/main_screens/home_screens/activity_tracker.dart';
import 'package:ifit/screens/main_screens/main_bottom_bar.dart';
import 'package:ifit/screens/main_screens/home_screens/notifications.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';
import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

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
      "kcal": "180",
      "time": "20",
    },
    {
      "name": "Upper Body Weights",
      "image": "assets/icons/Lower-Weights.png",
      "kcal": "200",
      "time": "30",
    },
    {
      "name": "Ab Exercises",
      "image": "assets/icons/Ab-workout.png",
      "kcal": "300",
      "time": "40",
    },
  ];

    List recommendMealArr = [
    {
      "name": "Blueberry Pancake",
      "image": "assets/icons/pancake.png",
      "kcal": "190",
      "categories": "Breakfast",
    },
    {
      "name": "Salad",
      "image": "assets/icons/salad.png",
      "kcal": "200",
      "categories": "Lunch",
    },
    {
      "name": "Salmon Nigiri",
      "image": "assets/icons/nigiri.png",
      "kcal": "300",
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
                        style: Styles.text2,
                      ),
                      Text(
                        'Juan Dela Cruz',
                        style: Styles.headlineSmall,
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
                            const Text(
                              "BMI (Body Mass Index)",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "You have a normal weight",
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.7),
                                  fontSize: 14),
                            ),
                            const Gap(12),
                            SizedBox(
                                width: 100,
                                height: 30,
                                child: MainButton(
                                  title: "View More",
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => const ProfileNavBar()));
                                  },
                                  textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
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
                color: Styles.secondColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(15),),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Today Target',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 80,
                    height: 30,
                      child: MainButton(
                        title: "Check",
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                          builder: (context) => const ActivityTrackerScreen()));
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
            const Gap(20),

            const Text(
              'Activity Today',
               style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold),
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
                        NextNavigationContainer(title: 'Schedule',
                              nextIconColor: Styles.fadeTextColor,
                              titleTextStyle: Styles.text2.copyWith(
                                color: Styles.fadeTextColor,
                                fontWeight: FontWeight.bold,
                              ),
                              onTap: () {
                                // Navigator.of(context).push(MaterialPageRoute(
                                //   builder: (context) => const ActivityTrackerNavbar(),
                                // ));
                              },),
                          Text(
                            "Monday",
                            style: TextStyle(
                                color: Styles.secondColor.withOpacity(0.5),
                                fontWeight: FontWeight.w700,
                                fontSize: 14),
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
                                            style: TextStyle(
                                              color: Styles.fadeTextColor,
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            wObj["subtitle"].toString(),
                                            style: TextStyle(
                                                color: Styles.secondColor
                                                    .withOpacity(0.5),
                                                fontSize: 12),
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
              const Gap(15),

              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: double.maxFinite,
                      height: 150,
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
                              NextNavigationContainer(title: 'Time Spent',
                              nextIconColor: Styles.fadeTextColor,
                              titleTextStyle: Styles.text2.copyWith(
                                color: Styles.fadeTextColor,
                                fontWeight: FontWeight.bold,
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const WorkoutTrackerNavbar(),
                                ));
                              },),
                                Text(
                                  "2hr 50m",
                                  style: TextStyle(
                                      color: Styles.secondColor.withOpacity(0.5),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14),
                                ),
                                Expanded(
                                  child: Image.asset('assets/images/Sleep-Graph.png', 
                                    fit: BoxFit.fill),
                                ),
                  ])
                ),
                    const Gap(15),
                    
                    Container(
                      width: double.maxFinite,
                      height: 150,
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
                        NextNavigationContainer(title: 'Calories', 
                              nextIconColor: Styles.fadeTextColor,
                              titleTextStyle: Styles.text2.copyWith(
                                color: Styles.fadeTextColor,
                                fontWeight: FontWeight.bold,
                              ),
                              onTap: () {
                                // Navigator.of(context).push(MaterialPageRoute(
                                //   builder: (context) => const ActivityTrackerNavbar(),
                                // ));
                              },),
                          Text(
                            "760 kCal",
                            style: TextStyle(
                                color: Styles.secondColor.withOpacity(0.5),
                                fontWeight: FontWeight.w700,
                                fontSize: 14),
                          ),
                          const Gap(10),
                          Container(
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: 65,
                              height: 65,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: primary,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const FittedBox(
                                      child: Text(
                                        "240kCal\nBurned",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10),
                                      ),
                                      ),
                                    ),
                                    SimpleCircularProgressBar(
                                    progressStrokeWidth: 10,
                                    backStrokeWidth: 10,
                                    progressColors: [Styles.secondColor.withOpacity(0.5), Styles.secondColor],
                                    backColor: Colors.grey.shade200,
                                    valueNotifier: ValueNotifier(30),
                                    startAngle: -180,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ])
                      ),
                    ],
                  ),
                )
              ],),
              const Gap(20),

            Column(  //Workout Progress
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NextNavigationContainer(title: 'Program Progress',
                nextIconColor: Styles.fadeTextColor,
                titleTextStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
                onTap: () {
                  // Navigator.of(context).push(MaterialPageRoute(
                 //   builder: (context) => const ActivityTrackerNavbar(),
                 // ));
                },),
              const Gap(5),
              Container(  //Weekly DropDOwn Button
                  height: 30,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      items: ["This Week", "Last Week"]
                          .map((name) => DropdownMenuItem(
                                value: name,
                                child: Text(
                                  name,
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 14),
                                ),
                              ))
                          .toList(),
                      onChanged: (value) {},
                      icon: const Icon(Icons.expand_more, color: Colors.white),
                      hint: const Text(
                        "Weekly",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                      ),
                    ),
                  )), 
              ],
            ),
            
          const Gap(10),
          Container(  //Workout Chart
            height: 200,
            width: double.maxFinite,
            alignment: Alignment.center,
            child: ProgramsChart(),
          ),

            const Gap(15),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Workout Recommendation",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "See More",
                  style: TextStyle(
                    color: Styles.fadeTextColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
                  ),
                )
              ],
            ),
          ListView.builder( //WorkoutRowContainer Content
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: recommendWorkoutArr.length,
              itemBuilder: (context, index) {
                var wObj = recommendWorkoutArr[index] as Map? ?? {};
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
                      // progress: wObj["progress"] as double?,
                      ));
              }),
              
          const Gap(15),
            Row(  
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Meal Recommendation",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "See More",
                  style: TextStyle(
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
              itemCount: recommendWorkoutArr.length,
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
                    child: ProgramRow(wObj: wObj));
              }),
            ],
          ),
        ),
      ],
      ),
    );
  }

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
                badgeWidget: const Text(
                  "20.1",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
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