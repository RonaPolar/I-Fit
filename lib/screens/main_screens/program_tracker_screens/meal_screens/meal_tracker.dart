import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/charts/meal_piechart.dart';
import 'package:ifit/common/widgets/more_icon.dart';
import 'package:ifit/common/widgets/program_widgets.dart';
import 'package:ifit/screens/main_screens/program_tracker_screens/meal_screens/meal_category.dart';
import 'package:ifit/screens/main_screens/program_tracker_screens/meal_screens/meal_details.dart';
import 'package:ifit/screens/main_screens/program_tracker_screens/program_schedule.dart';

class MealTrackerScreen extends StatefulWidget {

  const MealTrackerScreen({super.key});

  @override
  State<MealTrackerScreen> createState() => _MealTrackerScreenState();
}

class _MealTrackerScreenState extends State<MealTrackerScreen> {

  List what2EatArr = [
    {
      "name": "Breakfast",
      "image": "assets/icons/breakfast.png",
      "foodNumber": "120",
    },
    {
      "name": "Lunch",
      "image": "assets/icons/lunch.png",
      "foodNumber": "120",
    },
    {
      "name": "Dinner",
      "image": "assets/icons/dinner.png",
      "foodNumber": "120",
    },
    {
      "name": "Snacks",
      "image": "assets/icons/snacks.png",
      "foodNumber": "120",
    },
    {
      "name": "Drinks",
      "image": "assets/icons/drinks.png",
      "foodNumber": "120",
    },
  ];

  List upcomingMealArr = [
    {
      "name": "Blueberry Pancake",
      "image": "assets/images/meal/pancake.png",
      "kcal": "200",
      "fats": "100",
      "proteins": "300",
      "sugar": "50",
      "schedule": "Monday",
      "time": "9:00am",
    },
    {
      "name": "Salad",
      "image": "assets/images/meal/salad.png",
      "kcal": "200",
      "fats": "100",
      "proteins": "300",
      "sugar": "50",
      "schedule": "Monday",
      "time": "10:00am",
    },
    {
      "name": "Salmon Nigiri",
      "image": "assets/images/meal/nigiri.png",
      "kcal": "300",
      "fats": "250",
      "proteins": "310",
      "sugar": "100",
      "schedule": "Monday",
      "time": "4:00pm",
    },
  ];

  
@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      appBar: AppBar(
        backgroundColor: Styles.bgColor,
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
          'Meal Tracker',
          style: Styles.headline20),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            height: 30,
            width: 30,
            alignment: Alignment.center,
            child: const MoreIcon(options: ['This Week','This Month'], iconData: FluentSystemIcons.ic_fluent_more_filled,
            ),
          ),
        ],
      ),

      body:ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 230,
                  width: double.maxFinite,
                  child: MealPieChart(),
                ),
                const Gap(20),
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Text(
                    "Upcoming Meal Schedule",
                    style: Styles.title
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                        builder: (context) => const MealSched()));
                    },
                    child: Text(
                      "See More",
                      style: Styles.seeMore
                      ),
                    )
                  ],
                ),
                ListView.builder( //Meal Content
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: upcomingMealArr.length,
                    itemBuilder: (context, index) {
                      var mObj = upcomingMealArr[index] as Map? ?? {};
                      return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MealDetails(dObj: mObj)),
                            );
                          },
                          child: ProgramRow(image: mObj["image"], 
                          title: mObj["name"], 
                          bottomText: "${mObj["schedule"]} | ${mObj["time"]}", 
                          showToggleSwitch: true,
                        ));
                    }),
      
                const Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Find Something to Eat and Drink",
                      style: Styles.title
                    ),
                  ],
                ),
                ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: what2EatArr.length,
                      itemBuilder: (context, index) {
                        var mObj = what2EatArr[index] as Map? ?? {};
                        return What2Container(wObj: mObj, 
                          onPressed: (obj) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MealCategory(mObj: mObj,)),
                              );
                            },
                          );
                      }),
              ],
            ),
          )
        ],
      ),  //Main top
    );
}
}