import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

//Programs Activity Chart
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
          width: 12,
        ),
        BarChartRodData(
          fromY: betweenSpace + quickWorkout + betweenSpace,
          toY: betweenSpace + quickWorkout + betweenSpace + cycling,
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
            generateGroupData(0, 2, 2),
            generateGroupData(1, 2, 5),
            generateGroupData(2, 1.3, 3.1),
            generateGroupData(3, 3.1, 4),
            generateGroupData(4, 0.8, 3.3),
            generateGroupData(5, 2, 5.6),
            generateGroupData(6, 1.3, 3.2),
            generateGroupData(7, 2.3, 3.2),
            generateGroupData(8, 2, 4.8),
            generateGroupData(9, 1.2, 3.2),
            generateGroupData(10, 1, 4.8),
            generateGroupData(11, 2, 4.4),
          ],
          // maxY: 11 + (betweenSpace * 2),
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
          //     // HorizontalLine(
          //     //   y: 11,
          //     //   color: cyclingColor,
          //     //   strokeWidth: 1,
          //     //   dashArray: [20, 4],
          //     // ),
          //   ],
          // ),
        ),
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
        Text(name, style: Styles.text15bold),
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





//PieChart Calories
class CaloriesPieChart extends StatefulWidget {
  const CaloriesPieChart({super.key});

  @override
  State<CaloriesPieChart> createState() => _CaloriesPieChartState();
}

class _CaloriesPieChartState extends State<CaloriesPieChart> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.center,
          child: SizedBox(
            width: 70,
            height: 70,
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
                  child: FittedBox(
                    child: Text(
                      "240kCal\nBurned",
                      textAlign: TextAlign.center,
                      style: Styles.text12.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 10),
                    ),
                  ),
                ),
                SimpleCircularProgressBar(
                  progressStrokeWidth: 10,
                  backStrokeWidth: 10,
                  progressColors: [
                    Styles.secondColor.withOpacity(0.5),
                    Styles.secondColor
                  ],
                  backColor: Colors.grey.shade200,
                  valueNotifier: ValueNotifier(30),
                  startAngle: -180,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}