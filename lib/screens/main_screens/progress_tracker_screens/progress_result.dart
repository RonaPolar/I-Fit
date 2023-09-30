import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/main_button.dart';
import 'package:ifit/screens/main_screens/main_bottom_bar.dart';

class ProgressResult extends StatefulWidget {
  const ProgressResult({super.key});

  @override
  State<ProgressResult> createState() => _ProgressResultState();
}

class _ProgressResultState extends State<ProgressResult> {
  @override
  Widget build(BuildContext context) {
    // var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Styles.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
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
        title: Text(
          'Result',
          style: Styles.headline20,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(

              ),
            ),

            MainButton(title: "Back to Home", 
              onPressed: (){
                Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => const HomeNavBar()));
            }),
          ],  //Main Children
        ),
      ),
    );
  }
}
