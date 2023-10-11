import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/meal_widgets.dart';
import 'package:ifit/common/widgets/program_category.dart';
import 'package:ifit/screens/main_screens/program_tracker_screens/meal_screens/meal_details.dart';

class MealCategory extends StatefulWidget {
  final Map mObj;
  const MealCategory({super.key, required this.mObj});

  @override
  State<MealCategory> createState() => _MealCategoryState();
}

class _MealCategoryState extends State<MealCategory> {
  TextEditingController txtSearch = TextEditingController();

    List categoryMealArr = [
    {
      "name": "Breakfast",
      "image": "assets/images/meal/breakfast.png",
      "foodNumber": "120",
    },
    {
      "name": "Lunch",
      "image": "assets/images/meal/lunch.png",
      "foodNumber": "120",
    },
    {
      "name": "Dinner",
      "image": "assets/images/meal/dinner.png",
      "foodNumber": "120",
    },
    {
      "name": "Snacks",
      "image": "assets/images/meal/snacks.png",
      "foodNumber": "120",
    },
    {
      "name": "Drinks",
      "image": "assets/images/meal/drinks.png",
      "foodNumber": "120",
    },
  ];

    List popularMealArr = [
    {
      "name": "Blueberry Pancake",
      "image": "assets/icons/pancake.png",
      "kcal": "190",
      "fats": "199",
      "proteins": "305",
      "sugar": "150",
      "categories": "Breakfast",
    },
    {
      "name": "Salad",
      "image": "assets/icons/salad.png",
      "kcal": "200",
      "fats": "100",
      "proteins": "300",
      "sugar": "50",
      "categories": "Lunch",
    },
    {
      "name": "Salmon Nigiri",
      "image": "assets/icons/nigiri.png",
      "kcal": "300",
      "fats": "250",
      "proteins": "310",
      "sugar": "100",
      "categories": "Dinner",
    },
  ];
  
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
        title: Text(
          widget.mObj["name"].toString(),
          style: Styles.headline20,
        ),
        actions: [
          Container(
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
        ],
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(3),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.symmetric(horizontal:15),
                decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2))
                ]),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: txtSearch,
                        decoration: const InputDecoration(
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          prefixIcon: Icon(
                            FluentSystemIcons.ic_fluent_search_filled,
                            size: 25,
                          ),
                        hintText: "Search"),
                      )),
                  ],
                ),
              ),

              const Gap(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Category",
                      style: Styles.title
                    ),
                  ],
                ),
              ),
              const Gap(5),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryMealArr.length,
                  itemBuilder: (context, index) {
                    var cObj = categoryMealArr[index] as Map? ?? {};
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MealCategory(mObj: cObj)),
                        );
                      },child: SmallCategoryCell(cObj: cObj, index: index));
                  }),
              ),

              const Gap(15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Text(
                    "Recommendation for Diet",
                    style: Styles.title
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //   builder: (context) => const WorkoutSchedule()));
                    },
                    child: Text(
                      "See More",
                      style: Styles.seeMore
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 11),
                  scrollDirection: Axis.horizontal,
                  itemCount: popularMealArr.length,
                  itemBuilder: (context, index) {
                  var mObj = popularMealArr[index] as Map? ?? {};
                  return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MealDetails(dObj: mObj)),
                        );
                      },
                      child: MealRecom(mObj: mObj, index: index,));
                }),
              ),

              const Gap(15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Text(
                    "Popular",
                    style: Styles.title
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //   builder: (context) => const WorkoutSchedule()));
                    },
                    child: Text(
                      "See More",
                      style: Styles.seeMore
                      ),
                    )
                  ],
                ),
              ),
              ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 2, //recommendWorkoutArr.length
                itemBuilder: (context, index) {
                  var mObj = popularMealArr[index] as Map? ?? {};
                  return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MealDetails(dObj: mObj)),
                        );
                      },
                      child: MealRow(mObj: mObj,
                      showToggleSwitch: false,
                      icon: FluentSystemIcons.ic_fluent_chevron_right_filled));
                }),


            ], //main Children
          ),
        ],
      ),
    );
  }
}


