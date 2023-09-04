import 'package:flutter/material.dart';
import 'package:ifit/common/utils/app_styles.dart';

class RegisterPart2 extends StatefulWidget {
  const RegisterPart2({super.key});

  @override
  State<RegisterPart2> createState() => _RegisterPart2State();
}

class _RegisterPart2State extends State<RegisterPart2> {
  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Styles.bgColor,
    body: Center(
      child: ListView(
        shrinkWrap: true,
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            child: const Column(
              children: [
                Text(
                  'Profile Details, On Standby',
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
}