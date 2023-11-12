import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/program_category.dart';
import 'package:ifit/common/widgets/program_widgets.dart';
import 'package:ifit/common/widgets/search.dart';
import 'package:ifit/screens/clients_main_screens/program_tracker_screens/workout_screens/workout_details.dart';

class WorkoutCategory extends StatefulWidget {
  final Map wObj;
  const WorkoutCategory({super.key, required this.wObj});

  @override
  State<WorkoutCategory> createState() => _WorkoutCategoryState();
}

class _WorkoutCategoryState extends State<WorkoutCategory> {
  TextEditingController txtSearch = TextEditingController();

    List categoryWorkoutArr = [
    {
      "name": "Full Body",
      "image": "assets/icons/workout-pic.png",
      "workoutNumber": "130",
    },
    {
      "name": "Upper Body",
      "image": "assets/icons/Upper-Weights.png",
      "workoutNumber": "130",
    },
    {
      "name": "Abdominal",
      "image": "assets/icons/Ab-workout.png",
      "workoutNumber": "130",
    },
    {
      "name": "Lower Body",
      "image": "assets/icons/Lower-Weights.png",
      "workoutNumber": "130",
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
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
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
          widget.wObj["name"].toString(),
          style: Styles.headline20,
        ),
        actions: [
          Container(
            margin: const EdgeInsets.all(12),
            height: 30,
            width: 30,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10)),
            child: const Icon(FluentSystemIcons.ic_fluent_person_regular,
              size: 20,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(3),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.symmetric(horizontal:15),
                decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2))
                ]),
                child: SearchContainer(controller: txtSearch, hintText: "Search")
              ),

              const Gap(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Category",
                      style: Styles.title
                    ),
                  ],
                ),
              ),
              const Gap(5),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryWorkoutArr.length,
                  itemBuilder: (context, index) {
                    var cObj = categoryWorkoutArr[index] as Map? ?? {};
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WorkoutCategory(wObj: cObj)),
                        );
                      },child: SmallCategoryCell(cObj: cObj, index: index));
                  }),
              ),

              const Gap(15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Text(
                    "Recommendation for Diet",
                    style: Styles.title
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //   builder: (context) => const WorkoutSchedule()));
                    },
                    child: Text(
                      "See More",
                      style: Styles.seeMore
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 11),
                  scrollDirection: Axis.horizontal,
                  itemCount: popularWorkoutArr.length,
                  itemBuilder: (context, index) {
                  var wObj = popularWorkoutArr[index] as Map? ?? {};
                  return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WorkoutDetails(dObj: wObj)),
                        );
                      },
                      child: BigContainer(image: wObj["image"], 
                        title: wObj["name"], 
                        bottomText: "${wObj["duration"]} minutes | ${wObj["kcal"]} kcal",));
                }),
              ),

              const Gap(15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Text(
                    "Popular",
                    style: Styles.title
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //   builder: (context) => const WorkoutSchedule()));
                    },
                    child: Text(
                      "See More",
                      style: Styles.seeMore
                      ),
                    )
                  ],
                ),
              ),
              ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 2, //recommendWorkoutArr.length
                itemBuilder: (context, index) {
                  var wObj = popularWorkoutArr[index] as Map? ?? {};
                  return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WorkoutDetails(dObj: wObj)),
                        );
                      },
                      child: ProgramRow(image: wObj["image"], 
                        title: wObj["name"], 
                        bottomText: "${wObj["duration"]} minutes | ${wObj["kcal"]} Calories",
                        showToggleSwitch: false,
                      ));
                }),
                


            ], //main Children
          ),
        ],
      ),
    );
  }
}


