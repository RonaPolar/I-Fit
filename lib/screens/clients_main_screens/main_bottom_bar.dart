import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/screens/clients_main_screens/program_tracker_screens/program_tracker.dart';
import 'package:ifit/screens/clients_main_screens/progress_tracker_screens/progress_tracker.dart';
import 'package:ifit/screens/clients_main_screens/discover_screens/discover.dart';
import 'package:ifit/screens/clients_main_screens/home_screens/home.dart';
import 'package:ifit/screens/clients_main_screens/profile_screens/profile.dart';

class BottomBar extends StatelessWidget {
  final IconData icon;
  final IconData selectIcon;
  final VoidCallback onTap;
  final bool isActive;

  const BottomBar({
    Key? key, 
    required this.icon,
    required this.selectIcon,
    required this.isActive,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isActive ? selectIcon : icon,
            color: isActive ? primary : Colors.black,
          ),          SizedBox(
          height: isActive ?  5: 12,  //padding between circle and icons
        ),
        if(isActive)  
        Container(  //the circle under the icons of bottom navbar when onTapped
          width: 4,
          height: 4,
          decoration: BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.circular(2)),
        )
      ]),
    );
  }
}

//for the navigation bottom bar itself
class MainBottomBar extends StatefulWidget {
  final int initialSelectTab;
  final Widget initialCurrentTab;

  const MainBottomBar({
    Key? key,
    required this.initialSelectTab,
    required this.initialCurrentTab,
  }) : super(key: key);


  @override
  State<MainBottomBar> createState() => _MainBottomBarState();
}

class _MainBottomBarState extends State<MainBottomBar> {
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
                  currentTab = const HomeScreen();
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
                  currentTab = const DiscoverScreen();
                  if (mounted) {
                    setState(() {});
                  }
                }),
            BottomBar(
                icon: FluentSystemIcons.ic_fluent_accessibility_regular,
                selectIcon: FluentSystemIcons.ic_fluent_accessibility_filled,
                isActive: selectTab == 2,
                onTap: () {
                  selectTab = 2;
                  currentTab = const ProgressTrackerScreen();
                  if (mounted) {
                    setState(() {});
                  }
                }),
            BottomBar(
                icon: FluentSystemIcons.ic_fluent_activity_regular,
                selectIcon: FluentSystemIcons.ic_fluent_activity_filled,
                isActive: selectTab == 3,
                onTap: () {
                  selectTab = 3;
                  currentTab = const ProgramTrackerScreen();
                  if (mounted) {
                    setState(() {});
                  }
                }),
            BottomBar(
                icon: FluentSystemIcons.ic_fluent_person_regular,
                selectIcon: FluentSystemIcons.ic_fluent_person_filled,
                isActive: selectTab == 4,
                onTap: () {
                  selectTab = 4;
                  currentTab = const ProfileScreen();
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

class HomeNavBar extends StatefulWidget {
  const HomeNavBar({super.key});

  @override
  State<HomeNavBar> createState() => _HomeNavBarState();
}
class _HomeNavBarState extends State<HomeNavBar> {
  @override
  Widget build(BuildContext context) {
    return const MainBottomBar(initialSelectTab: 0, initialCurrentTab: HomeScreen());
  }
}


class DiscoverNavbar extends StatefulWidget {
  const DiscoverNavbar({super.key});
  @override
  State<DiscoverNavbar> createState() => _DiscoverNavbarState();
}
class _DiscoverNavbarState extends State<DiscoverNavbar> {
  @override
  Widget build(BuildContext context) {
    return const MainBottomBar(initialSelectTab: 1, initialCurrentTab: DiscoverScreen());
  }
}


class ProgressTrackerNavBar extends StatefulWidget {
  const ProgressTrackerNavBar({super.key});
  @override
  State<ProgressTrackerNavBar> createState() => _ProgressTrackerNavBarState();
}
class _ProgressTrackerNavBarState extends State<ProgressTrackerNavBar> {
  @override
  Widget build(BuildContext context) {
    return const MainBottomBar(initialSelectTab: 2, initialCurrentTab: ProgressTrackerScreen());
  }
}


class ProgramTrackerNavbar extends StatefulWidget {
  const ProgramTrackerNavbar({super.key});
  @override
  State<ProgramTrackerNavbar> createState() => _ProgramTrackerNavbarState();
}
class _ProgramTrackerNavbarState extends State<ProgramTrackerNavbar> {
  @override
  Widget build(BuildContext context) {
    return const MainBottomBar(initialSelectTab: 3, initialCurrentTab: ProgramTrackerScreen());
  }
}


class ProfileNavBar extends StatefulWidget {
  const ProfileNavBar({super.key});
  @override
  State<ProfileNavBar> createState() => _ProfileNavBarState();
}
class _ProfileNavBarState extends State<ProfileNavBar> {
  @override
  Widget build(BuildContext context) {
    return const MainBottomBar(initialSelectTab: 4, initialCurrentTab: ProfileScreen());
  }
}