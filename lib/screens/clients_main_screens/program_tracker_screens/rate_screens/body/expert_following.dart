import 'package:flutter/material.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/main_button.dart';
import 'package:ifit/screens/clients_main_screens/discover_screens/expert_screens/expert_profile.dart';

class ExperFollowingScreen extends StatefulWidget {
  const ExperFollowingScreen({super.key});

  @override
  State<ExperFollowingScreen> createState() => _ExperFollowingScreenState();
}

class _ExperFollowingScreenState extends State<ExperFollowingScreen> {
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
                        child: FollowingRow(image: exObj["image"], 
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



class FollowingRow extends StatefulWidget {
  final String image;
  final String title;
  final String bottomText;

  const FollowingRow({
    super.key,
    required this.image,
    required this.title,
    required this.bottomText, 
  });

  @override
  State<FollowingRow> createState() => _FollowingRowState();
}


class _FollowingRowState extends State<FollowingRow> {
bool isFollowing = false;
String get buttonText => isFollowing ? 'Following' : 'Follow';


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
        color: Styles.bgColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 2)],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Container(
              width: 60,
              height: 60,
              color: Styles.secondColor.withOpacity(0.6),
              child: Image.asset(
                widget.image,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.title, style: Styles.text15bold),
                Text(
                  widget.bottomText,
                  style: Styles.normal.copyWith(
                    fontSize: 12,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                // Removed the progress bar code here
              ],
            ),
          ),
          SizedBox(
            height: 30,
            width: 100,
            child: MainButton(
              title: buttonText,
              textStyle: Styles.seeMore.copyWith(
                color: Colors.white,
              ),
              buttonColor: Styles.secondColor,
              onPressed: () {
                setState(() {
                  isFollowing = !isFollowing;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
