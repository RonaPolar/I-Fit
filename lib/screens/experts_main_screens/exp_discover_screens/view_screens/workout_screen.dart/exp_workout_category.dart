import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/program_category.dart';
import 'package:ifit/common/widgets/program_widgets.dart';
import 'package:ifit/common/widgets/search.dart';
import 'package:ifit/screens/experts_main_screens/exp_discover_screens/my_programs/exp_my_programs.dart';
import 'package:ifit/screens/experts_main_screens/exp_discover_screens/view_screens/workout_screen.dart/view_workout.dart';


class ExpWorkoutCategory extends StatefulWidget {
  final Map wObj;

  const ExpWorkoutCategory({super.key, required this.wObj});

  @override
  State<ExpWorkoutCategory> createState() => _ExpWorkoutCategoryState();
}

class _ExpWorkoutCategoryState extends State<ExpWorkoutCategory> {
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
                            builder: (context) => ExpWorkoutCategory(wObj: cObj)),
                        );
                      },child: SmallCategoryCell(cObj: cObj, index: index));
                  }),
              ),

              const Gap(15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "Popular",
                  style: Styles.title
                    ),
                ),
              SizedBox(
                height: 210,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: popularWorkoutArr.length, //recommendWorkoutArr.length
                  itemBuilder: (context, index) {
                    var wObj = popularWorkoutArr[index] as Map? ?? {};
                    return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ViewWorkoutDetails(dObj: wObj)),
                          );
                        },
                        child: ProgramRow(image: wObj["image"], 
                          title: wObj["name"], 
                          bottomText: "${wObj["duration"]} minutes | ${wObj["kcal"]} Calories",
                          showToggleSwitch: false,
                      ));
                  }),
              ),

              
              const Gap(15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "Discover",
                  style: Styles.title
                    ),
                ),
              GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 11),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Adjust the number of columns as per your design
                    ),
                itemCount: popularWorkoutArr.length,
                itemBuilder: (context, index) {
                var wObj = popularWorkoutArr[index] as Map? ?? {};
                return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ViewWorkoutDetails(dObj: wObj)),
                      );
                    },
                    child: BigContainer(image: wObj["image"], 
                      title: wObj["name"], 
                      bottomText: "${wObj["categories"]} | ${wObj["kcal"]} kcal",));
              }),
                


            ], //main Children
          ),
        ],
      ),
    );
  }
}


