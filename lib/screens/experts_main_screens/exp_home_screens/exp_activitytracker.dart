import 'package:fl_chart/fl_chart.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/custom_dropdown.dart';
import 'package:ifit/common/widgets/more_icon.dart';
import 'package:ifit/screens/clients_main_screens/profile_screens/activity_history.dart';

class ExpActivityTracker extends StatefulWidget {
  const ExpActivityTracker({super.key});

  @override
  State<ExpActivityTracker> createState() => _ExpActivityTrackerState();
}

class _ExpActivityTrackerState extends State<ExpActivityTracker> {
  int touchedIndex = -1;

  List actHistoryArr = [
    {
      "image": "assets/images/meal/nigiri.png",
      "title": "You have Created Nigiri lunch",
      "time": "About 1 minutes ago"
    },
    {
      "image": "assets/icons/Lower-Weights.png",
      "title": "You have Edited the Lowerbody Weights",
      "time": "About 3 hours ago"
    },
    {
      "image": "assets/images/meal/salad.png",
      "title": "You have Deleted Salad Dinner",
      "time": "About 3 hours ago"
    },
    {
      "image": "assets/icons/workout-pic.png",
      "title": "You have Created the 15 days Full Bo...",
      "time": "29 May"
    },
    {
      "image": "assets/images/experts/expert3.jpg",
      "title": "You have Followed Dr. Harley Quinn",
      "time": "8 April"
    },
    {
      "image": "assets/icons/Ab-workout.png",
      "title": "You removed Ab Workout to your Favorites",
      "time": "8 April"
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
            'Activity Tracker',
            style: Styles.headline20,
          ),
        ),
        body: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    //Activity Progress
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Time Spent',
                        style: Styles.title,
                      ),
                      CustomDropdown(items: const ["This Week", "Last Week"], 
                      hintText: "Weekly",
                      onChanged: (value){}),
                    ],
                  ),
                  const Gap(10),
                  Container(
                    padding: const EdgeInsets.only(top: 10),
                    height: 190,
                    width: double.maxFinite,
                    alignment: Alignment.center,
                    child: const ActivityBarChart(),
                  ),
                  const Gap(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Activity History",
                        style: Styles.title
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                 ActivtyHistoryScreen(actHistoryArr: actHistoryArr.cast<Map<dynamic, dynamic>>())
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
                  ListView.builder(
                    // WorkoutRowContainer Content
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      var actObj = actHistoryArr[index] as Map? ?? {};
                      return ActivityHistoryRow(actObj: actObj);
                    },
                  ),

                ], //Main Children
              ),
            ),
          ],
        ));
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
                Styles.seeMore.copyWith(
                  color: Colors.white,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: '${(rod.toY - 1).toStringAsFixed(1)} hrs',
                    style: Styles.text12.copyWith(
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
              touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
            });
          },
        ),
        titlesData: FlTitlesData(
          show: true,
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: getTitles,
              reservedSize: 38,
            ),
          ),
          leftTitles: const AxisTitles(
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
    var style = Styles.text12.copyWith(
      color: Styles.fadeTextColor,
      fontWeight: FontWeight.w500,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = Text('Sun', style: style);
        break;
      case 1:
        text = Text('Mon', style: style);
        break;
      case 2:
        text = Text('Tue', style: style);
        break;
      case 3:
        text = Text('Wed', style: style);
        break;
      case 4:
        text = Text('Thu', style: style);
        break;
      case 5:
        text = Text('Fri', style: style);
        break;
      case 6:
        text = Text('Sat', style: style);
        break;
      default:
        text = Text('', style: style);
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
            return makeGroupData(0, 5, "hrs", Styles.gradientColor,
                isTouched: i == touchedIndex);
          case 1:
            return makeGroupData(1, 10.5, "hrs", Styles.gradientColor,
                isTouched: i == touchedIndex);
          case 2:
            return makeGroupData(2, 5, "hrs", Styles.gradientColor,
                isTouched: i == touchedIndex);
          case 3:
            return makeGroupData(3, 7.5, "hrs", Styles.gradientColor,
                isTouched: i == touchedIndex);
          case 4:
            return makeGroupData(4, 3, "hrs", Styles.gradientColor,
                isTouched: i == touchedIndex);
          case 5:
            return makeGroupData(5, 5.5, "hrs", Styles.gradientColor,
                isTouched: i == touchedIndex);
          case 6:
            return makeGroupData(6, 8.5, "hrs", Styles.gradientColor,
                isTouched: i == touchedIndex);
          default:
            return throw Error();
        }
      });

  BarChartGroupData makeGroupData(
    int x,
    double y,
    String hours,
    List<Color> barColor, {
    bool isTouched = false,
    double width = 22,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          gradient: LinearGradient(
              colors: barColor,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
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

class ActivityHistoryRow extends StatelessWidget {
  final Map actObj;
  const ActivityHistoryRow({super.key, required this.actObj});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              actObj["image"].toString(),
              width: 40,
              height: 40,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                actObj["title"].toString(),
                style: Styles.text12
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                actObj["time"].toString(),
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          )),
          const MoreIcon(
            options: ['Remove'],
            iconData: FluentSystemIcons.ic_fluent_more_vertical_filled,
          )
        ],
      ),
    );
  }
}



//Today Target Container
class TodayTargetContainer extends StatefulWidget {
  final String icon;
  final String value;
  final String title;

  const TodayTargetContainer({super.key, required this.icon, required this.value, required this.title});

  @override
  State<TodayTargetContainer> createState() => _TodayTargetContainerState();
}

class _TodayTargetContainerState extends State<TodayTargetContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Image.asset(
           widget.icon,
            width: 40,
            height: 40,
            fit: BoxFit.contain,
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (bounds) {
                  return LinearGradient(
                          colors: Styles.gradientColor,
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight)
                      .createShader(
                          Rect.fromLTRB(0, 0, bounds.width, bounds.height));
                },
                child: Text(
                  widget.value,
                  style: Styles.seeMore.copyWith(
                      color: Colors.white.withOpacity(0.7),
                      fontWeight: FontWeight.w700,
                      ),
                ),
              ),
              Text(
                widget.title,
                style: Styles.text12
              ),
            ],
          ))
        ],
      ),
    );
  }
}