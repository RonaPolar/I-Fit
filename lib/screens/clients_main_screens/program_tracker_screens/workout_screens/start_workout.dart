import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/confirmation_dialog.dart';
import 'package:ifit/common/widgets/main_button.dart';
import 'package:ifit/common/widgets/video_player.dart';
import 'package:ifit/screens/clients_main_screens/program_tracker_screens/workout_screens/workout_exercises_steps.dart';
import 'package:ifit/screens/clients_main_screens/program_tracker_screens/workout_screens/workout_tracker.dart';

class StartWorkout extends StatefulWidget {
  const StartWorkout({super.key});

  @override
  State<StartWorkout> createState() => _StartWorkoutState();
}

class _StartWorkoutState extends State<StartWorkout> {
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
  List exercisesArr = [
    {
          "video": "assets/videos/warmup.mp4",
          "title": "Stretching",
          "value": "05:00"
    },
  ];

    List stepArr = [
    {
      "no": "01",
      "title": "Spread Your Arms",
      "detail":
          "To make the gestures feel more relaxed, stretch your arms as you start this movement. No bending of hands."
    },
    {
      "no": "02",
      "title": "Rest at The Toe",
      "detail":
          "The basis of this movement is jumping. Now, what needs to be considered is that you have to use the tips of your feet"
    },
    {
      "no": "03",
      "title": "Adjust Foot Movement",
      "detail":
          "Jumping Jack is not just an ordinary jump. But, you also have to pay close attention to leg movements."
    },
    {
      "no": "04",
      "title": "Clapping Both Hands",
      "detail":
          "This cannot be taken lightly. You see, without realizing it, the clapping of your hands helps you to keep your rhythm while doing the Jumping Jack"
    },
  ];

    return Scaffold(
      backgroundColor: Styles.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            showDialog(context: context,
              builder: (BuildContext context) {
                return ConfirmationDialog(
                  question: "Are you sure to Quit?",
                  onYesPressed: () {
                    Navigator.push(context,MaterialPageRoute(
                      builder: (context) => const WorkoutTrackerScreen()));
                  },
            );});
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
              Icons.close,
              size: 20,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: isPlaying 
                          ? const Icon(FluentSystemIcons.ic_fluent_play_filled) 
                          : const Icon(FluentSystemIcons.ic_fluent_pause_filled),
                        onPressed: () {
                          setState(() {
                            isPlaying = !isPlaying;
                            // Add your logic for play/pause functionality here
                          });
                        },
                      ),
                      Text(
                        exercisesArr[0]["value"].toString(),
                        style: Styles.normal.copyWith(
                          color: Colors.black,
                          fontSize: 18
                        )),
                      IconButton(icon: const Icon(FluentSystemIcons.ic_fluent_arrow_repeat_all_filled),
                      onPressed: (){
                        
                      },),
                    ],
                  ),
                ),

                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 120,
                        height: 35,
                        child: MainButton(title: "Skip", 
                          textStyle: Styles.text18.copyWith(color: Colors.white), 
                          onPressed: () { },)),
                      const Gap(5),
                      //Comes only when the Exercise is not TIME
                      // SizedBox(      
                      //   width: 120,
                      //   height: 35,
                      //   child: MainButton(title: "Done", 
                      //     textStyle: Styles.text18.copyWith(color: Colors.white), 
                      //     onPressed: () { },)),
                    ],
                  ),
                ),
                const Gap(15),

                VidPlayer(
                  videoAssetPath: exercisesArr[0]["video"].toString(),
                ),
                const Gap(20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      exercisesArr[0]["title"].toString(),
                      style: Styles.text18.copyWith(
                          fontWeight: FontWeight.w700),
                    ),
                    const Gap(2),
                    ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: stepArr.length,
                    itemBuilder: (context, index) {
                      var sObj = stepArr[index] as Map? ?? {};
                      return ExerStepsDottedLine(
                        sObj: sObj,
                        isLast: stepArr.last == sObj,
                      );
                    }),
                  ],
                ),
                
              ],
            ),
          )
        ],
      ),
    );
  }
}
