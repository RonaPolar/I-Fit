import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/program_widgets.dart';
import 'package:ifit/screens/experts_main_screens/exp_bottom_bar.dart';
import 'package:ifit/screens/experts_main_screens/exp_discover_screens/my_programs/exp_my_programs.dart';
import 'package:ifit/screens/experts_main_screens/exp_discover_screens/view_screens/view_meal.dart';
import 'package:ifit/screens/experts_main_screens/exp_discover_screens/view_screens/view_workout.dart';
import 'package:ifit/screens/experts_main_screens/exp_program_screens/create_program_screens/create_meal.dart';
import 'package:ifit/screens/experts_main_screens/exp_program_screens/create_program_screens/create_work.dart';

class ExpProgramScreen extends StatefulWidget {
  const ExpProgramScreen({super.key});

  @override
  State<ExpProgramScreen> createState() => _ExpProgramScreenState();
}

class _ExpProgramScreenState extends State<ExpProgramScreen> {
  
 List latestWorkoutArr = [
    {
      "name": "Full Body Exercises",
      "image": "assets/icons/workout-pic.png",
      "rate": "4.7",
      "kcal": "180",
      "days": "14",
      "duration": "30",
      "exercise": "10",
      "progress": 0.3,
      "clients": 100,
    },
    {
      "name": "Upper Body Weights",
      "image": "assets/icons/Lower-Weights.png",
      "rate": "4.3",
      "kcal": "200",
      "duration": "30",
      "days": "10",
      "exercise": "11",
      "progress": 0.5,
      "clients": 160,
    },
    {
      "name": "Upper Ab Exercises",
      "image": "assets/icons/Ab-workout.png",
      "rate": "4.5",
      "kcal": "300",
      "duration": "20",
      "days": "15",
      "exercise": "12",
      "progress": 0.6,
      "clients": 129,
    },
  ];

    List latestMealArr = [
    {
      "name": "Blueberry Pancake",
      "image": "assets/images/meal/pancake.png",
      "rate": "4.9",
      "kcal": "190",
      "fats": "100",
      "proteins": "176",
      "sugar": "50",
      "categories": "Breakfast",
      "days": "15",
      "progress": 0.2,
      "clients": 111,
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
      "days": "15",
      "progress": 0.9,
      "clients": 78,
    },
    {
      "name": "Salmon Nigiri",
      "image": "assets/images/meal/nigiri.png",
      "rate": "4.3",
      "kcal": "300",
      "fats": "170",
      "proteins": "400",
      "sugar": "79",
      "categories": "Dinner",
      "days": "15",
      "progress": 0.5,
      "clients": 138,
    },
  ];


  @override
  Widget build(BuildContext context) {
    List<dynamic> combinedList = [...latestWorkoutArr, ...latestMealArr];
    combinedList.shuffle(Random());
  
    return Scaffold(
      backgroundColor: Styles.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const ExpHome()));
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
          'Program Progress',
          style: Styles.headline20,
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ExpCreatedProgram()));
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
                FluentSystemIcons.ic_fluent_person_regular,
                size: 20,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text(
                      'Program Clients',
                      style: Styles.title,
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 10),
                      height: 190,
                      width: double.maxFinite,
                      alignment: Alignment.center,
                      child: ExpClientsChart(),
                    ),
                  ],
                ),

                const Gap(20),
                Text(
                  "Highest Clients",
                  style: Styles.title,
                ),
                ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      var item = combinedList[index] as Map? ?? {};
              
                      if (item.containsKey("duration") && item.containsKey("kcal")) {
                        // It's a workout item
                        return InkWell(
                          onTap: () {
                            Navigator.push(context,
                              MaterialPageRoute(
                                builder: (context) =>
                                  ViewWorkoutDetails(dObj: item),
                              ),
                            );
                          },
                          child: ProgramRow(image: item["image"], 
                            title: item["name"], 
                            bottomText: "${item["duration"]} minutes | ${item["kcal"]} Calories",
                            showToggleSwitch: false,
                            )
                          );
                      } else {
                        // It's a meal item
                        return InkWell(
                          onTap: () {
                            Navigator.push(context,
                              MaterialPageRoute(
                                builder: (context) =>
                                  ViewMealDetails(dObj: item),
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

                const Gap(20),
                Text(
                  "Lowest Clients",
                  style: Styles.title,
                ),
                ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      var item = combinedList[index] as Map? ?? {};
              
                      if (item.containsKey("duration") && item.containsKey("kcal")) {
                        // It's a workout item
                        return InkWell(
                          onTap: () {
                            Navigator.push(context,
                              MaterialPageRoute(
                                builder: (context) =>
                                  ViewWorkoutDetails(dObj: item),
                              ),
                            );
                          },
                          child: ProgramRow(image: item["image"], 
                            title: item["name"], 
                            bottomText: "${item["duration"]} minutes | ${item["kcal"]} Calories",
                            showToggleSwitch: false,
                            )
                          );
                      } else {
                        // It's a meal item
                        return InkWell(
                          onTap: () {
                            Navigator.push(context,
                              MaterialPageRoute(
                                builder: (context) =>
                                  ViewMealDetails(dObj: item),
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
              ],
            ),
          ),
        ],
      ),
      
      
      floatingActionButton: FloatingActionButton(
        backgroundColor: Styles.primaryColor,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 170, // Adjust the height as needed
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Styles.secondColor),
                      ),
                      onPressed: () {
                        // Handle the first choice
                        Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) => const CreateWorkout()));
                      },
                      child: Text(
                        "Create a Workout Plan",
                        style: Styles.headline20,),
                    ),
                    const Gap(10),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Styles.secondColor),
                      ),
                      onPressed: () {
                        // Handle the first choice
                        Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) => const CreateMeal()));
                      },
                      child: Text(
                        "Create a Meal Plan",
                        style: Styles.headline20,),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
    );
  }
}


//Clients Activity Chart
class ExpClientsChart extends StatelessWidget {
  ExpClientsChart({super.key});

  // final pilateColor = Colors.blue;
  final workoutColor = Styles.secondColor;
  final betweenSpace = 0.2;

  BarChartGroupData generateGroupData(
    int x,
    double total,
  ) {
    return BarChartGroupData(
      x: x,
      groupVertically: true,
      barRods: [
        BarChartRodData(
          fromY: 0,
          toY: total,
          color: workoutColor,
          width: 12,
        ),
      ],
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(
        color: Colors.black, fontWeight: FontWeight.w500, fontSize: 12);
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'JAN';
        break;
      case 1:
        text = 'FEB';
        break;
      case 2:
        text = 'MAR';
        break;
      case 3:
        text = 'APR';
        break;
      case 4:
        text = 'MAY';
        break;
      case 5:
        text = 'JUN';
        break;
      case 6:
        text = 'JUL';
        break;
      case 7:
        text = 'AUG';
        break;
      case 8:
        text = 'SEP';
        break;
      case 9:
        text = 'OCT';
        break;
      case 10:
        text = 'NOV';
        break;
      case 11:
        text = 'DEC';
        break;
      default:
        text = '';
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 300,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceBetween,
          titlesData: FlTitlesData(
            leftTitles: const AxisTitles(),
            rightTitles: const AxisTitles(),
            topTitles: const AxisTitles(),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: bottomTitles,
                reservedSize: 25,
              ),
            ),
          ),
          barTouchData: BarTouchData(enabled: false),
          borderData: FlBorderData(show: false),
          gridData: const FlGridData(show: false),
           barGroups: [
            generateGroupData(0, 2),
            generateGroupData(1, 2),
            generateGroupData(2, 1.3),
            generateGroupData(3, 3.1),
            generateGroupData(4, 0.8),
            generateGroupData(5, 2),
            generateGroupData(6, 1.3),
            generateGroupData(7, 2.3),
            generateGroupData(8, 2),
            generateGroupData(9, 1.2),
            generateGroupData(10, 1),
            generateGroupData(11, 2),
          ],
        ),
      ),
    );
  }
}