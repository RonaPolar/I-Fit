import 'package:flutter/material.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';

class LatestActivityRow extends StatefulWidget {
  final Map wObj;
  final double? progress; // Make progress optional


  const LatestActivityRow({
    Key? key,
    required this.wObj,
    this.progress, // Provide a default value of null

  }) : super(key: key);

  @override
  State<LatestActivityRow> createState() => _LatestActivityRowState();
}

class _LatestActivityRowState extends State<LatestActivityRow> {
  @override
  Widget build(BuildContext context) {
    final String name = widget.wObj["name"].toString();
    final String kcal = widget.wObj["kcal"]?.toString() ?? '';
    final String time = widget.wObj["time"]?.toString() ?? ''; // Make time optional
    final String categories = widget.wObj["categories"]?.toString() ?? ''; // Make categories optional
    final String duration = widget.wObj["duration"].toString();

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
                if (time.isNotEmpty) // Display time if available
                  Text(
                    "$kcal Calories | $time minutes",
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
                        "$duration days", // Display the duration here
                        style: TextStyle(
                          color: Styles.fadeTextColor,
                          fontSize: 12,
                        ),
                      )
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
