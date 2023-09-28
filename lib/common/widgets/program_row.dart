import 'package:flutter/material.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/main_button.dart';
import 'package:ifit/common/widgets/toggle_switch.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';

class ProgramRow extends StatefulWidget {
  final Map wObj;
  final double? progress; // Make progress optional


  const ProgramRow({
    Key? key,
    required this.wObj,
    this.progress, // Provide a default value of null

  }) : super(key: key);

  @override
  State<ProgramRow> createState() => _ProgramRowState();
}

class _ProgramRowState extends State<ProgramRow> {
  @override
  Widget build(BuildContext context) {
    final String name = widget.wObj["name"].toString();
    final String kcal = widget.wObj["kcal"]?.toString() ?? '';
    final String duration = widget.wObj["duration"].toString();
    final String categories = widget.wObj["categories"]?.toString() ?? ''; // Make categories optional
    final String days = widget.wObj["days"]?.toString() ?? ''; // Make categories optional


    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
        color: Styles.bgColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 2)],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Container(
              width: 60,
              height: 60,
              color: Styles.secondColor.withOpacity(0.6),
              child: Image.asset(
                widget.wObj["image"].toString(),
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(width: 15,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: Styles.text2.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (categories.isEmpty) // Display time if available
                  Text(
                    "$kcal Calories | $duration minutes",
                    style: TextStyle(
                      color: Styles.fadeTextColor,
                      fontSize: 12,
                    ),
                  ),
                if (categories.isNotEmpty) // Display categories if available
                  Text(
                    "$kcal Calories | $categories",
                    style: TextStyle(
                      color: Styles.fadeTextColor,
                      fontSize: 12,
                    ),
                  ),
                const SizedBox(height: 4,),
                if (widget.progress != null) // Conditionally render the progress bar
                  Row(
                    children: [
                      SimpleAnimationProgressBar(
                        height: 15,
                        width: 150,
                        backgroundColor: Colors.grey.shade200,
                        foregrondColor: Styles.secondColor,
                        ratio: widget.progress!,
                        direction: Axis.horizontal,
                        curve: Curves.fastLinearToSlowEaseIn,
                        duration: const Duration(seconds: 3),
                        borderRadius: BorderRadius.circular(7.5),
                        gradientColor: LinearGradient(
                          colors: Styles.gradientColor,
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                      Text(
                        "$days days", // Display the duration here
                        style: TextStyle(
                          color: Styles.fadeTextColor,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              FluentSystemIcons.ic_fluent_chevron_right_filled,
              size: 30,
              color: Styles.secondColor,
            ),
          ),
        ],
      ),
    );
  }
}


class ScheduledProgram extends StatefulWidget {
  final Map wObj;

  const ScheduledProgram({super.key, required this.wObj});

  @override
  State<ScheduledProgram> createState() => _ScheduledProgramState();
}

class _ScheduledProgramState extends State<ScheduledProgram> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
        color: Styles.bgColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 2)],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Container(
              width: 60,
              height: 60,
              color: Styles.secondColor.withOpacity(0.6),
              child: Image.asset(
                widget.wObj["image"].toString(),
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(width: 15,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.wObj["name"].toString(),
                  style: Styles.text2.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "${widget.wObj["day"].toString()} | ${widget.wObj["time"].toString()}",
                  style: TextStyle(
                    color: Styles.fadeTextColor,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const ToggleSwitch(),
        ],
      ),
    );
  }
}


class What2TrainContainer extends StatelessWidget {
final Map wObj;
final Function(Map obj) onPressed;


  const What2TrainContainer({super.key, required this.wObj, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
        color: Styles.secondColor.withOpacity(0.6),
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
                  wObj["name"].toString(),
                  style: Styles.text2.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                ),
                Text(
                  "${wObj["exercise"].toString()} Exercises | ${wObj["duration"].toString()} mins",
                  style: const TextStyle(
                    color: Colors.black,
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
                        onPressed: () => onPressed(wObj),
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
                    wObj["image"].toString(),
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
