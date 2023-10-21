import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/screens/main_screens/program_tracker_screens/program_schedule/meal_schedule.dart';
import 'package:ifit/screens/main_screens/program_tracker_screens/program_schedule/workout_schedule.dart';



class ProgramSched extends StatefulWidget {
  final int initialSelectTab;
  final Widget initialCurrentTab;

  const ProgramSched({
    Key? key,
    required this.initialSelectTab,
    required this.initialCurrentTab,
  }) : super(key: key);

  @override
  State<ProgramSched> createState() => _ProgramSchedState();
}

class _ProgramSchedState extends State<ProgramSched> with SingleTickerProviderStateMixin {
  late TabController tabController;
  late Widget currentTab;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, initialIndex: widget.initialSelectTab, vsync: this);
    currentTab = widget.initialCurrentTab;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Program Schedule',
          style: Styles.headline20,
        ),
        bottom: TabBar(
        controller: tabController,
        tabs: const <Tab>[
          Tab(text: 'Meal'),
          Tab(text: 'Workout'),
        ],
        labelColor: primary, // Customize the selected tab text color.
        unselectedLabelColor: Colors.black, // Customize the unselected tab text color.
      ),
      ),
      body: TabBarView(
        controller: tabController,
        children: const <Widget>[
          MealSchedule(),
          WorkoutSchedule(),
        ],
      ),
      
    );
  }
}


class MealSched extends StatefulWidget {
  const MealSched({super.key});

  @override
  State<MealSched> createState() => _MealSchedState();
}

class _MealSchedState extends State<MealSched> {
  @override
  Widget build(BuildContext context) {
    return const ProgramSched(
        initialSelectTab: 0, initialCurrentTab: MealSchedule());
  }
}


class WorkoutSched extends StatefulWidget {
  const WorkoutSched({super.key});

  @override
  State<WorkoutSched> createState() => _WorkoutSchedState();
}

class _WorkoutSchedState extends State<WorkoutSched> {
  @override
  Widget build(BuildContext context) {
    return const ProgramSched(
        initialSelectTab: 1, initialCurrentTab: WorkoutSchedule());
  }
}