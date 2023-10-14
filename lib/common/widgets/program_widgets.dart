import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/main_button.dart';
import 'package:ifit/common/widgets/toggle_switch.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';


//What To Eat and Train Next - Category
class What2Container extends StatefulWidget {
final Map wObj;
final Function(Map obj) onPressed;


  const What2Container({super.key, required this.wObj, required this.onPressed});

  @override
  State<What2Container> createState() => _What2ContainerState();
}

class _What2ContainerState extends State<What2Container> {
  @override
  Widget build(BuildContext context) {
    final String name = widget.wObj["name"].toString();
    final String foodNumber = widget.wObj["foodNumber"]?.toString() ?? '';
    final String workoutNumber = widget.wObj["workoutNumber"]?.toString() ?? '';

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
                  name,
                  style: Styles.text15bold
                ),
                if (foodNumber.isEmpty) // Display kcal and categories if available
                Text(
                  "$workoutNumber Programs",
                  style: Styles.normal.copyWith(
                    fontSize: 12,
                  ),
                ),
                if (foodNumber.isNotEmpty) // Display kcal and categories if available
                Text(
                  "$foodNumber Programs",
                  style: Styles.normal.copyWith(
                    fontSize: 12,
                  ),
                ),
                
                const Gap(10),
                SizedBox(
                    width: 110,
                    height: 30,
                      child: MainButton(
                        title: "View More",
                        buttonColor: Styles.primaryColor,
                        onPressed: () => widget.onPressed(widget.wObj),
                      textStyle: Styles.seeMore.copyWith(
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
                    widget.wObj["image"].toString(),
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


class ProgramRow extends StatefulWidget {
  final String image;
  final String title;
  final String bottomText;
  final double? progress;
  final String? progressText;
  final IconData icon;
  final bool showToggleSwitch;

  const ProgramRow({
    super.key,
    this.progress, // Provide a default value of null
    this.icon = FluentSystemIcons.ic_fluent_chevron_right_filled, // Provide a default icon
    this.showToggleSwitch = true,
    required this.image,
    required this.title,
    required this.bottomText,
    this.progressText, // Provide a default value to show the ToggleSwitch
  });

  @override
  State<ProgramRow> createState() => _ProgramRowState();
}

class _ProgramRowState extends State<ProgramRow> {
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
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Container(
              width: 60,
              height: 60,
              color: Styles.secondColor.withOpacity(0.6),
              child: Image.asset(
                widget.image,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.title, style: Styles.text15bold),
                Text(
                  widget.bottomText,
                  style: Styles.normal.copyWith(
                    fontSize: 12,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                if (widget.progress != null &&
                    widget.progressText !=
                        null) // Conditionally render the progress bar
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
                        "${widget.progressText!} days", // Display the duration here
                        style: Styles.normal.copyWith(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
          if (widget.showToggleSwitch) // Conditionally render the ToggleSwitch
            const ToggleSwitch(),
          if (!widget.showToggleSwitch) // Conditionally render the default icon
            IconButton(
              onPressed: () {},
              icon: Icon(
                widget.icon,
                size: 30,
                color: Styles.secondColor,
              ),
            ),
        ],
      ),
    );
  }
}




class RecommedContainer extends StatefulWidget {
  final String image;
  final String title;
  final String bottomText;
  const RecommedContainer({super.key, required this.image, required this.title, required this.bottomText});

  @override
  State<RecommedContainer> createState() => _RecommedContainerState();
}

class _RecommedContainerState extends State<RecommedContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: 160,
      decoration: BoxDecoration(
          color: Styles.secondColor.withOpacity(0.4),
          borderRadius: BorderRadius.circular(25)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            widget.image,
            width: 80,
            height: 80,
            fit: BoxFit.contain,
          ),
          const Gap(5),
          Text(
            widget.title,
            style: Styles.seeMore.copyWith(
              color: Colors.black,
            ),
          ),
          Text(
            widget.bottomText,
            style: Styles.normal.copyWith(
              fontSize: 12,
              color: Colors.black,
            ),
          ),
          const Gap(12),
          Text(
            "View",
            style: Styles.seeMore.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
