import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/screens/main_screens/program_tracker_screens/program_rate/body/to_rate_expert.dart';
import 'package:ifit/screens/main_screens/program_tracker_screens/program_rate/body/to_rate_program.dart';

class MyRateScreen extends StatefulWidget {
  final int initialSelectTab;
  final Widget initialCurrentTab;

  const MyRateScreen(
      {super.key,
      required this.initialSelectTab,
      required this.initialCurrentTab});

  @override
  State<MyRateScreen> createState() => _MyRateScreenState();
}

class _MyRateScreenState extends State<MyRateScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late Widget currentTab;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
        length: 2, initialIndex: widget.initialSelectTab, vsync: this);
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
          'My Rating',
          style: Styles.headline20,
        ),
        bottom: TabBar(
          controller: tabController,
          tabs: const <Tab>[
            Tab(text: 'To Rate'),
            Tab(text: 'Expert Rating'),
          ],
          labelColor: primary, // Customize the selected tab text color.
          unselectedLabelColor:
              Colors.black, // Customize the unselected tab text color.
          indicatorColor: primary,
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: const <Widget>[
          ToRateProgramScreen(),
          ToRateExpertScreen(),
        ],
      ),
    );
  }
}

class ToRateProgram extends StatefulWidget {
  const ToRateProgram({super.key});

  @override
  State<ToRateProgram> createState() => _ToRateProgramState();
}

class _ToRateProgramState extends State<ToRateProgram> {
  @override
  Widget build(BuildContext context) {
    return const MyRateScreen(
        initialSelectTab: 0, initialCurrentTab: ToRateProgramScreen());
  }
}

class ToRateExpertProgram extends StatefulWidget {
  const ToRateExpertProgram({super.key});

  @override
  State<ToRateExpertProgram> createState() => _ToRateExpertProgramState();
}

class _ToRateExpertProgramState extends State<ToRateExpertProgram> {
  @override
  Widget build(BuildContext context) {
    return const MyRateScreen(
        initialSelectTab: 1, initialCurrentTab: ToRateExpertScreen());
  }
}
