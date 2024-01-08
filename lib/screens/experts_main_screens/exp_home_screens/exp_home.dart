import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/icon_text_icon.dart';
import 'package:ifit/common/widgets/main_button.dart';
import 'package:ifit/screens/experts_main_screens/exp_bottom_bar.dart';
import 'package:ifit/screens/experts_main_screens/exp_home_screens/exp_activity.dart';
import 'package:ifit/screens/experts_main_screens/exp_home_screens/exp_notifications.dart';
import 'package:ifit/screens/experts_main_screens/exp_program_screens/exp_program.dart';

class ExpHomeScreen extends StatefulWidget {
  const ExpHomeScreen({super.key});

  @override
  State<ExpHomeScreen> createState() => _ExpHomeScreenState();
}

class _ExpHomeScreenState extends State<ExpHomeScreen> {
  List experts = [
    {
      "name": "Dr. Otto Octavius",
      "image": "assets/images/experts/expert1.png",
      "profession": "Physician",
      "rate": "4.5",
      "mealCreated": "2",
      "workoutCreated": "3",
      "descriptions": "Hello! I completed my course in 2017 and have 5 years of experience working as Physician. If you like my programs I created, you can visit me at Manila Center at Makati City.",
    },
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
                          style: Styles.text15normal,
                        ),
                        Text(
                          'Dr. Otto Octavius',
                          style: Styles.headline20,
                        ),
                      ],
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const ExpNotifications()));
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
                              Text(
                                "Profile Rating by Clients",
                                style: Styles.text15bold.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "You have a High Rating",
                                style: Styles.seeMore.copyWith(
                                  color: Colors.white.withOpacity(0.7),
                                ),
                              ),
                              const Gap(12),
                              SizedBox(
                                  width: 110,
                                  height: 30,
                                  child: MainButton(
                                    title: "View More",
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const ExpProfile()));
                                    },
                                    textStyle: Styles.seeMore.copyWith(
                                      color: Colors.white,
                                    ),
                                  )),
                            ],
                          ),
                          Column(
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Icon(
                                    FluentSystemIcons.ic_fluent_star_filled,
                                    size: 80,
                                    color: Styles.bgColor,
                                  ),
                                  Text(
                                    '4.5',
                                    style: Styles.headline20
                                        .copyWith(color: Styles.primaryColor),
                                  ),
                                ],
                              ),
                            ],
                          )
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
                    color: Styles.secondColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Activity Tracker',
                        style: Styles.text15bold.copyWith(
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                          width: 80,
                          height: 30,
                          child: MainButton(
                            title: "Check",
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const ExpActivityHistory()));
                            },
                            textStyle: Styles.seeMore.copyWith(
                              color: Colors.white,
                            ),
                          )),
                    ],
                  ),
                ),
                const Gap(20),
                Text('Program Created', style: Styles.title),
                const Gap(10),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: double.maxFinite,
                        height: 100,
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(color: Colors.black26, blurRadius: 2),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Workouts',
                              style: Styles.title
                            ),
                            const Gap(5),
                            Text(
                              "${experts[0]["workoutCreated"]}",
                              style: Styles.normal.copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Styles.secondColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Gap(15),
                    Expanded(
                      child: Container(
                        width: double.maxFinite,
                        height: 100,
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(color: Colors.black26, blurRadius: 2),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text('Meals',
                              style: Styles.title
                            ),
                            const Gap(5),
                            Text(
                              "${experts[0]["mealCreated"]}",
                              style: Styles.normal.copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Styles.secondColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                const Gap(20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NextNavigation(
                      title: 'Program Clients',
                      titleTextStyle: Styles.title,
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ExpPrograms()));
                      },
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}