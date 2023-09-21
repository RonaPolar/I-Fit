import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/main_button.dart';
import 'package:ifit/common/widgets/program_row.dart';
import 'package:ifit/common/widgets/workout_line_chart.dart';

class WorkoutTrackerScreen extends StatefulWidget {
  const WorkoutTrackerScreen({super.key});

  @override
  State<WorkoutTrackerScreen> createState() => _WorkoutTrackerScreenState();
}

class _WorkoutTrackerScreenState extends State<WorkoutTrackerScreen> {
  List what2TrainArr = [
    {
      "name": "Full Body Workout",
      "image": "assets/icons/workout-pic.png",
      "exercise": "12",
      "duration": "40",
    },
    {
      "name": "Upper Body Workout",
      "image": "assets/icons/Upper-Weights.png",
      "exercise": "10",
      "duration": "30",
    },
    {
      "name": "Ab Workout",
      "image": "assets/icons/Ab-workout.png",
      "exercise": "11",
      "duration": "30",
    },
    {
      "name": "Lower Body Workout",
      "image": "assets/icons/Lower-Weights.png",
      "exercise": "10",
      "duration": "30",
    },
  ];

  List upcomingWorkoutArr = [
    {
      "name": "Full Body Exercises",
      "image": "assets/icons/workout-pic.png",
      "day": "Monday",
      "time": "9:00am",
    },
    {
      "name": "Upper Body Weights",
      "image": "assets/icons/Lower-Weights.png",
      "day": "Monday",
      "time": "10:00am",
    },
    {
      "name": "Ab Exercises",
      "image": "assets/icons/Ab-workout.png",
      "day": "Monday",
      "time": "4:00pm",
    },
  ];

  
@override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Styles.secondColor.withOpacity(0.5), Styles.secondColor]),
      ),
      child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled){
            return [
              SliverAppBar(
                backgroundColor: Colors.transparent,
                centerTitle: true,
                // pinned: true,
                elevation: 0,
                expandedHeight: 54,
                leading: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(12),
                      height: 30,
                      width: 30,
                    alignment: Alignment.center,
                    // decoration: BoxDecoration(
                    //     color: Colors.grey.shade200,
                    //     borderRadius: BorderRadius.circular(10)),
                    child: const Icon(
                      FluentSystemIcons.ic_fluent_chevron_left_filled,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
                title: Text('Workout Tracker',
                style: Styles.headlineSmall),
              ),
              SliverAppBar(
                backgroundColor: Colors.transparent,
                centerTitle: true,
                elevation: 0,
                leadingWidth: 0,
                leading: const SizedBox(),
                expandedHeight: 200,
                flexibleSpace: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.maxFinite,
                  child: const LineChartWidget(),
                ),
              ),
            ];
          }, 
          body:Container(  //Workout Chart
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                color: Styles.bgColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25), topRight: Radius.circular(25))
                ),
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
                          const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Styles.secondColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(15),),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Daily Workout Schedule',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 80,
                            height: 30,
                              child: MainButton(
                                title: "Check",
                              onPressed: () {
                                // Navigator.of(context).push(
                                //   MaterialPageRoute(
                                //   builder: (context) => const ActivityTrackerScreen()));
                              },
                              textStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            )),                    
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
                    ListView.builder( //WorkoutRowContainer Content
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: upcomingWorkoutArr.length,
                        itemBuilder: (context, index) {
                          var schedObj = upcomingWorkoutArr[index] as Map? ?? {};
                          return InkWell(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) =>
                                //         const FinishedWorkoutView(),
                                //   ),
                                // );
                              },
                              child: ScheduledProgram(schedObj: schedObj));
                        }),

                    const Gap(20),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "What Do You Want to Train Next?",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    ListView.builder( //WorkoutRowContainer Content
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: what2TrainArr.length,
                        itemBuilder: (context, index) {
                          var what2TrainObj = what2TrainArr[index] as Map? ?? {};
                          return InkWell(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) =>
                                //         const FinishedWorkoutView(),
                                //   ),
                                // );
                              },
                              child: What2TrainContainer(what2TrainObj: what2TrainObj));
                        }),


                  ],  //Main children
                ),
              ),
            ),
          ),  //Main top
        ),
    );
  }
}

class What2TrainContainer extends StatelessWidget {
final Map what2TrainObj;

  const What2TrainContainer({super.key, required this.what2TrainObj});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
        color: Styles.secondColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  what2TrainObj["name"].toString(),
                  style: Styles.text2.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "${what2TrainObj["exercise"].toString()} Exercises | ${what2TrainObj["duration"].toString()} mins",
                  style: TextStyle(
                    color: Styles.textColor,
                    fontSize: 12,
                  ),
                ),
                const Gap(10),
                SizedBox(
                    width: 100,
                    height: 30,
                      child: MainButton(
                        title: "View More",
                        buttonColor: Styles.primaryColor,
                      onPressed: () {
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //   builder: (context) => const ActivityTrackerScreen()));
                      },
                      textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )),  
              ],
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),   
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
                ClipRRect(
                  child: Image.asset(
                    what2TrainObj["image"].toString(),
                    width: 80,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                ),
            ],
          ),
        ],
        
      ),
    );
  }
}
