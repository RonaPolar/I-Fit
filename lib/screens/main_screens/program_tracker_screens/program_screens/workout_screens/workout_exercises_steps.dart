// import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/main_button.dart';
import 'package:ifit/common/widgets/video_player.dart';
import 'package:readmore/readmore.dart';

class WorkoutExercisesSteps extends StatefulWidget {
  final Map eObj;
  const WorkoutExercisesSteps({super.key, required this.eObj});

  @override
  State<WorkoutExercisesSteps> createState() => _WorkoutExercisesStepsState();
}

class _WorkoutExercisesStepsState extends State<WorkoutExercisesSteps> {
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
                const VidPlayer(
                  videoAssetPath: 'assets/videos/warmup.mp4',
                ),
                const Gap(20),
                Text(
                  widget.eObj["title"].toString(),
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
                const Gap(2),
                Text(
                  widget.eObj["value"].toString(),
                  style: TextStyle(
                    color: Styles.fadeTextColor,
                    fontSize: 14,
                  ),
                ),
                const Gap(20),
                const Text(
                  'Descriptions',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
                const Gap(10),
                ReadMoreText(
                  'A jumping jack, also known as a star jump and called a side-straddle hop in the US military, is a physical jumping exercise performed by jumping to a position with the legs spread wide and the hands going overhead, sometimes in a clap, and then returning to a position with the feet together and the arms at the sides.',
                  style: TextStyle(
                    color: Styles.fadeTextColor,
                    fontSize: 14,
                  ),
                  trimLines: 3,
                  colorClickableText: Colors.blue,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: '  Show more',
                  trimExpandedText: ' Show less',
                  moreStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                  lessStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
                const Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'How To Do It',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "${stepArr.length} Steps",
                      style: TextStyle(
                          color: Styles.fadeTextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),

                const Gap(10),
                ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: stepArr.length,
                    itemBuilder: (context, index) {
                      var sObj = stepArr[index] as Map? ?? {};
                      return StepsDottedLine(
                        sObj: sObj,
                        isLast: stepArr.last == sObj,
                      );
                    }),
                
                const Gap(5),
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
              
              ],  //Main Children
            ),
          ),
        ],
      ),
    );
  }
}



class StepsDottedLine extends StatelessWidget {
  final Map sObj;
  final bool isLast;
  const StepsDottedLine({super.key, required this.sObj, this.isLast = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 25,
          child: Text(
            sObj["no"].toString(),
            style: TextStyle(
              color: Styles.secondColor,
              fontSize: 14,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                color: Styles.secondColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(9),
              ),
              alignment: Alignment.center,
              child: Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 3),
                borderRadius: BorderRadius.circular(8),
              ),) ,
            ),
            if (!isLast)
              DottedDashedLine(
                  height: 70,
                  width: 0,
                  dashColor: Styles.secondColor.withOpacity(0.5),
                  axis: Axis.vertical)
          ],
        ),
        const Gap(5), //gap between text and line
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //waterArry
              Text(
                sObj["title"].toString(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
              Text(
                sObj["detail"].toString(),
                style: TextStyle(
                    color: Styles.fadeTextColor, 
                    fontSize: 14),
              ),
              const Gap(5),
            ],
          ),
        )
      ],
    );
  }
}
