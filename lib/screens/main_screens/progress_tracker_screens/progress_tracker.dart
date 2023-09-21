import 'package:flutter/material.dart';
import 'package:ifit/common/widgets/programs_chart.dart';

class ProgressTrackerScreen extends StatefulWidget {
  const ProgressTrackerScreen({super.key});

  @override
  State<ProgressTrackerScreen> createState() => _ProgressTrackerScreenState();
}

class _ProgressTrackerScreenState extends State<ProgressTrackerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
               const Text(
                'ProgressScreen, On Standby'
              ),
              Container(
                padding: const EdgeInsets.all(15),
                height: 500,
                child: ProgramsChart()),
            ],
          ),
        ],
      ),
    );
  }
}