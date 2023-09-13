import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/main_button.dart';
import 'package:ifit/screens/main_screens/main_bottom_bar.dart';
import 'package:ifit/screens/main_screens/notifications.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
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
                              // AspectRatio(
                              //   aspectRatio: 1,
                              //   child: PieChart(
                              //     PieChartData(
                              //       pieTouchData: PieTouchData(
                              //         touchCallback:
                              //             (FlTouchEvent event, pieTouchResponse) {},
                              //       ),
                              //       startDegreeOffset: 250,
                              //       borderData: FlBorderData(
                              //         show: false,
                              //       ),
                              //       sectionsSpace: 1,
                              //       centerSpaceRadius: 0,
                              //       sections: showingSections(),
                              //     ),
                              //   ),
                              // ),
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
                      color: const Color.fromRGBO(255, 0, 0, 72).withOpacity(0.3),
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
                  )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
