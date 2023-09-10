import 'package:flutter/material.dart';
// import 'package:ifit/common/widgets/bottom_bar.dart';

class TrackerScreen extends StatefulWidget {
  const TrackerScreen({super.key});

  @override
  State<TrackerScreen> createState() => _TrackerScreenState();
}

class _TrackerScreenState extends State<TrackerScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'TrackerScreen, On Standby'
        )
      ),
      // bottomNavigationBar: BottomBar(),
    );
  }
}