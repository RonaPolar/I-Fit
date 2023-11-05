import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';

class ToRateExpertScreen extends StatefulWidget {
  const ToRateExpertScreen({super.key});

  @override
  State<ToRateExpertScreen> createState() => _ToRateExpertScreenState();
}

class _ToRateExpertScreenState extends State<ToRateExpertScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        children: const [
          Gap(15),
          Column(
            children: [
              Text('To Expert'),
            ],
          )]));
  }
}