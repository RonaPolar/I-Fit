import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';

class ToRateProgramScreen extends StatefulWidget {
  const ToRateProgramScreen({super.key});

  @override
  State<ToRateProgramScreen> createState() => _ToRateProgramScreenState();
}

class _ToRateProgramScreenState extends State<ToRateProgramScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        children: const [
          Gap(15),
          Column(
            children: [
              Text('Rate Program'),
            ],
          )]));
  }
}