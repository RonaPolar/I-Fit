import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/screens/clients_main_screens/discover_screens/my_program/body/cancelled_program.dart';
import 'package:ifit/screens/clients_main_screens/discover_screens/my_program/body/favorites_program.dart';
import 'package:ifit/screens/clients_main_screens/discover_screens/my_program/body/finished_program.dart';
import 'package:ifit/screens/clients_main_screens/discover_screens/my_program/body/ongoing_program.dart';
import 'package:ifit/screens/clients_main_screens/program_tracker_screens/rate_screens/my_rate.dart';

class MyProgramScreen extends StatefulWidget {
  final int initialSelectTab;
  final Widget initialCurrentTab;
  
  const MyProgramScreen({super.key, 
  required this.initialSelectTab, 
  required this.initialCurrentTab});

  @override
  State<MyProgramScreen> createState() => _MyProgramScreenState();
}

class _MyProgramScreenState extends State<MyProgramScreen> with SingleTickerProviderStateMixin{
  late TabController tabController;
  late Widget currentTab;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, initialIndex: widget.initialSelectTab, vsync: this);
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
          'My Programs',
          style: Styles.headline20,
        ),
        actions: [
          InkWell(
            onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(
                builder: (context) => const ToRateProgram()));
            },
            child: Container(
              margin: const EdgeInsets.all(12),
              height: 30,
              width: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10)),
              child: const Icon(FluentSystemIcons.ic_fluent_star_regular,
                size: 20,
                color: Colors.black,
              ),
            ),
          ),
        ],
        bottom: TabBar(
        controller: tabController,
        tabs: const <Tab>[
          Tab(text: 'Ongoing'),
          Tab(text: 'Favorites'),
          Tab(text: 'Finished'),
          Tab(text: 'Cancelled'),
        ],
        labelColor: primary, // Customize the selected tab text color.
        unselectedLabelColor: Colors.black, // Customize the unselected tab text color.
        indicatorColor: primary,
      ),
      ),
      body: TabBarView(
        controller: tabController,
        children: const <Widget>[
          OngoingProgramScreen(),
          FavoritesProgramScreen(),
          FinishedProgramScreen(),
          CancelledProgramScreen(),
        ],
      ),
      
    );
  }
}


class OngoingPrograms extends StatefulWidget {
  const OngoingPrograms({super.key});

  @override
  State<OngoingPrograms> createState() => _OngoingProgramsState();
}

class _OngoingProgramsState extends State<OngoingPrograms> {
  @override
  Widget build(BuildContext context) {
    return const MyProgramScreen(initialSelectTab: 0, initialCurrentTab: OngoingProgramScreen());
  }
}


class FavoritesProgram extends StatefulWidget {
  const FavoritesProgram({super.key});

  @override
  State<FavoritesProgram> createState() => _FavoritesProgramState();
}

class _FavoritesProgramState extends State<FavoritesProgram> {
  @override
  Widget build(BuildContext context) {
    return const MyProgramScreen(initialSelectTab: 1, initialCurrentTab: FavoritesProgramScreen());
  }
}


class FinishedProgram extends StatefulWidget {
  const FinishedProgram({super.key});

  @override
  State<FinishedProgram> createState() => _FinishedProgramState();
}

class _FinishedProgramState extends State<FinishedProgram> {
  @override
  Widget build(BuildContext context) {
    return const MyProgramScreen(initialSelectTab: 2, initialCurrentTab: FinishedProgramScreen());
  }
}


class CancelledProgram extends StatefulWidget {
  const CancelledProgram({super.key});

  @override
  State<CancelledProgram> createState() => _CancelledProgramState();
}

class _CancelledProgramState extends State<CancelledProgram> {
  @override
  Widget build(BuildContext context) {
    return const MyProgramScreen(initialSelectTab: 3, initialCurrentTab: CancelledProgramScreen());
  }
}


