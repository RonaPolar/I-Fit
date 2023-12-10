import 'package:fl_chart/fl_chart.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/screens/experts_main_screens/exp_bottom_bar.dart';
import 'package:ifit/screens/experts_main_screens/exp_discover_screens/my_programs/exp_my_programs.dart';

class ExpProgramScreen extends StatefulWidget {
  const ExpProgramScreen({super.key});

  @override
  State<ExpProgramScreen> createState() => _ExpProgramScreenState();
}

class _ExpProgramScreenState extends State<ExpProgramScreen> {
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
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
              ),
              const Gap(10),
              const Text(
                "Highest Clients"
              )
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Styles.primaryColor,
        onPressed: () {},
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
