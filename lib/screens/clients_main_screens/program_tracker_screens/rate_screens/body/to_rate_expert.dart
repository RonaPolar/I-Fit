import 'package:flutter/material.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/screens/clients_main_screens/discover_screens/expert_screens/expert_profile.dart';
import 'package:ifit/screens/clients_main_screens/program_tracker_screens/rate_screens/body/to_rate_program.dart';

class ToRateExpertScreen extends StatefulWidget {
  const ToRateExpertScreen({super.key});

  @override
  State<ToRateExpertScreen> createState() => _ToRateExpertScreenState();
}

class _ToRateExpertScreenState extends State<ToRateExpertScreen> {
  List discoverExperts = [
    {
      "name": "Dr. Otto Octavius",
      "image": "assets/images/experts/expert1.png",
      "profession": "Physician",
      "rate": "4.5",
    },
    {
      "name": "Dr. Harleen Quinzel",
      "image": "assets/images/experts/expert3.jpg",
      "profession": "Physical Therapist",
      "rate": "4.8",
    },
    {
      "name": "Dr. Octavius Brine",
      "image": "assets/images/experts/expert2.png",
      "profession": "Nutritionist",
      "rate": "3.9",
    },
    {
      "name": "Coach. Rendon Labador",
      "image": "assets/images/experts/expert4.jpg",
      "profession": "Gym Instructor",
      "rate": "3.9",
    },
  ];

  
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: ListView.builder( //WorkoutRowContainer Content
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 2, //recommendWorkoutArr.length
                  itemBuilder: (context, index) {
                    var exObj = discoverExperts[index] as Map? ?? {};
                    return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                ExpertProfile(exObj: exObj),
                            ),
                          );
                        },
                        child: ToRateRow(image: exObj["image"], 
                        title: exObj["name"], 
                        bottomText: exObj["profession"],
                        ));
                  }),
              ),
            ],
          )
        ]
      )
    );
  }
}