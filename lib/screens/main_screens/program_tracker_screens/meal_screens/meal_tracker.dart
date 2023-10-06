import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/charts/meal_piechart.dart';
import 'package:ifit/common/widgets/more_icon.dart';
import 'package:ifit/common/widgets/program_row.dart';
import 'package:ifit/screens/main_screens/program_tracker_screens/workout_screens/workout_schedule.dart';

class MealTrackerScreen extends StatefulWidget {

  const MealTrackerScreen({super.key});

  @override
  State<MealTrackerScreen> createState() => _MealTrackerScreenState();
}

class _MealTrackerScreenState extends State<MealTrackerScreen> {

  List what2EatArr = [
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

  List upcomingMealArr = [
    {
      "name": "Blueberry Pancake",
      "image": "assets/icons/pancake.png",
      "schedule": "Monday",
      "time": "9:00am",
    },
    {
      "name": "Salad",
      "image": "assets/icons/salad.png",
      "schedule": "Monday",
      "time": "10:00am",
    },
    {
      "name": "Salmon Nigiri",
      "image": "assets/icons/nigiri.png",
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
                        builder: (context) => const WorkoutSchedule()));
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
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) =>
                            //          WorkoutDetails(dObj: schedObj),
                            //   ),
                            // );
                          },
                          child: MealRow(mObj: mObj));
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
                ListView.builder( //WorkoutRowContainer Content
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: what2EatArr.length,
                      itemBuilder: (context, index) {
                        var what2TrainObj = what2EatArr[index] as Map? ?? {};
                        return What2Container(wObj: what2TrainObj, 
                          onPressed: (obj) {  //wObj
                              // Navigator.push( //there will be major changes
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => WorkoutDetails(dObj: what2TrainObj,)
                              //   ),
                              // );
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



class CustomDropdown extends StatefulWidget {
  final TextStyle? textStyle;
  final List<String> items;
  final String? selectedValue;
  final void Function(String?) onChanged;
  final String? hintText; 

  const CustomDropdown({
    Key? key,
    required this.items,
    required this.onChanged,
    this.selectedValue, // Make selectedValue optional
    this.hintText,
    this.textStyle, // Make hintText optional
  }) : super(key: key);

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          items: widget.items
              .map((name) => DropdownMenuItem(
                    value: name,
                    child: Text(
                      name,
                      style: Styles.text15bold.copyWith(),
                    ),
                  ))
              .toList(),
          onChanged: (newValue) {
            setState(() {
              _currentValue = newValue;
              widget.onChanged(newValue);
            });
          },
          icon: const Icon(Icons.expand_more, color: Colors.black,),
          value: _currentValue,
          hint: widget.hintText != null
              ? Text(
                  widget.hintText!,
                  textAlign: TextAlign.center,
                  style: widget.textStyle ?? Styles.text15bold,
                )
              : null, // Use the provided hintText if not null
        ),
      ),
    );
  }
}
