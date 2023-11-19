import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/screens/experts_main_screens/exp_bottom_bar.dart';

class ExpProgramScreen extends StatefulWidget {
  const ExpProgramScreen({super.key});

  @override
  State<ExpProgramScreen> createState() => _ExpProgramScreenState();
}

class _ExpProgramScreenState extends State<ExpProgramScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      appBar: AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
      leading: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
            builder: (context) => const ExpHome()));
        },
        child: Container(
          margin: const EdgeInsets.all(12),
            height: 30,
            width: 30,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10)),
          child: const Icon(
            FluentSystemIcons.ic_fluent_chevron_left_filled,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      title: Text('Program Progress',
      style: Styles.headline20,),
      actions: [
          InkWell(
            onTap: () {
            // Navigator.of(context).push(
            //     MaterialPageRoute(
            //     builder: (context) => const OngoingPrograms()));
            },
            child: Container(
              margin: const EdgeInsets.all(12),
              height: 30,
              width: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10)),
              child: const Icon(FluentSystemIcons.ic_fluent_person_regular,
                size: 20,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),



    );
  }
}
