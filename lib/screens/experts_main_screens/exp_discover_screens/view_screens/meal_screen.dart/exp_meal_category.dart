import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/program_category.dart';
import 'package:ifit/common/widgets/program_widgets.dart';
import 'package:ifit/common/widgets/search.dart';
import 'package:ifit/screens/experts_main_screens/exp_discover_screens/my_programs/exp_my_programs.dart';
import 'package:ifit/screens/experts_main_screens/exp_discover_screens/view_screens/meal_screen.dart/view_meal.dart';

class ExpMealCategory extends StatefulWidget {
  final Map mObj;
  const ExpMealCategory({super.key, required this.mObj});

  @override
  State<ExpMealCategory> createState() => _ExpMealCategoryState();
}

class _ExpMealCategoryState extends State<ExpMealCategory> {
  TextEditingController txtSearch = TextEditingController();

    List categoryMealArr = [
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

  List popularMealArr = [
    {
      "name": "Blueberry Pancake",
      "image": "assets/images/meal/pancake.png",
      "rate": "4.9",
      "kcal": "190",
      "fats": "199",
      "proteins": "305",
      "sugar": "150",
      "categories": "Breakfast",
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
          InkWell(
            onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(
                builder: (context) => const ExpCreatedProgram()));
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal:15, vertical: 10),
              height: 35,
              width: 35,
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
                child: SearchContainer(controller: txtSearch, hintText: "Search")
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
                            builder: (context) => ExpMealCategory(mObj: cObj)),
                        );
                      },child: SmallCategoryCell(cObj: cObj, index: index));
                  }),
              ),

              const Gap(15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "Popular",
                  style: Styles.title
                    ),
                ),
              SizedBox(
                height: 210,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: popularMealArr.length, //recommendWorkoutArr.length
                  itemBuilder: (context, index) {
                    var mObj = popularMealArr[index] as Map? ?? {};
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
                          bottomText: "${mObj["categories"]} | ${mObj["kcal"]} Calories",
                          showToggleSwitch: false,
                        ));
                  }),
              ),

              
              const Gap(15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "Discover",
                  style: Styles.title
                    ),
                ),
              GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 11),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Adjust the number of columns as per your design
                    ),
                itemCount: popularMealArr.length,
                itemBuilder: (context, index) {
                var mObj = popularMealArr[index] as Map? ?? {};
                return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ViewMealDetails(dObj: mObj)),
                      );
                    },
                    child: BigContainer(image: mObj["image"], 
                      title: mObj["name"], 
                      bottomText: "${mObj["categories"]} | ${mObj["kcal"]} kcal",));
              }),
  


            ], //main Children
          ),
        ],
      ),
    );
  }
}


