import 'package:flutter/material.dart';
import 'package:ifit/common/utils/app_styles.dart';

class OngoingProgramScreen extends StatefulWidget {
  const OngoingProgramScreen({super.key});

  @override
  State<OngoingProgramScreen> createState() => _OngoingProgramScreenState();
}

class _OngoingProgramScreenState extends State<OngoingProgramScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        children: const [
          Column(
            children: [
              Text('Ongoing'),
            ],
          )]));
  }
}