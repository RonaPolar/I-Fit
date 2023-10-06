import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:ifit/common/utils/app_styles.dart';

class MealCategory extends StatefulWidget {
  const MealCategory({super.key});

  @override
  State<MealCategory> createState() => _MealCategoryState();
}

class _MealCategoryState extends State<MealCategory> {
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
        title: Text('Profile',
        style: Styles.headline20,),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [



              ],//main Children
            ),
          ),
        ],

      ),
    );
  }
}