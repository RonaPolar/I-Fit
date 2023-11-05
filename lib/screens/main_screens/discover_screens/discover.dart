import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/search.dart';
import 'package:ifit/common/widgets/program_widgets.dart';
import 'package:ifit/screens/main_screens/discover_screens/my_program/my_program.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
TextEditingController txtSearch = TextEditingController();
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
                builder: (context) => const OngoingPrograms()));
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:15, right:15, left:15),
                  child: Text(
                      "Experts",
                      style: Styles.title
                    ),
                ),
                SizedBox(
                  height: 180,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 11),
                    scrollDirection: Axis.horizontal,
                    itemCount: popularWorkoutArr.length,
                    itemBuilder: (context, index) {
                    var wObj = popularWorkoutArr[index] as Map? ?? {};
                    return InkWell(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => WorkoutDetails(dObj: wObj)),
                          // );
                        },
                        child: BigContainer(containerColor: Colors.red,
                          viewColor: Colors.grey.shade200,
                          image: wObj["image"], 
                          title: wObj["name"], 
                          bottomText: "${wObj["duration"]} minutes | ${wObj["kcal"]} kcal")
                        );
                  }),
                ),
              ],
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
                            itemCount: popularWorkoutArr.length,
                            itemBuilder: (context, index) {
                            var wObj = popularWorkoutArr[index] as Map? ?? {};
                            return InkWell(
                                onTap: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => WorkoutDetails(dObj: wObj)),
                                  // );
                                },
                                child: LittleContainer(containerColor: Styles.secondColor.withOpacity(0.6),
                                  image: wObj["image"], 
                                  title: wObj["name"], 
                                  bottomText: "${wObj["duration"]} minutes | ${wObj["kcal"]} kcal")
                                );
                          }),
                        ),
                      ],
                    ),
                    
                    
                    const Gap(10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal:7),
                          child: Text(
                              "Popular",
                              style: Styles.title
                            ),
                        ),
                        SizedBox(
                          height: 130,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: popularWorkoutArr.length,
                            itemBuilder: (context, index) {
                            var wObj = popularWorkoutArr[index] as Map? ?? {};
                            return InkWell(
                                onTap: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => WorkoutDetails(dObj: wObj)),
                                  // );
                                },
                                child: LittleContainer(containerColor: Styles.secondColor.withOpacity(0.6),
                                  image: wObj["image"], 
                                  title: wObj["name"], 
                                  bottomText: "${wObj["duration"]} minutes | ${wObj["kcal"]} kcal")
                                );
                          }),
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
                      "Daily Discover",
                      style: Styles.title
                    ),
                  ),
                SizedBox(
                  height: 360,
                  width: double.maxFinite,
                  child: GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    scrollDirection: Axis.horizontal,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Adjust the number of columns as per your design
                    ),
                    itemCount: popularWorkoutArr.length,
                    itemBuilder: (context, index) {
                      var wObj = popularWorkoutArr[index] as Map? ?? {};
                      return InkWell(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => WorkoutDetails(dObj: wObj)),
                          // );
                        },
                        child: SquareContainer(
                          image: wObj["image"],
                          title: wObj["name"],
                          bottomText: "${wObj["duration"]} minutes | ${wObj["kcal"]} kcal",
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
              
            
            const Gap(10)


          ],//main Children
        ),

      ),
    );
  }
}


