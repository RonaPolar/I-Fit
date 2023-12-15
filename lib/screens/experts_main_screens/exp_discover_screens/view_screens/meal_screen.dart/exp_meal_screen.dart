import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/program_widgets.dart';
import 'package:ifit/screens/experts_main_screens/exp_discover_screens/my_programs/exp_my_programs.dart';
import 'package:ifit/screens/experts_main_screens/exp_discover_screens/view_screens/meal_screen.dart/exp_meal_category.dart';
import 'package:ifit/screens/experts_main_screens/exp_discover_screens/view_screens/meal_screen.dart/view_meal.dart';

class ExpMealScreen extends StatefulWidget {
  const ExpMealScreen({super.key});

  @override
  State<ExpMealScreen> createState() => _ExpMealScreenState();
}

class _ExpMealScreenState extends State<ExpMealScreen> {

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

  List createdMealArr = [
    {
      "name": "Blueberry Pancake",
      "image": "assets/images/meal/pancake.png",
      "rate": "4.9",
      "kcal": "190",
      "fats": "199",
      "proteins": "305",
      "sugar": "150",
      "categories": "Breakfast",
      "clients": "13",
    },
    {
      "name": "Salad",
      "image": "assets/images/meal/salad.png",
      "rate": "4.6",
      "kcal": "200",
      "fats": "100",
      "proteins": "300",
      "sugar": "50",
      "categories": "Lunch",
      "clients": "15",
    },
    {
      "name": "Salmon Nigiri",
      "image": "assets/images/meal/nigiri.png",
      "rate": "4.3",
      "kcal": "300",
      "fats": "250",
      "proteins": "310",
      "sugar": "100",
      "categories": "Dinner",
      "clients": "27",
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
          'Meal Programs',
          style: Styles.headline20),
      ),

      body:ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 150,
                    height: 150,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: primary,
                      borderRadius: BorderRadius.circular(75),
                    ),
                    child: FittedBox(
                      child: Text(
                        "12",
                        textAlign: TextAlign.center,
                        style: Styles.headlineBig.copyWith(
                            color: Colors.white,
                          ),
                      ),
                      ),
                    ),
                ),
               
                const Gap(20),
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Text(
                    "Meals Created",
                    style: Styles.title
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                        builder: (context) => const ExpCreatedProgram()));
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
                    itemCount: createdMealArr.length,
                    itemBuilder: (context, index) {
                      var mObj = createdMealArr[index] as Map? ?? {};
                      return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ViewMealDetails(dObj: mObj)),
                            );
                          },
                          child: ProgramRow(image: mObj["image"], 
                          title: mObj["name"], 
                          bottomText: "${mObj["categories"]} | ${mObj["clients"]} Clients",
                          showToggleSwitch: false,
                        ));
                    }),
      
                const Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Categories",
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
                                  builder: (context) => ExpMealCategory(mObj: mObj)),
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

