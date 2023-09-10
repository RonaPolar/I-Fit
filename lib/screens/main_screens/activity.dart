import 'package:flutter/material.dart';
// import 'package:ifit/common/widgets/bottom_bar.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'ActivityScreen, On Standby'
        )
      ),
      // bottomNavigationBar: BottomBar(),
    );
  }
}