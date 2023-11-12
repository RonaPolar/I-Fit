import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/utils/common_utils.dart';
import 'package:ifit/common/widgets/charts/workout_linechart.dart';
import 'package:ifit/common/widgets/main_button.dart';
import 'package:ifit/screens/clients_main_screens/main_bottom_bar.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';

class ProgressResult extends StatefulWidget {
  final DateTime date1;
  final DateTime date2;
  const ProgressResult({super.key, required this.date1, required this.date2});

  @override
  State<ProgressResult> createState() => _ProgressResultState();
}

class _ProgressResultState extends State<ProgressResult> {
  int selectButton = 0;

  List imaArr = [
    {
      "title": "Front Facing",
      "month_1_image": "assets/images/pp_1.png",
      "month_2_image": "assets/images/pp_2.png",
    },
    {
      "title": "Back Facing",
      "month_1_image": "assets/images/pp_3.png",
      "month_2_image": "assets/images/pp_4.png",
    },
    {
      "title": "Left Facing",
      "month_1_image": "assets/images/pp_5.png",
      "month_2_image": "assets/images/pp_6.png",
    },
    {
      "title": "Right Facing",
      "month_1_image": "assets/images/pp_7.png",
      "month_2_image": "assets/images/pp_8.png",
    },
  ];

  List statArr = [
    {
      "title": "Lose Weight",
      "diff_per": "33",
      "month_1_per": "33%",
      "month_2_per": "67%",
    },
    {
      "title": "Height Increase",
      "diff_per": "88",
      "month_1_per": "88%",
      "month_2_per": "12%",
    },
    {
      "title": "Muscle Mass Increase",
      "diff_per": "57",
      "month_1_per": "57%",
      "month_2_per": "43%",
    },
    {
      "title": "Abs",
      "diff_per": "89",
      "month_1_per": "89%",
      "month_2_per": "11%",
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Styles.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
              builder: (context) => const ProgressTrackerNavBar()));
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
          'Result',
          style: Styles.headline20,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(
                children: [
                  Container(
                    height: 55,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(30)),
                    child: Stack(alignment: Alignment.center, children: [
                      AnimatedContainer(
                        alignment: selectButton == 0
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                        duration: const Duration(milliseconds: 300),
                        child: Container(
                          width: (media.width * 0.5) - 40,
                          height: 40,
                          decoration: BoxDecoration(
                              gradient:
                                  LinearGradient(colors: Styles.gradientColor),
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    selectButton = 0;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Text(
                                    "Photo",
                                    textAlign: TextAlign.center,
                                    style: Styles.text15bold.copyWith(
                                      color: selectButton == 0
                                          ? Colors.white
                                          : Colors.grey,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    selectButton = 1;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Text(
                                    "Statistic",
                                    textAlign: TextAlign.center,
                                    style: Styles.text15bold.copyWith(
                                      color: selectButton == 1
                                          ? Colors.white
                                          : Colors.grey,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ]),
                  ),

                  const Gap(20),
                  if (selectButton == 0)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Average Progress",
                              style: Styles.title.copyWith(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "Good",
                              style: Styles.seeMore.copyWith(
                                  color: Styles.primaryColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const Gap(5),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            SimpleAnimationProgressBar(
                              height: 20,
                              width: media.width - 40,
                              backgroundColor: Colors.grey.shade100,
                              foregrondColor: Colors.purple,
                              ratio: 0.62,
                              direction: Axis.horizontal,
                              curve: Curves.fastLinearToSlowEaseIn,
                              duration: const Duration(seconds: 3),
                              borderRadius: BorderRadius.circular(10),
                              gradientColor: LinearGradient(
                                  colors: Styles.gradientColor,
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight),
                            ),
                            const Text(
                              "62%",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        
                        const Gap(25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              dateToString(widget.date1, formatStr: "MMMM"),
                              style: Styles.text15bold
                            ),
                            Text(
                              dateToString(widget.date2, formatStr: "MMMM"),
                              style: Styles.text15bold
                            ),
                          ],
                        ),
                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: imaArr.length,
                            itemBuilder: (context, index) {
                              var iObj = imaArr[index] as Map? ?? {};

                              return Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Gap(15),
                                    Text(
                                      iObj["title"].toString(),
                                      style: Styles.text15bold.copyWith(
                                        color: Styles.fadeTextColor,
                                        ),
                                    ),
                                    const Gap(8),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: AspectRatio(
                                            aspectRatio: 1,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.grey.shade200,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                child: Image.asset(
                                                  iObj["month_1_image"]
                                                      .toString(),
                                                  width: double.maxFinite,
                                                  height: double.maxFinite,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const Gap(15),
                                        Expanded(
                                          child: AspectRatio(
                                            aspectRatio: 1,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.grey.shade200,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                child: Image.asset(
                                                  iObj["month_2_image"]
                                                      .toString(),
                                                  width: double.maxFinite,
                                                  height: double.maxFinite,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ]);
                            }),
                      ],
                    ),

                  //Stats
                  if (selectButton == 1)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          width: double.maxFinite,
                          child: const LineChartWidget(),
                        ),
                        const Gap(20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              dateToString(widget.date1, formatStr: "MMMM"),
                              style: Styles.text15bold
                            ),
                            Text(
                              dateToString(widget.date2, formatStr: "MMMM"),
                              style: Styles.text15bold
                            ),
                          ],
                        ),
                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: statArr.length,
                            itemBuilder: (context, index) {
                              var iObj = statArr[index] as Map? ?? {};

                              return Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Gap(20),
                                    Text(
                                      iObj["title"].toString(),
                                      style: Styles.text15bold
                                    ),
                                    const Gap(5),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 25,
                                          child: Text(
                                            iObj["month_1_per"].toString(),
                                            textAlign: TextAlign.right,
                                            style: Styles.normal.copyWith(
                                              fontSize: 12,
                                            )
                                          ),
                                        ),
                                        SimpleAnimationProgressBar(
                                          height: 10,
                                          width: media.width - 120,
                                          backgroundColor: Styles.bgColor,
                                          foregrondColor: Styles.secondColor.withOpacity(0.5),
                                          ratio: (double.tryParse(
                                                      iObj["diff_per"]
                                                          .toString()) ??
                                                  0.0) /
                                              100.0,
                                          direction: Axis.horizontal,
                                          curve: Curves.fastLinearToSlowEaseIn,
                                          duration: const Duration(seconds: 3),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        SizedBox(
                                          width: 25,
                                          child: Text(
                                            iObj["month_2_per"].toString(),
                                            textAlign: TextAlign.left,
                                            style: Styles.normal.copyWith(
                                              fontSize: 12
                                            )
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]);
                            }),
                            const Gap(125)
                      ],
                    ),

                  const Gap(15),
                  MainButton(
                    title: "Back to Home",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeNavBar()));
                }),
                ],
              ),
            ),
            
          ], //Main Children
        ),
      ),
    );
  }
}
