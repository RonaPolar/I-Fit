import 'dart:math';

import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/main_button.dart';
import 'package:ifit/common/widgets/program_widgets.dart';
import 'package:ifit/screens/clients_main_screens/program_tracker_screens/meal_screens/meal_details.dart';
import 'package:ifit/screens/clients_main_screens/program_tracker_screens/workout_screens/workout_details.dart';
import 'package:readmore/readmore.dart';

class ExpertProfile extends StatefulWidget {
  final Map exObj;
  
  const ExpertProfile({super.key, required this.exObj});

  @override
  State<ExpertProfile> createState() => _ExpertProfileState();
}

class _ExpertProfileState extends State<ExpertProfile> {
  List itemsArr = [
    {
      "item": "1x of 6lbs Kettlebell",
    },
    {
      "item": "Skipping Rope",
    },
    {
      "item": "2x of 18lbs Dumbbell",
    },
  ];

  List popularWorkoutArr = [
    {
      "name": "Full Body Exercises",
      "image": "assets/icons/workout-pic.png",
      "schedule": "Monday",
      "categories": "Full Body",
      "time": "9:00am",
      "kcal": "320",
      "exercise": "10",
      "duration": "30",
    },
    {
      "name": "Upper Body Weights",
      "image": "assets/icons/Lower-Weights.png",
      "schedule": "Monday",
      "categories": "Upper Body",
      "time": "10:00am",
      "kcal": "210",
      "exercise": "10",
      "duration": "30",
    },
    {
      "name": "Ab Exercises",
      "image": "assets/icons/Ab-workout.png",
      "schedule": "Monday",
      "categories": "Abdominal",
      "time": "4:00pm",
      "kcal": "260",
      "exercise": "10",
      "duration": "30",
    },
  ];

  List popularMealArr = [
    {
      "name": "Blueberry Pancake",
      "image": "assets/images/meal/pancake.png",
      "kcal": "190",
      "fats": "199",
      "proteins": "305",
      "sugar": "150",
      "categories": "Breakfast",
    },
    {
      "name": "Salad",
      "image": "assets/images/meal/salad.png",
      "kcal": "200",
      "fats": "100",
      "proteins": "300",
      "sugar": "50",
      "categories": "Lunch",
    },
    {
      "name": "Salmon Nigiri",
      "image": "assets/images/meal/nigiri.png",
      "kcal": "300",
      "fats": "250",
      "proteins": "310",
      "sugar": "100",
      "categories": "Dinner",
    },
  ];
  
  bool isFollowing = false;


  @override
  Widget build(BuildContext context) {
    String buttonText = isFollowing ? 'Following' : 'Follow';
    List<dynamic> combinedList = [...popularWorkoutArr, ...popularMealArr];
    combinedList.shuffle(Random());
    
    return Container(
      color: Colors.red,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              // pinned: true,
              elevation: 0,
              expandedHeight: 300,
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin: const EdgeInsets.all(12),
                  height: 30,
                  width: 30,
                  alignment: Alignment.center,
                  child: const Icon(
                    FluentSystemIcons.ic_fluent_chevron_left_filled,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              
              flexibleSpace: Container(
                padding: const EdgeInsets.only(top: 80, bottom: 10),
                width: double.maxFinite,
                child: Image.asset(widget.exObj["image"].toString()),
              ),
            ),
          ];
        },
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
              color: Styles.bgColor,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25))),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const Gap(10),
                  Container(
                    width: 50,
                    height: 4,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(3)),
                  ),

                  const Gap(20),
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
                                widget.exObj["name"].toString(),
                                style: Styles.text18.copyWith(
                                    fontWeight: FontWeight.w700),
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: widget.exObj["profession"].toString(),
                                      style: Styles.text12.copyWith(
                                        color: Colors.blue,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          
                                        },
                                    ),
                                  ],
                                ),
                              ),  
                            ],
                          ),
                          SizedBox(
                            height: 30,
                            width: 100,
                            child: MainButton(title: buttonText,
                              textStyle: Styles.seeMore.copyWith(color: Colors.white), 
                              onPressed: (){
                                setState(() {
                                    isFollowing = !isFollowing;
                                  });
                              }),
                          ),
                        ],
                      ),
                      
                    ],
                  ),

                  
                  const Gap(15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                      'Descriptions',
                      style:  Styles.text18.copyWith(
                          fontWeight: FontWeight.w700),
                      ),
                      
                      const Gap(10),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                              decoration: BoxDecoration(
                                color: Styles.secondColor.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  const Icon(Icons.star_sharp, color: Colors.red,),
                                  Text("${widget.exObj["rate"].toString()} stars"),
                                ],
                              ),
                            ),
                            const Gap(5),  
                            Container(
                              padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                              decoration: BoxDecoration(
                                color: Styles.secondColor.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  const Icon(Icons.timer, color: Colors.red,),
                                  Text("${widget.exObj["mealCreated"].toString()} Meals Created"),
                                ],
                              ),
                            ),
                            const Gap(5),  
                            Container(
                              padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                              decoration: BoxDecoration(
                                color: Styles.secondColor.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  const Icon(Icons.local_fire_department_sharp, color: Colors.red,),
                                  Text("${widget.exObj["workoutCreated"].toString()} Workouts Created"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      const Gap(10),
                      ReadMoreText(
                        widget.exObj["descriptions"].toString(),
                        style: Styles.seeMore.copyWith(
                          fontWeight: FontWeight.normal
                        ),
                        trimLines: 3,
                        colorClickableText: Colors.blue,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: '  Show more',
                        trimExpandedText: ' Show less',
                        moreStyle:  Styles.seeMore.copyWith(
                            color: Colors.blue),
                        lessStyle:  Styles.seeMore.copyWith(
                            color: Colors.blue),
                        ),
                      ],
                    ),

                  const Gap(20),
                  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "Programs Created",
                          style: Styles.title
                        ),
                      GridView.builder(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Adjust the number of columns as per your design
                        ),
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
                                    builder: (context) => WorkoutDetails(dObj: item),
                                  ),
                                );
                              },
                              child: BigContainer(
                                containerColor: Styles.secondColor.withOpacity(0.5),
                                image: item["image"],
                                title: item["name"],
                                bottomText: "${item["duration"]} minutes | ${item["kcal"]} kcal",
                                viewColor: Colors.grey.shade200,
                              ),
                            );
                          } else {
                            // It's a meal item
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MealDetails(dObj: item),
                                  ),
                                );
                              },
                              child: BigContainer(
                                containerColor: Styles.secondColor.withOpacity(0.5),
                                image: item["image"],
                                title: item["name"],
                                bottomText: "${item["categories"]} | ${item["kcal"]} kcal",
                                viewColor: Colors.grey.shade200,
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),              


                  Container(
                    padding: const EdgeInsets.only(top: 5,
                        bottom: 20),
                    child: Column(
                      children: [
                        MainButton(
                          title: 'Contact Now',
                          onPressed: () {
                            // Navigator.push(context,MaterialPageRoute(
                            //     builder: (context) => const ContactUs()),);
                          },
                        ),
                      ],
                    ),
                  ),

                ], //Main children
              ),
            ),
          ),
        ), //Main top
      ),
    );
  }
}
