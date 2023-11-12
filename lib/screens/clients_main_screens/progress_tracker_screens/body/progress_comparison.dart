import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/icon_text_icon.dart';
import 'package:ifit/common/widgets/main_button.dart';
import 'package:ifit/screens/clients_main_screens/progress_tracker_screens/body/progress_result.dart';

class ProgressComparison extends StatefulWidget {
  const ProgressComparison({super.key});

  @override
  State<ProgressComparison> createState() => _ProgressComparisonState();
}

class _ProgressComparisonState extends State<ProgressComparison> {
  @override
  Widget build(BuildContext context) {
    // var media = MediaQuery.of(context).size;
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
          'Comparison',
          style: Styles.headline20,
        ),
      ),
      body: Container(
      padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: 
                ListView(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: NextNavigation(
                        title: "Select Month 1",
                        iconData: Icons.calendar_month_outlined,
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => const WorkoutSchedule(),
                          //   ),
                          // );
                        }),
                    ),

                    const Gap(15),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: NextNavigation(
                        title: "Select Month 2",
                        iconData: Icons.calendar_month_outlined,
                        onTap: () {
                          // Navigator.push(context,
                          //   MaterialPageRoute(
                          //     builder: (context) => const WorkoutSchedule()));
                        }),
                    ),
                  ],
                ),
              ),

            MainButton(title: "Compare", 
              onPressed: (){
                Navigator.pushReplacement(context,
                  MaterialPageRoute(
                    builder: (context) => ProgressResult(
                      date1: DateTime(2023, 09, 1),
                      date2: DateTime(2023, 10, 1),
                    )));
            }),
          ], //main Children
        ),
      ),
    );
  }
}
