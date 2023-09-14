import 'package:fl_chart/fl_chart.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/main_button.dart';
import 'package:ifit/common/widgets/next_navigation_container.dart';
import 'package:ifit/common/widgets/workout_row_container.dart';
import 'package:ifit/screens/main_screens/main_bottom_bar.dart';
import 'package:ifit/screens/main_screens/notifications.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';
import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  List lastWorkoutArr = [
    {
      "name": "Full Body Workout",
      "image": "assets/icons/workout-pic.png",
      "kcal": "180",
      "time": "20",
      "progress": 0.3
    },
    {
      "name": "Lower Body Workout",
      "image": "assets/icons/workout-pic.png",
      "kcal": "200",
      "time": "30",
      "progress": 0.4
    },
    {
      "name": "Ab Workout",
      "image": "assets/icons/workout-pic.png",
      "kcal": "300",
      "time": "40",
      "progress": 0.7
    },
  ];

List<int> showingTooltipOnSpots = [21];

  List<FlSpot> get allSpots => const [
        FlSpot(0, 20),
        FlSpot(1, 25),
        FlSpot(2, 40),
        FlSpot(3, 50),
        FlSpot(4, 35),
        FlSpot(5, 40),
        FlSpot(6, 30),
        FlSpot(7, 20),
        FlSpot(8, 25),
        FlSpot(9, 40),
        FlSpot(10, 50),
        FlSpot(11, 35),
        FlSpot(12, 50),
        FlSpot(13, 60),
        FlSpot(14, 40),
        FlSpot(15, 50),
        FlSpot(16, 20),
        FlSpot(17, 25),
        FlSpot(18, 40),
        FlSpot(19, 50),
        FlSpot(20, 35),
        FlSpot(21, 80),
        FlSpot(22, 30),
        FlSpot(23, 20),
        FlSpot(24, 25),
        FlSpot(25, 40),
        FlSpot(26, 50),
        FlSpot(27, 35),
        FlSpot(28, 50),
        FlSpot(29, 60),
        FlSpot(30, 40)
      ];

  List waterArr = [
    {"title": "7pm - 8pm", "subtitle": "Stretching"},
    {"title": "5pm - 6:30pm", "subtitle": "Full Body"},
    {"title": "8am - 9pm", "subtitle": "Abdominal"},
    {"title": "7:30am - 7:50am", "subtitle": "Stretching"},
    {"title": "6:30am - 7am", "subtitle": "Meal"},
  ];

  @override
  Widget build(BuildContext context) {
  final lineBarsData = [
      LineChartBarData(
        showingIndicators: showingTooltipOnSpots,
        spots: allSpots,
        isCurved: false,
        barWidth: 3,
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(
            colors: Styles.gradientColor, 
            begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        dotData: const FlDotData(show: false),
        gradient: LinearGradient(
          colors: Styles.gradientColor,
        ),
      ),
    ];

    final tooltipsOnBar = lineBarsData[0];

    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Container(
            padding: const EdgeInsets.all(15),
            child: ListView(
              shrinkWrap: true,
              children: [
                Column(
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
                                  builder: (context) => const Notifications()));
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
                                builder: (context) => const ActivityTrackerNavbar()));
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
                                      children: waterArr.map((wObj) { //schedule content
                                        var isLast = wObj == waterArr.last;
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
                                    onTap: () {
                                      Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => const ActivityTrackerNavbar(),
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
                    NextNavigationContainer(title: 'Workout Progress',
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
                            items: ["Weekly", "Monthly"]
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
                    padding: const EdgeInsets.only(left: 15),
                    height: 200,
                    width: double.maxFinite,
                    child: LineChart(
                      LineChartData(
                        showingTooltipIndicators:
                            showingTooltipOnSpots.map((index) {
                          return ShowingTooltipIndicators([
                            LineBarSpot(
                              tooltipsOnBar,
                              lineBarsData.indexOf(tooltipsOnBar),
                              tooltipsOnBar.spots[index],
                            ),
                          ]);
                        }).toList(),
                        lineTouchData: LineTouchData(
                          enabled: true,
                          handleBuiltInTouches: false,
                          touchCallback: (FlTouchEvent event,
                              LineTouchResponse? response) {
                            if (response == null ||
                                response.lineBarSpots == null) {
                              return;
                            }
                            if (event is FlTapUpEvent) {
                              final spotIndex =
                                  response.lineBarSpots!.first.spotIndex;
                              showingTooltipOnSpots.clear();
                              setState(() {
                                showingTooltipOnSpots.add(spotIndex);
                              });
                            }
                          },
                          mouseCursorResolver: (FlTouchEvent event,
                              LineTouchResponse? response) {
                            if (response == null ||
                                response.lineBarSpots == null) {
                              return SystemMouseCursors.basic;
                            }
                            return SystemMouseCursors.click;
                          },
                          getTouchedSpotIndicator: (LineChartBarData barData,
                              List<int> spotIndexes) {
                            return spotIndexes.map((index) {
                              return TouchedSpotIndicatorData(
                                const FlLine(
                                  color: Colors.transparent,
                                ),
                                FlDotData(
                                  show: true,
                                  getDotPainter:
                                      (spot, percent, barData, index) =>
                                          FlDotCirclePainter(
                                    radius: 3,
                                    color: Colors.white,
                                    strokeWidth: 3,
                                    strokeColor: Styles.secondColor,
                                  ),
                                ),
                              );
                            }).toList();
                          },

                          touchTooltipData: LineTouchTooltipData(
                            tooltipBgColor: Styles.secondColor,
                            tooltipRoundedRadius: 20,
                            getTooltipItems: (List<LineBarSpot> lineBarsSpot) {
                              return lineBarsSpot.map((lineBarSpot) {
                                return LineTooltipItem(
                                  "${lineBarSpot.x.toInt()} Workouts",
                                  const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              }).toList();
                            },
                          ),
                        ),
                        lineBarsData: lineBarsData1,
                        minY: -0.5,
                        maxY: 110,
                        titlesData: FlTitlesData(
                            show: true,
                            leftTitles: const AxisTitles(),
                            topTitles: const AxisTitles(),
                            bottomTitles: AxisTitles(
                              sideTitles: bottomTitles,
                            ),
                            rightTitles: AxisTitles(
                              sideTitles: rightTitles,
                            )),
                        gridData: FlGridData(
                          show: true,
                          drawHorizontalLine: true,
                          horizontalInterval: 25,
                          drawVerticalLine: false,
                          getDrawingHorizontalLine: (value) {
                            return FlLine(
                              color: Colors.grey.withOpacity(0.15),
                              strokeWidth: 2,
                            );
                          },
                        ),
                        borderData: FlBorderData(
                          show: true,
                          border: Border.all(
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                    )),
                  const Gap(15),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Latest Workout",
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

                ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: lastWorkoutArr.length,
                    itemBuilder: (context, index) {
                      var wObj = lastWorkoutArr[index] as Map? ?? {};
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
                          child: WorkoutRowContainer(wObj: wObj));
                    }),
                    const Gap(50),
                  ],
                ),
              ],
            ),
          ),
        ),
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

LineTouchData get lineTouchData1 => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
        ),
      );

  List<LineChartBarData> get lineBarsData1 => [
        lineChartBarData1_1,
        lineChartBarData1_2,
      ];

  LineChartBarData get lineChartBarData1_1 => LineChartBarData(
        isCurved: true,
        gradient: LinearGradient(colors: [
          Styles.fadeTextColor.withOpacity(0.5),
          Styles.primaryColor.withOpacity(0.5),
        ]),
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, 35),
          FlSpot(2, 70),
          FlSpot(3, 40),
          FlSpot(4, 80),
          FlSpot(5, 25),
          FlSpot(6, 70),
          FlSpot(7, 35),
        ],
      );

  LineChartBarData get lineChartBarData1_2 => LineChartBarData(
        isCurved: true,
        gradient: LinearGradient(colors: [
          Styles.secondColor.withOpacity(0.5),
          Styles.primaryColor.withOpacity(0.5),
        ]),
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(
          show: false,
        ),
        spots: const [
          FlSpot(1, 80),
          FlSpot(2, 50),
          FlSpot(3, 90),
          FlSpot(4, 40),
          FlSpot(5, 80),
          FlSpot(6, 35),
          FlSpot(7, 60),
        ],
      );

SideTitles get rightTitles => const SideTitles(
        getTitlesWidget: rightTitleWidgets,
        showTitles: true,
        interval: 20,
        reservedSize: 40,
      );

  Widget rightTitleWidgets(double value, TitleMeta meta) {
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0%';
        break;
      case 20:
        text = '20%';
        break;
      case 40:
        text = '40%';
        break;
      case 60:
        text = '60%';
        break;
      case 80:
        text = '80%';
        break;
      case 100:
        text = '100%';
        break;
      default:
        return Container();
    }

    return Text(text,
        style: TextStyle(
          color: Styles.fadeTextColor,
          fontSize: 12,
        ),
        textAlign: TextAlign.center);
  }

  SideTitles get bottomTitles => const SideTitles(
        showTitles: true,
        reservedSize: 32,
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );
  
  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    var style = TextStyle(
      color: Styles.fadeTextColor,
      fontSize: 12,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = Text('Sun', style: style);
        break;
      case 2:
        text = Text('Mon', style: style);
        break;
      case 3:
        text = Text('Tue', style: style);
        break;
      case 4:
        text = Text('Wed', style: style);
        break;
      case 5:
        text = Text('Thu', style: style);
        break;
      case 6:
        text = Text('Fri', style: style);
        break;
      case 7:
        text = Text('Sat', style: style);
        break;
      default:
        text = const Text('');
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }
