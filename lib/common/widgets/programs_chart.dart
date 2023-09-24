import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:ifit/common/utils/app_styles.dart';

class ProgramsChart extends StatelessWidget {
  ProgramsChart({super.key});

  // final pilateColor = Colors.blue;
  final workoutColor = Styles.secondColor;
  final mealColor = Styles.primaryColor;
  final betweenSpace = 0.2;

  BarChartGroupData generateGroupData(
    int x,
    // double pilates,
    double quickWorkout,
    double cycling,
  ) {
    return BarChartGroupData(
      x: x,
      groupVertically: true,
      barRods: [
        // BarChartRodData(
        //   fromY: 0,
        //   toY: pilates,
        //   color: pilateColor,
        //   width: 5,
        // ),
        BarChartRodData(
          fromY: betweenSpace,
          toY: betweenSpace + quickWorkout,
          color: mealColor,
          width: 15,
        ),
        BarChartRodData(
          fromY: betweenSpace + quickWorkout + betweenSpace,
          toY: betweenSpace + quickWorkout + betweenSpace + cycling,
          color: workoutColor,
          width: 15,
        ),
      ],
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 14);
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Mon';
        break;
      case 1:
        text = 'Tue';
        break;
      case 2:
        text = 'Wed';
        break;
      case 3:
        text = 'Thu';
        break;
      case 4:
        text = 'Fri';
        break;
      case 5:
        text = 'Sat';
        break;
      case 6:
        text = 'Sun';
        break;
      default:
        text = '';
    }
    //   case 0:
    //     text = 'JAN';
    //     break;
    //   case 1:
    //     text = 'FEB';
    //     break;
    //   case 2:
    //     text = 'MAR';
    //     break;
    //   case 3:
    //     text = 'APR';
    //     break;
    //   case 4:
    //     text = 'MAY';
    //     break;
    //   case 5:
    //     text = 'JUN';
    //     break;
    //   case 6:
    //     text = 'JUL';
    //     break;
    //   case 7:
    //     text = 'AUG';
    //     break;
    //   case 8:
    //     text = 'SEP';
    //     break;
    //   case 9:
    //     text = 'OCT';
    //     break;
    //   case 10:
    //     text = 'NOV';
    //     break;
    //   case 11:
    //     text = 'DEC';
    //     break;
    //   default:
    //     text = '';
    // }
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          LegendsListWidget(
            legends: [
              // Legend('Pilates', pilateColor),
              Legend('Workouts',workoutColor),
              Legend('Meal', mealColor),
            ],
          ),
          AspectRatio(
            aspectRatio: 2,
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
                  generateGroupData(0, 2, 2),
                  generateGroupData(1, 2, 5),
                  generateGroupData(2, 1.3, 3.1),
                  generateGroupData(3, 3.1, 4),
                  generateGroupData(4, 0.8, 3.3),
                  generateGroupData(5, 2, 5.6),
                  generateGroupData(6, 1.3, 3.2),
                  // generateGroupData(7, 2.3, 3.2),
                  // generateGroupData(8, 2, 4.8),
                  // generateGroupData(9, 1.2, 3.2),
                  // generateGroupData(10, 1, 4.8),
                  // generateGroupData(11, 2, 4.4),
                ],
                // maxY: 11 + (betweenSpace * 3),
                // extraLinesData: ExtraLinesData(
                //   horizontalLines: [
                //     HorizontalLine(
                //       y: 3.3,
                //       color: Colors.black,
                //       strokeWidth: 1,
                //       dashArray: [20, 4],
                //     ),
                //     HorizontalLine(
                //       y: 8,
                //       color: workoutColor,
                //       strokeWidth: 1,
                //       dashArray: [20, 4],
                //     ),
                //     HorizontalLine(
                //       y: 11,
                //       color: cyclingColor,
                //       strokeWidth: 1,
                //       dashArray: [20, 4],
                //     ),
                //   ],
                // ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LegendWidget extends StatelessWidget {
  const LegendWidget({
    super.key,
    required this.name,
    required this.color,
  });
  final String name;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          name,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class LegendsListWidget extends StatelessWidget {
  const LegendsListWidget({
    super.key,
    required this.legends,
  });
  final List<Legend> legends;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      children: legends
          .map(
            (e) => LegendWidget(
              name: e.name,
              color: e.color,
            ),
          )
          .toList(),
    );
  }
}

class Legend {
  Legend(this.name, this.color);
  final String name;
  final Color color;
}





//Workout - Calories Chart
class LineChartWidget extends StatefulWidget {
  const LineChartWidget({super.key});

  @override
  State<LineChartWidget> createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {
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
            begin: Alignment.topCenter, 
            end: Alignment.bottomCenter,
          ),
        ),
        dotData: const FlDotData(show: false),
        gradient: LinearGradient(
          colors: Styles.gradientColor,
        ),
      ),
    ];

    final tooltipsOnBar = lineBarsData[0];

    return Container(
      padding: const EdgeInsets.only(left: 15),
      height: 200,
      width: double.maxFinite,
      child: LineChart(
        LineChartData(
          showingTooltipIndicators: showingTooltipOnSpots.map((index) {
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
            touchCallback: (FlTouchEvent event, LineTouchResponse? response) {
              if (response == null || response.lineBarSpots == null) {
                return;
              }
              if (event is FlTapUpEvent) {
                final spotIndex = response.lineBarSpots!.first.spotIndex;
                showingTooltipOnSpots.clear();
                setState(() {
                  showingTooltipOnSpots.add(spotIndex);
                });
              }
            },
            mouseCursorResolver: (FlTouchEvent event, LineTouchResponse? response) {
              if (response == null || response.lineBarSpots == null) {
                return SystemMouseCursors.basic;
              }
              return SystemMouseCursors.click;
            },
            getTouchedSpotIndicator: (LineChartBarData barData, List<int> spotIndexes) {
              return spotIndexes.map((index) {
                return TouchedSpotIndicatorData(
                  const FlLine(
                    color: Colors.transparent,
                  ),
                  FlDotData(
                    show: true,
                    getDotPainter: (spot, percent, barData, index) => FlDotCirclePainter(
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
                    "${lineBarSpot.x.toInt()} Calories",
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
            ),
          ),
          gridData: FlGridData(
            show: true,
            drawHorizontalLine: true,
            horizontalInterval: 25,
            drawVerticalLine: false,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: Colors.black.withOpacity(0.15),
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
      ),
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
        // lineChartBarData1_2,
      ];

  LineChartBarData get lineChartBarData1_1 => LineChartBarData( //curve lines
        isCurved: true,
        gradient: LinearGradient(colors: [
          Styles.primaryColor.withOpacity(0.6),
          Styles.secondColor.withOpacity(0.9),
        ]),
        barWidth: 3,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: true),
        belowBarData: BarAreaData(show: true, color: Colors.transparent),
        spots: const [
          FlSpot(1, 10),
          FlSpot(2, 70),
          FlSpot(3, 90),
          FlSpot(4, 80),
          FlSpot(5, 25),
          FlSpot(6, 70),
          FlSpot(7, 35),
        ],
      );

  // LineChartBarData get lineChartBarData1_2 => LineChartBarData( 
  //       isCurved: true,
  //       gradient: LinearGradient(colors: [
  //         Styles.primaryColor.withOpacity(0.5),
  //         Styles.secondColor.withOpacity(0.5),
  //       ]),
  //       barWidth: 2,
  //       isStrokeCapRound: true,
  //       dotData: const FlDotData(show: false),
  //       belowBarData: BarAreaData(
  //         show: false,
  //       ),
  //       spots: const [
  //         FlSpot(1, 80),
  //         FlSpot(2, 50),
  //         FlSpot(3, 90),
  //         FlSpot(4, 40),
  //         FlSpot(5, 80),
  //         FlSpot(6, 35),
  //         FlSpot(7, 60),
  //       ],
  //     );

SideTitles get rightTitles => const SideTitles(
        getTitlesWidget: rightTitleWidgets,
        showTitles: true,
        interval: 20,
        reservedSize: 40,
      );

  Widget rightTitleWidgets(double value, TitleMeta meta) {  //Workout Progress Percent Content
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0';
        break;
      case 20:
        text = '200';
        break;
      case 40:
        text = '400';
        break;
      case 60:
        text = '600';
        break;
      case 80:
        text = '800';
        break;
      case 100:
        text = '1000';
        break;
      default:
        return Container();
    }

    return Text(text,
        style: TextStyle(
          color: Styles.textColor,
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
  
  Widget bottomTitleWidgets(double value, TitleMeta meta) { //Workout Progress Content
    var style = TextStyle(
      color: Styles.textColor,
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
