import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/screens/clients_main_screens/main_bottom_bar.dart';
import 'package:ifit/screens/clients_main_screens/profile_screens/profile.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';

class ProgressTrackerScreen extends StatefulWidget {
  const ProgressTrackerScreen({super.key});

  @override
  State<ProgressTrackerScreen> createState() => _ProgressTrackerScreenState();
}

class _ProgressTrackerScreenState extends State<ProgressTrackerScreen> {

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
      "title": "Loss Weight",
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
      "title": "Average Level",
      "diff_per": "57",
      "month_1_per": "57%",
      "month_2_per": "43%",
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
              builder: (context) => const HomeNavBar()));
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
          'Progress Tracker',
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
                  Text("Profile Overview",
                    style: Styles.title),
                    const Gap(10),
                    const Row(
                      children: [
                        Expanded(
                            child: ProfileCell(value: '188cm', title: 'Height')
                            ),
                        Gap(10),
                        Expanded(
                            child: ProfileCell(value: '56kg', title: 'Weight')
                            ),
                        Gap(10),
                        Expanded(
                            child: ProfileCell(value: '22yo', title: 'Height')
                            ),
                      ],
                    ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "September",
                            style: Styles.text15bold
                          ),
                          Text(
                            "December",
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

              ],
            ),
          ),
          
        ], //Main Children
      ),
    ),
  );
}
}
