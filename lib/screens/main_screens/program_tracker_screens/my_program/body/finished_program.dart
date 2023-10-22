import 'package:flutter/material.dart';
import 'package:ifit/common/utils/app_styles.dart';

class FinishedProgramScreen extends StatefulWidget {
  const FinishedProgramScreen({super.key});

  @override
  State<FinishedProgramScreen> createState() => _FinishedProgramScreenState();
}

class _FinishedProgramScreenState extends State<FinishedProgramScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        children: const [
          Column(
            children: [
              Text('Finished'),
            ],
          )]));
  }
}