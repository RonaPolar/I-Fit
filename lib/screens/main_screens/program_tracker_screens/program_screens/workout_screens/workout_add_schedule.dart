import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/utils/common_utils.dart';
import 'package:ifit/common/widgets/icon_text_icon.dart';
import 'package:ifit/common/widgets/main_button.dart';
import 'package:ifit/screens/main_screens/program_tracker_screens/program_screens/workout_screens/workout_schedule.dart';

class WorkoutAddSchedule extends StatefulWidget {
  final DateTime date;
  const WorkoutAddSchedule({super.key, required this.date});

  @override
  State<WorkoutAddSchedule> createState() => _WorkoutAddScheduleState();
}

class _WorkoutAddScheduleState extends State<WorkoutAddSchedule> {
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
        title: Text(
          'Add Schedule',
          style: Styles.headlineSmall,
        ),
      ),
      body: Scaffold(
        backgroundColor: Styles.bgColor,
        body: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: 
                  ListView(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_month_outlined,
                            color: Styles.fadeTextColor,
                            size: 25,
                          ),
                          const Gap(5),
                          Text(
                            dateToString(widget.date, formatStr: "E, dd MMMM yyyy"),
                            style: TextStyle(
                              color: Styles.fadeTextColor,
                              fontSize: 18),
                          )
                        ],
                      ),
                   
            
                  const Gap(30),
                  Text(
                    'Time',
                    style: Styles.title
                  ),
                  SizedBox(
                    height: 85,
                    child: CupertinoDatePicker(
                      onDateTimeChanged: (newDate) {},
                      initialDateTime: DateTime.now(),
                      use24hFormat: false,
                      minuteInterval: 1,
                      mode: CupertinoDatePickerMode.time,
                    ),
                  ),
            
                  const Gap(30),
                  Text(
                    'Program Details',
                    style: Styles.title
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
                      title: "Choose Workout",
                      iconData: Icons.fitness_center_outlined,
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const WorkoutSchedule(),
                        //   ),
                        // );
                      }),
                  ),
                  const Gap(5),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Styles.textColor,
                        ),
                      ),
                      Text(
                        ' Or ',
                        style: Styles.textStyle,
                      ),
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Styles.textColor,
                        ),
                      ),
                    ],
                  ),
                  const Gap(5),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: NextNavigation(
                      title: "Choose Meal",
                      iconData: Icons.fastfood_outlined,
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const WorkoutSchedule(),
                        //   ),
                        // );
                      }),
                  ),
                 ],
                ),
              ),
              MainButton(
                title: 'Save', 
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WorkoutSchedule(),
                    ),
                  );
              }),
            
            ], //main Children
          ),
        ),
      ),
    );
  }
}
