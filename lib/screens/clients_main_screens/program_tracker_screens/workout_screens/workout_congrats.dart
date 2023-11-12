import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/main_button.dart';
import 'package:ifit/screens/clients_main_screens/main_bottom_bar.dart';

class WorkoutCongrats extends StatefulWidget {
  const WorkoutCongrats({super.key});

  @override
  State<WorkoutCongrats> createState() => _WorkoutCongratsState();
}

class _WorkoutCongratsState extends State<WorkoutCongrats> {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Styles.bgColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Container(
                        padding:
                            const EdgeInsets.only(right: 10, left: 10),
                        child: Column(
                          children: [
                            Image.asset('assets/images/congrats.png'),
                            const Gap(30),
                            Text(
                              'Congratulations, You Have Finished Your Workout',
                               style: Styles.headline25,
                               textAlign: TextAlign.center,
                              ),
                            const Gap(10),
                            Text(
                              'Exercises is king and nutrition is queen. Combine the two and you will have a kingdom\n-Jack Lalanne',
                               style: Styles.text15normal,
                               textAlign: TextAlign.center,
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                    right: 20, left: 20, bottom: 30, top: 20),
                child: Column(
                  children: [
                    MainButton(
                      title: 'Back to Home',
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeNavBar(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}