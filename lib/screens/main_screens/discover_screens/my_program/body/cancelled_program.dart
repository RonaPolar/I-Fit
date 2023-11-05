import 'package:flutter/material.dart';
import 'package:ifit/common/utils/app_styles.dart';

class CancelledProgramScreen extends StatefulWidget {
  const CancelledProgramScreen({super.key});

  @override
  State<CancelledProgramScreen> createState() => _CancelledProgramScreenState();
}

class _CancelledProgramScreenState extends State<CancelledProgramScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        children: const [
          Column(
            children: [
              Text('Cancelled'),
            ],
          )]));
  }
}