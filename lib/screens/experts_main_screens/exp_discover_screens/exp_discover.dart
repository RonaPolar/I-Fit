import 'dart:math';

import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/main_button.dart';
import 'package:ifit/common/widgets/program_widgets.dart';
import 'package:ifit/common/widgets/search.dart';
import 'package:ifit/screens/clients_main_screens/discover_screens/expert_screens/expert_profile.dart';
import 'package:ifit/screens/experts_main_screens/exp_bottom_bar.dart';
import 'package:ifit/screens/experts_main_screens/exp_discover_screens/my_programs/exp_my_programs.dart';
import 'package:ifit/screens/experts_main_screens/exp_discover_screens/view_screens/meal_screen.dart/exp_meal_screen.dart';
import 'package:ifit/screens/experts_main_screens/exp_discover_screens/view_screens/meal_screen.dart/view_meal.dart';
import 'package:ifit/screens/experts_main_screens/exp_discover_screens/view_screens/workout_screen.dart/exp_workout_screen.dart';
import 'package:ifit/screens/experts_main_screens/exp_discover_screens/view_screens/workout_screen.dart/view_workout.dart';

class ExpDiscoverScreen extends StatefulWidget {
  const ExpDiscoverScreen({super.key});

  @override
  State<ExpDiscoverScreen> createState() => _ExpDiscoverScreenState();
}

class _ExpDiscoverScreenState extends State<ExpDiscoverScreen> {
TextEditingController txtSearch = TextEditingController();

    List popularWorkoutArr = [
    {
      "name": "Full Body Exercises",
      "image": "assets/icons/workout-pic.png",
      "rate": "4.7",
      "schedule": "Monday",
      "categories": "Full Body",
      "time": "9:00am",
      "kcal": "320",
      "exercise": "10",
      "duration": "30",
      "days": "21",
      "clients": "21",
    },
    {
      "name": "Upper Body Weights",
      "image": "assets/icons/Lower-Weights.png",
      "rate": "4.3",
      "schedule": "Monday",
      "categories": "Upper Body",
      "time": "10:00am",
      "kcal": "210",
      "exercise": "10",
      "duration": "30",
      "days": "15",
      "clients": "11",
    },
    {
      "name": "Ab Exercises",
      "image": "assets/icons/Ab-workout.png",
      "rate": "4.5",
      "schedule": "Monday",
      "categories": "Abdominal",
      "time": "4:00pm",
      "kcal": "260",
      "exercise": "10",
      "duration": "30",
      "days": "14",
      "clients": "19",
    },
  ];

  List popularMealArr = [
    {
      "name": "Blueberry Pancake",
      "image": "assets/images/meal/pancake.png",
      "rate": "4.9",
      "kcal": "190",
      "fats": "199",
      "proteins": "305",
      "sugar": "150",
      "categories": "Breakfast",
      "clients": "13",
    },
    {
      "name": "Salad",
      "image": "assets/images/meal/salad.png",
      "rate": "4.6",
      "kcal": "200",
      "fats": "100",
      "proteins": "300",
      "sugar": "50",
      "categories": "Lunch",
      "clients": "15",
    },
    {
      "name": "Salmon Nigiri",
      "image": "assets/images/meal/nigiri.png",
      "rate": "4.3",
      "kcal": "300",
      "fats": "250",
      "proteins": "310",
      "sugar": "100",
      "categories": "Dinner",
      "clients": "27",
    },
  ];


  List discoverExperts = [
    {
      "name": "Dr. Otto Octavius",
      "image": "assets/images/experts/expert1.png",
      "profession": "Physician",
      "rate": "4.5",
      "mealCreated": "2",
      "workoutCreated": "3",
      "descriptions": "Hello! I completed my course in 2017 and have 5 years of experience working as Physician. If you like my programs I created, you can visit me at Manila Center at Makati City.",
    },
    {
      "name": "Dr. Harleen Quinzel",
      "image": "assets/images/experts/expert3.jpg",
      "profession": "Physical Therapist",
      "rate": "4.8",
      "mealCreated": "3",
      "workoutCreated": "3",
      "descriptions": "You can call me Dr. Harley. I'm a licensed Physical Therapist located Tondo Medical Center and have 6 years of experience working at the field. If you like my programs I created, you can visit me or contact me.",
    },
    {
      "name": "Dr. Octavius Brine",
      "image": "assets/images/experts/expert2.png",
      "profession": "Nutritionist",
      "rate": "3.9",
      "mealCreated": "2",
      "workoutCreated": "5",
      "descriptions": "I'm a licensed Nutritionist working in GoFit center at Mandaluyong and has 12 years of experience at the field. If you like my programs I created, you can email or visit me.",
    },
    {
      "name": "Coach. Rendon Labador",
      "image": "assets/images/experts/expert4.jpg",
      "profession": "Gym Instructor",
      "rate": "3.9",
      "mealCreated": "3",
      "workoutCreated": "2",
      "descriptions": "Hi, I'm a Gym Instructor in Farohs Gym located at Nagtahan, Manila - near EARIST and has a decade of experience working at the field. If you like my programs I created, come visit me or contact me.",
    },
  ];


  @override
  Widget build(BuildContext context) {
    List<dynamic> combinedList = [...popularWorkoutArr, ...popularMealArr];
    combinedList.shuffle(Random());

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
            builder: (context) => const ExpHome()));
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
        title: Container(
          height: 35,
          width: double.maxFinite,
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10)),
          alignment: Alignment.center,
          child: SearchContainer(controller: txtSearch, hintText: "Search")
        ),
        actions: [
          InkWell(
            onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(
                builder: (context) => const ExpCreatedProgram()));
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal:15, vertical: 10),
              height: 35,
              width: 35,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10)),
              child: const Icon(FluentSystemIcons.ic_fluent_person_regular,
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
                padding: const EdgeInsets.only(top:15, right:15, left:15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        "Daily Discover",
                        style: Styles.title
                      ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 80,
                          height: 20,
                          child: MainButton(title: 'Workout', 
                            textStyle: Styles.text12.copyWith(
                              color: Colors.white),
                            onPressed: (){
                              Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) => const ExpWorkoutScreen()));
                          }),
                        ),
                        const Gap(5),
                        SizedBox(
                          width: 60,
                          height: 20,
                          child: MainButton(title: 'Meal', 
                            textStyle: Styles.text12.copyWith(
                              color: Colors.white),
                            onPressed: (){
                              Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) => const ExpMealScreen()));
                            }),
                        ),
                      ],
                    )
                  ],
                ),
              ),


              const Gap(10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.only(right: 5, top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.black,
                      width: 3
                    )
                  ),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal:7),
                            child: Text(
                                "New Arrival",
                                style: Styles.title
                              ),
                          ),
                          SizedBox(
                            height: 130,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: combinedList.length,
                              itemBuilder: (context, index) {
                                var item = combinedList[index] as Map? ?? {};

                                if (item.containsKey("duration") && item.containsKey("kcal")) {
                                  // It's a workout item
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ViewWorkoutDetails(dObj: item),
                                        ),
                                      );
                                    },
                                    child: LittleContainer(
                                      containerColor: Styles.secondColor.withOpacity(0.6),
                                      image: item["image"],
                                      title: item["name"],
                                      bottomText: "${item["duration"]} minutes | ${item["kcal"]} kcal",
                                    ),
                                  );
                                } else {
                                  // It's a meal item
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ViewMealDetails(dObj: item),
                                        ),
                                      );
                                    },
                                    child: LittleContainer(
                                      containerColor: Styles.secondColor.withOpacity(0.6),
                                      image: item["image"],
                                      title: item["name"],
                                      bottomText: "${item["categories"]} | ${item["kcal"]} kcal",
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      
                      
                      const Gap(10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 7),
                            child: Text(
                              "Popular",
                              style: Styles.title,
                            ),
                          ),
                          SizedBox(
                            height: 130,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: combinedList.length,
                              itemBuilder: (context, index) {
                                var item = combinedList[index] as Map? ?? {};

                                if (item.containsKey("duration") && item.containsKey("kcal")) {
                                  // It's a workout item
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ViewWorkoutDetails(dObj: item),
                                        ),
                                      );
                                    },
                                    child: LittleContainer(
                                      containerColor: Styles.secondColor.withOpacity(0.6),
                                      image: item["image"],
                                      title: item["name"],
                                      bottomText: "${item["duration"]} minutes | ${item["kcal"]} kcal",
                                    ),
                                  );
                                } else {
                                  // It's a meal item
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ViewMealDetails(dObj: item),
                                        ),
                                      );
                                    },
                                    child: LittleContainer(
                                      containerColor: Styles.secondColor.withOpacity(0.6),
                                      image: item["image"],
                                      title: item["name"],
                                      bottomText: "${item["categories"]} | ${item["kcal"]} kcal",
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              
              const Gap(15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:15),
                    child: 
                      Text(
                        "Experts",
                        style: Styles.title
                      ),
                    ),
                  GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Adjust the number of columns as per your design
                    ),
                    itemCount: discoverExperts.length,
                    itemBuilder: (context, index) {
                      var exObj = discoverExperts[index] as Map? ?? {};
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ExpertProfile(exObj: exObj)),
                          );
                        },
                        child: SquareContainer(
                          image: exObj["image"],
                          title: exObj["name"],
                          bottomText: "${exObj["profession"]} | ${exObj["rate"]} stars",
                        ),
                      );
                    },
                  )
                ],
              ),
                
              
              const Gap(10)


            ],//main Children
          ),
        ],

      ),
    );
  }
}