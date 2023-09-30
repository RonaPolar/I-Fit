import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/favorites_button.dart';
import 'package:ifit/common/widgets/main_button.dart';
import 'package:ifit/common/widgets/icon_text_icon.dart';
import 'package:ifit/screens/main_screens/program_tracker_screens/workout_screens/workout_add_schedule.dart';
import 'package:ifit/screens/main_screens/program_tracker_screens/workout_screens/workout_exercises_steps.dart';
import 'package:readmore/readmore.dart';

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
        {"image": "assets/images/exercises/WarmUp.png", "title": "Stretching", "value": "05:00"},
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
                crossAxisAlignment: CrossAxisAlignment.start,
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
                                widget.dObj["name"].toString(),
                                style: Styles.text18.copyWith(
                                    fontWeight: FontWeight.w700),
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                   TextSpan(
                                      text: 'by ',
                                      style: Styles.text12
                                    ),
                                    TextSpan(
                                      text: 'Dr. Jose P. Rosales',
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
                          Container(
                              padding: EdgeInsets.zero,
                              child: const FavoriteButton()),
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
                      Row(
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
                                const Icon(Icons.accessibility_new_sharp, color: Colors.red,),
                                Text("${widget.dObj["exercise"].toString()} exercises"),
                              ],
                            ),
                          ),
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
                                Text("${widget.dObj["duration"].toString()} mins"),
                              ],
                            ),
                          ),
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
                                Text("${widget.dObj["kcal"].toString()} calories"),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const Gap(10),
                      ReadMoreText(
                      'In this Full body workout: you are exercising your whole body, with all muscle groups being used and stimulated in one workout. For example, you combine exercises that use the upper body and lower body, plus the core in one training session.',
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

                  
                  
                  const Gap(30),
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
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WorkoutAddSchedule(date: DateTime.now()),
                            ),
                          );
                        }),
                  ),


                  const Gap(30),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "You'll Need",
                            style:  Styles.text18.copyWith(
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "${itemsArr.length} Items",
                            style: Styles.normal.copyWith(
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                      const Gap(5),
                      ListView.builder(
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
                                  style: Styles.normal.copyWith(
                                    ),
                                  ),
                              ],
                            );
                          }),
                    ],
                  ),

                  const Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Exercises",
                        style:  Styles.text18.copyWith(
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "${exercisesArr.length} Sets",
                        style:  Styles.normal.copyWith(
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
                      return ExercisesRow(
                        eObjOrSObj: sObj,
                        onPressed: (obj) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WorkoutExercisesSteps(eObj: obj)
                            ),
                          );
                        },
                      );
                    }),

                  Container(
                    padding: const EdgeInsets.only(top: 5,
                        bottom: 20),
                    child: Column(
                      children: [
                        MainButton(
                          title: 'Start Now',
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


//Workout Exercises
class ExercisesRow extends StatelessWidget {
  final Map eObjOrSObj; // Either an exercise or a set object
  final Function(Map obj) onPressed;

  const ExercisesRow({
    Key? key,
    required this.eObjOrSObj,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (eObjOrSObj.containsKey("image")) {
      // It's an exercise
      final eObj = eObjOrSObj as Map<String, dynamic>;
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                eObj["image"].toString(),
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    eObj["title"].toString(),
                    style: Styles.text15bold,
                  ),
                  Text(
                    eObj["value"].toString(),
                    style: Styles.normal.copyWith(
                      fontSize: 12
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () => onPressed(eObj),
              icon: const Icon(Icons.navigate_next),
            )
          ],
        ),
      );
    } else if (eObjOrSObj.containsKey("set")) {
      // It's a set
      final sObj = eObjOrSObj as Map<String, dynamic>;
      final exercisesArr = sObj["set"] as List<Map<String, dynamic>>? ?? [];

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Gap(10),
          Text(
            sObj["name"].toString(),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          ListView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: exercisesArr.length,
            itemBuilder: (context, index) {
              final eObj = exercisesArr[index];
              return ExercisesRow(
                eObjOrSObj: eObj,
                onPressed: onPressed,
              );
            },
          ),
        ],
      );
    }

    return Container();
  }
}
