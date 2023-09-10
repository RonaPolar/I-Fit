import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/bottom_bar.dart';
import 'package:ifit/screens/main_screens/activity.dart';
import 'package:ifit/screens/main_screens/discover.dart';
import 'package:ifit/screens/main_screens/home.dart';
import 'package:ifit/screens/main_screens/profile.dart';
import 'package:ifit/screens/main_screens/tracker.dart';
// import 'package:ifit/common/widgets/bottom_bar.dart';

class MainBottomBar extends StatefulWidget {
  const MainBottomBar({super.key});

  @override
  State<MainBottomBar> createState() => _MainBottomBarState();
}

class _MainBottomBarState extends State<MainBottomBar> {
  int selectTab = 0;
  final PageStorageBucket pageBucket = PageStorageBucket();
  Widget currentTab = const HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(bucket: pageBucket, child: currentTab),
      backgroundColor: Styles.bgColor,
      bottomNavigationBar: BottomAppBar(
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
                icon: FluentSystemIcons.ic_fluent_search_regular,
                selectIcon: FluentSystemIcons.ic_fluent_search_filled,
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
                  currentTab = const TrackerScreen();
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
                  currentTab = const ActivityScreen();
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
