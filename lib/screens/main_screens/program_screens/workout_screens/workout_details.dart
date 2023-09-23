import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/exercises_row.dart';
import 'package:ifit/common/widgets/heart_icon_button.dart';
import 'package:ifit/common/widgets/main_button.dart';
import 'package:ifit/common/widgets/more_icon.dart';
import 'package:ifit/common/widgets/icon_text_icon.dart';

class WorkoutDetails extends StatefulWidget {
  final Map dObj;
  const WorkoutDetails({super.key, required this.dObj});

  @override
  State<WorkoutDetails> createState() => _WorkoutDetailsState();
}

class _WorkoutDetailsState extends State<WorkoutDetails> {
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

    List exercisesArr = [
    {
      "name": "Set 1",
      "set": [
        {"image": "assets/images/exercises/WarmUp.png", "title": "Warm Up", "value": "05:00"},
        {
          "image": "assets/images/exercises/JumpingJack.png",
          "title": "Jumping Jack",
          "value": "12x"
        },
        {"image": "assets/images/exercises/Skipping.png", "title": "Skipping", "value": "15x"},
        {"image": "assets/images/exercises/Squats.png", "title": "Squats", "value": "20x"},
        {
          "image": "assets/images/exercises/ArmRaises.png",
          "title": "Arm Raises",
          "value": "00:53"
        },
        {
          "image": "assets/images/exercises/RestandDrink.png",
          "title": "Rest and Drink",
          "value": "02:00"
        },
      ],
    },
    {
      "name": "Set 2",
      "set": [
        {"image": "assets/images/exercises/WarmUp.png", "title": "Warm Up", "value": "05:00"},
          {
            "image": "assets/images/exercises/JumpingJack.png",
            "title": "Jumping Jack",
            "value": "12x"
          },
          {"image": "assets/images/exercises/Skipping.png", "title": "Skipping", "value": "15x"},
          {"image": "assets/images/exercises/Squats.png", "title": "Squats", "value": "20x"},
          {
            "image": "assets/images/exercises/ArmRaises.png",
            "title": "Arm Raises",
            "value": "00:53"
          },
          {
            "image": "assets/images/exercises/RestandDrink.png",
            "title": "Rest and Drink",
            "value": "02:00"
          },
      ],
    },
      {
      "name": "Set 3",
      "set": [
        {"image": "assets/images/exercises/WarmUp.png", "title": "Warm Up", "value": "05:00"},
          {
            "image": "assets/images/exercises/JumpingJack.png",
            "title": "Jumping Jack",
            "value": "12x"
          },
          {"image": "assets/images/exercises/Skipping.png", "title": "Skipping", "value": "15x"},
          {"image": "assets/images/exercises/Squats.png", "title": "Squats", "value": "20x"},
          {
            "image": "assets/images/exercises/ArmRaises.png",
            "title": "Arm Raises",
            "value": "00:53"
          },
          {
            "image": "assets/images/exercises/RestandDrink.png",
            "title": "Rest and Drink",
            "value": "02:00"
          },
      ],
    }
  ];

  @override
  Widget build(BuildContext context) {
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
              expandedHeight: 220,
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
              actions: [
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  height: 30,
                  width: 30,
                  alignment: Alignment.center,
                  child: const MoreIcon(
                    options: ['This Week', 'Last Week'],
                    iconData: FluentSystemIcons.ic_fluent_more_filled,
                  ),
                ),
              ],
              flexibleSpace: Container(
                padding: const EdgeInsets.only(top: 80, bottom: 10),
                width: double.maxFinite,
                child: Image.asset(widget.dObj["image"].toString()),
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
                  Container(
                    padding:
                          const EdgeInsets.symmetric(horizontal: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.dObj["name"].toString(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "${widget.dObj["exercise"].toString()} Exercises | ${widget.dObj["duration"].toString()} mins | 320 Calories Burn",
                              style: TextStyle(
                                  color: Styles.fadeTextColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                        Container(
                            padding: EdgeInsets.zero,
                            height: 20,
                            width: 25,
                            child: const HeartIconButton()),
                      ],
                    ),
                  ),

                  const Gap(15),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Upcoming Workout",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "See More",
                        style: TextStyle(
                          color: Styles.fadeTextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                        ),
                      )
                    ],
                  ),
                  
                  const Gap(15),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Styles.secondColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: NextNavigation(
                        title: 'Schedule Workout',
                        iconData: FluentSystemIcons.ic_fluent_calendar_regular,
                        onTap: () {}),
                  ),


                  const Gap(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "You'll Need",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "${itemsArr.length} Items",
                        style: TextStyle(
                            color: Styles.fadeTextColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  const Gap(5),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: itemsArr.length,
                        itemBuilder: (context, index) {
                          var yObj = itemsArr[index] as Map? ?? {};
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text( yObj["item"].toString(),
                                style: TextStyle(
                                  color: Styles.fadeTextColor,
                                  fontSize: 14,
                                  ),
                                ),
                            ],
                          );
                        }),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Exercises",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "${exercisesArr.length} Sets",
                        // "3 Sets",
                        style: TextStyle(
                            color: Styles.fadeTextColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  const Gap(10),
                  ListView.builder(
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: exercisesArr.length,
                          itemBuilder: (context, index) {
                            var sObj = exercisesArr[index] as Map? ?? {};
                            return ExercisesSetSection(
                              sObj: sObj,
                              onPressed: (obj) {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => ExercisesStepDetails(
                                //       eObj: obj,
                                //     ),
                                //   ),
                                // );
                              },
                            );
                          }),

                  Container(
                    padding: const EdgeInsets.only(top: 5,
                        bottom: 20),
                    child: Column(
                      children: [
                        MainButton(
                          title: 'Start',
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => const RegisterVerification(),
                            //   ),
                            // );
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
