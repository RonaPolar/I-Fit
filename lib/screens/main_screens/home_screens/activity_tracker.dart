import 'package:fl_chart/fl_chart.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/program_row.dart';
import 'package:ifit/common/widgets/more_icon.dart';
import 'package:ifit/common/widgets/today_target_container.dart';

class ActivityTrackerScreen extends StatefulWidget {
  const ActivityTrackerScreen({super.key});

  @override
  State<ActivityTrackerScreen> createState() => _ActivityTrackerScreenState();
}

class _ActivityTrackerScreenState extends State<ActivityTrackerScreen> {
  int touchedIndex = -1;
  List latestActivityArr = [
    {
      "name": "Full Body Exercises",
      "image": "assets/icons/workout-pic.png",
      "kcal": "180",
      "time": "20",
      "progress": 0.3,
      "duration": "21",
    },
    {
      "name": "Upper Body Weights",
      "image": "assets/icons/Lower-Weights.png",
      "kcal": "200",
      "time": "30",
      "progress": 0.4,
      "duration": "14",
    },
    {
      "name": "Salad",
      "image": "assets/icons/salad.png",
      "kcal": "200",
      "categories": "Lunch",
      "progress": 0.8,
      "duration": "7",
    },
    {
      "name": "Ab Exercises",
      "image": "assets/icons/Ab-workout.png",
      "kcal": "300",
      "time": "40",
      "progress": 0.7,
      "duration": "14",
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
        title: Text('Activity Tracker',
        style: Styles.headlineSmall,),
      ),

     body: ListView(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              decoration: BoxDecoration(
                color: Styles.secondColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(15),),
              child: Column(
                children: [
                  Row(
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
                        width: 30,
                        height: 30,
                        child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: Styles.gradientColor,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                          child: MaterialButton(
                            onPressed: () {
                              // Navigator.of(context).push(
                              //   MaterialPageRoute(
                              //   builder: (context) => const ActivityTrackerNavbar()));
                            },
                            padding: EdgeInsets.zero,
                              height: 30,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                                textColor: primary,
                                minWidth: double.maxFinite,
                                elevation: 0,
                                color: Colors.transparent,
                            child: const Icon(
                              FluentSystemIcons.ic_fluent_add_filled,
                              color: Colors.white,
                              size: 15,
                            ),
                          )),     
                        ),
                      ],
                    ),
                  const Gap(10),
                  const Row(
                    children: [
                      Expanded(
                        child: TodayTargetContainer(icon: "assets/icons/workout-pic.png", value: "20 mins", title: "Full Body"),
                        ),
                      Gap(10),
                      Expanded(
                        child: TodayTargetContainer(icon: "assets/icons/salad.png", value: "Lunch", title: "Salad"),
                        ),
                    ],
                  )
                ],
              ),
            ),
            
            const Gap(25),
            Row(  //Activity Progress
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Time Spent',
                 style:  TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
                ),
              Container(  //Weekly DropDOwn Button
                  height: 30,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      items: ["Weekly", "Last Week"]
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
            Container(  
              padding: const EdgeInsets.only(top: 10),
              height: 200,
              width: double.maxFinite,
              alignment: Alignment.center,
              child: const ActivityBarChart(),
              ),

            const Gap(15),
            const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Latest Activity",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
              MoreIcon(options: ['Today', 'This Week', 'This Month'],
                )
              ],
            ),
            SizedBox(
              height: 270,
              child: SingleChildScrollView(
                child: ListView.builder( //WorkoutRowContainer Content
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: latestActivityArr.length,
                  itemBuilder: (context, index) {
                    var wObj = latestActivityArr[index] as Map? ?? {};
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
                          progress: wObj["progress"] as double?,
                          ));
                  }),
              ),
            ),

          ],//Main Children
          ),
        ),
      ],
     )
    );
  }
}

class ActivityBarChart extends StatefulWidget {
  const ActivityBarChart({super.key});

  @override
  State<ActivityBarChart> createState() => _ActivityBarChartState();
}

class _ActivityBarChartState extends State<ActivityBarChart> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return BarChart(      
      BarChartData(
             barTouchData: BarTouchData(
              touchTooltipData: BarTouchTooltipData(
                tooltipBgColor: Colors.red,
                tooltipHorizontalAlignment: FLHorizontalAlignment.right,
                tooltipMargin: 10,
                getTooltipItem: (group, groupIndex, rod, rodIndex) {
                  String weekDay;
                  switch (group.x) {
                    case 0:
                      weekDay = 'Sunday';
                      break;
                    case 1:
                      weekDay = 'Monday';
                      break;
                    case 2:
                      weekDay = 'Tuesday';
                      break;
                    case 3:
                      weekDay = 'Wednesday';
                      break;
                    case 4:
                      weekDay = 'Thursday';
                      break;
                    case 5:
                      weekDay = 'Friday';
                      break;
                    case 6:
                      weekDay = 'Saturday';
                      break;
                    default:
                      throw Error();
                  }
                  return BarTooltipItem(
                    '$weekDay\n',
                    const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '${(rod.toY - 1).toStringAsFixed(1)} hrs',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  );
                },
              ),
              touchCallback: (FlTouchEvent event, barTouchResponse) {
                setState(() {
                  if (!event.isInterestedForInteractions ||
                      barTouchResponse == null ||
                      barTouchResponse.spot == null) {
                    touchedIndex = -1;
                    return;
                  }
                  touchedIndex =
                      barTouchResponse.spot!.touchedBarGroupIndex;
                });
              },
            ),
            titlesData: FlTitlesData(
              show: true,
              rightTitles:  const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              topTitles:  const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: getTitles,
                  reservedSize: 38,
                ),
              ),
              leftTitles:  const AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false,
                ),
              ),
            ),
            borderData: FlBorderData(
              show: false,
            ),
            barGroups: showingGroups(),
            gridData: const FlGridData(show: false),
      ),
    );
  }

    Widget getTitles(double value, TitleMeta meta) {
    var style = TextStyle(
      color: Styles.fadeTextColor,
      fontWeight: FontWeight.w500,
      fontSize: 12,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text =  Text('Sun', style: style);
        break;
      case 1:
        text =  Text('Mon', style: style);
        break;
      case 2:
        text =  Text('Tue', style: style);
        break;
      case 3:
        text =  Text('Wed', style: style);
        break;
      case 4:
        text =  Text('Thu', style: style);
        break;
      case 5:
        text =  Text('Fri', style: style);
        break;
      case 6:
        text =  Text('Sat', style: style);
        break;
      default:
        text =  Text('', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: text,
    );
  }
   List<BarChartGroupData> showingGroups() => List.generate(7, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, 5, "hrs", Styles.gradientColor , isTouched: i == touchedIndex);
          case 1:
            return makeGroupData(1, 10.5, "hrs", Styles.gradientColor , isTouched: i == touchedIndex);
          case 2:
            return makeGroupData(2, 5, "hrs", Styles.gradientColor , isTouched: i == touchedIndex);
          case 3:
            return makeGroupData(3, 7.5, "hrs", Styles.gradientColor , isTouched: i == touchedIndex);
          case 4:
            return makeGroupData(4, 3, "hrs", Styles.gradientColor  , isTouched: i == touchedIndex);
          case 5:
            return makeGroupData(5, 5.5, "hrs", Styles.gradientColor, isTouched: i == touchedIndex);
          case 6:
            return makeGroupData(6, 8.5, "hrs", Styles.gradientColor  , isTouched: i == touchedIndex);
          default:
            return throw Error();
        }
      });

    BarChartGroupData makeGroupData(
    int x,
    double y,
    String hours,
    List<Color> barColor,
     {
    bool isTouched = false,
    
    double width = 22,
    List<int> showTooltips = const [],
  }) {
    
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          gradient: LinearGradient(colors: barColor, begin: Alignment.topCenter, end: Alignment.bottomCenter ),
          width: width,
          borderSide: isTouched
              ? const BorderSide(color: Colors.green)
              : const BorderSide(color: Colors.white, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 20,
            color: Colors.grey.shade200,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }
}