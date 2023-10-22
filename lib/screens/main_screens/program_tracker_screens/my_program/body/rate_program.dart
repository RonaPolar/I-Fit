import 'package:flutter/material.dart';
import 'package:ifit/common/utils/app_styles.dart';

class RateProgramScreen extends StatefulWidget {
  const RateProgramScreen({super.key});

  @override
  State<RateProgramScreen> createState() => _RateProgramScreenState();
}

class _RateProgramScreenState extends State<RateProgramScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        children: const [
          Column(
            children: [
              Text('Rate'),
            ],
          )]));
  }
}