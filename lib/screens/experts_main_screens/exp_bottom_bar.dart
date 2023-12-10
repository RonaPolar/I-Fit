import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/screens/clients_main_screens/main_bottom_bar.dart';
import 'package:ifit/screens/experts_main_screens/exp_discover_screens/exp_discover.dart';
import 'package:ifit/screens/experts_main_screens/exp_home_screens/exp_home.dart';
import 'package:ifit/screens/experts_main_screens/exp_profile_screens/exp_profile.dart';
import 'package:ifit/screens/experts_main_screens/exp_program_screens/exp_program.dart';


class ExpBottomBar extends StatefulWidget {
  final int initialSelectTab;
  final Widget initialCurrentTab;
  
  const ExpBottomBar({super.key, required this.initialSelectTab, required this.initialCurrentTab});

  @override
  State<ExpBottomBar> createState() => _ExpBottomBarState();
}

class _ExpBottomBarState extends State<ExpBottomBar> {
  int selectTab = 0;
  late PageStorageBucket pageBucket;
  late Widget currentTab;

  @override
  void initState() {
    super.initState();
    selectTab = widget.initialSelectTab;
    currentTab = widget.initialCurrentTab;
    pageBucket = PageStorageBucket();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(bucket: pageBucket, child: currentTab),
      bottomNavigationBar: BottomAppBar(  //the line above the bottombar
          child: Container(
        decoration: BoxDecoration(color: Styles.bgColor, boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 2, offset: Offset(0, -2))
        ]),
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomBar(
                icon: FluentSystemIcons.ic_fluent_home_regular,
                selectIcon: FluentSystemIcons.ic_fluent_home_filled,
                isActive: selectTab == 0,
                onTap: () {
                  selectTab = 0;
                  currentTab = const ExpHomeScreen();
                  if (mounted) {
                    setState(() {});
                  }
                }),
            BottomBar(
                icon: FluentSystemIcons.ic_fluent_grid_regular,
                selectIcon: FluentSystemIcons.ic_fluent_grid_filled,
                isActive: selectTab == 1,
                onTap: () {
                  selectTab = 1;
                  currentTab = const ExpDiscoverScreen();
                  if (mounted) {
                    setState(() {});
                  }
                }),
            BottomBar(
                icon: FluentSystemIcons.ic_fluent_activity_regular,
                selectIcon: FluentSystemIcons.ic_fluent_activity_filled,
                isActive: selectTab == 2,
                onTap: () {
                  selectTab = 2;
                  currentTab = const ExpProgramScreen();
                  if (mounted) {
                    setState(() {});
                  }
                }),
            BottomBar(
                icon: FluentSystemIcons.ic_fluent_person_regular,
                selectIcon: FluentSystemIcons.ic_fluent_person_filled,
                isActive: selectTab == 3,
                onTap: () {
                  selectTab = 3;
                  currentTab = const ExpProfileScreen();
                  if (mounted) {
                    setState(() {});
                  }
                }),
          ],
        ),
      )),
    );
  }
}



class ExpHome extends StatefulWidget {
  const ExpHome({super.key});

  @override
  State<ExpHome> createState() => _ExpHomeState();
}

class _ExpHomeState extends State<ExpHome> {
  @override
  Widget build(BuildContext context) {
    return const ExpBottomBar(initialSelectTab: 0, initialCurrentTab: ExpHomeScreen());
  }
}


class ExpDiscover extends StatefulWidget {
  const ExpDiscover({super.key});

  @override
  State<ExpDiscover> createState() => _ExpDiscoverState();
}

class _ExpDiscoverState extends State<ExpDiscover> {
  @override
  Widget build(BuildContext context) {
    return const ExpBottomBar(initialSelectTab: 1, initialCurrentTab: ExpDiscoverScreen());
  }
}


class ExpPrograms extends StatefulWidget {
  const ExpPrograms({super.key});

  @override
  State<ExpPrograms> createState() => _ExpProgramsState();
}

class _ExpProgramsState extends State<ExpPrograms> {
  @override
  Widget build(BuildContext context) {
    return const ExpBottomBar(initialSelectTab: 2, initialCurrentTab: ExpProgramScreen());
  }
}


class ExpProfile extends StatefulWidget {
  const ExpProfile({super.key});

  @override
  State<ExpProfile> createState() => _ExpProfileState();
}

class _ExpProfileState extends State<ExpProfile> {
  @override
  Widget build(BuildContext context) {
    return const ExpBottomBar(initialSelectTab: 3, initialCurrentTab: ExpProfileScreen());
  }
}