import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/more_icon.dart';
import 'package:ifit/screens/main_screens/program_tracker_screens/program_schedule/add_schedule.dart';
import 'package:ifit/screens/main_screens/program_tracker_screens/meal_screens/meal_details.dart';

class MealSchedule extends StatefulWidget {
  const MealSchedule({super.key});

  @override
  State<MealSchedule> createState() => _MealScheduleState();
}

class _MealScheduleState extends State<MealSchedule> {
  final CalendarAgendaController _calendarAgendaControllerAppBar =
      CalendarAgendaController();

  late DateTime _selectedDateAppBBar;

  List<Map<String, dynamic>> mealSched = [
    {
      'category': 'Breakfast',
      'items': [
        {
          'name': 'Honey Pancake',
          'image': 'assets/images/meal/pancake.png',
          'time': '07:00am',
          "kcal": "200",
          "fats": "100",
          "proteins": "300",
          "sugar": "50",
        },
        {
          "name": "Oatmeal",
          "image": "assets/images/meal/oatmeal.png",
          "time": "07:30am",
          "kcal": "200",
          "fats": "60",
          "proteins": "150",
          "sugar": "90",
        },
        {
          'name': 'Coffee',
          'image': 'assets/images/meal/coffee.png',
          'time': '07:30am',
          "kcal": "0",
          "fats": "0",
          "proteins": "10",
          "sugar": "0",
        },
      ],
    },
    {
      'category': 'Lunch',
      'items': [
        {
          'name': 'Chicken Steak',
          'image': 'assets/images/meal/chicken.png',
          'time': '01:00pm',
          "kcal": "200",
          "fats": "100",
          "proteins": "300",
          "sugar": "80",
        },
        {
          'name': 'Milk',
          'image': 'assets/images/meal/milk.png',
          'time': '01:20pm',
          "kcal": "200",
          "fats": "100",
          "proteins": "300",
          "sugar": "80",
        },
      ],
    },
    {
      'category': 'Snacks',
      'items': [
        {
          "name": "Orange",
          "image": "assets/images/meal/orange.png",
          "time": "04:30pm",
          "kcal": "40",
          "fats": "0",
          "proteins": "100",
          "sugar": "50",
        },
        {
          "name": "Apple Pie",
          "image": "assets/images/meal/apple_pie.png",
          "time": "04:40pm",
          "kcal": "200",
          "fats": "100",
          "proteins": "290",
          "sugar": "120",
        },
      ],
    },
    {
      'category': 'Dinner',
      'items': [
        {
          "name": "Salad",
          "image": "assets/images/meal/salad.png",
          "time": "07:10pm",
          "kcal": "200",
          "fats": "70",
          "proteins": "290",
          "sugar": "20",
        },
        {
          "name": "Oatmeal",
          "image": "assets/images/meal/oatmeal.png",
          "time": "08:10pm",
          "kcal": "200",
          "fats": "60",
          "proteins": "150",
          "sugar": "90",
        },
      ],
    },
  ];


  @override
  void initState() {
    super.initState();
    _selectedDateAppBBar = DateTime.now();
    // setDayEventWorkoutList();
  }

  @override
  Widget build(BuildContext context) {
    // var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CalendarAgenda(
                controller: _calendarAgendaControllerAppBar,
                appbar: false,
                selectedDayPosition: SelectedDayPosition.center,
                weekDay: WeekDay.long,
                dayNameFontSize: 12,
                dayNumberFontSize: 16,
                dayBGColor: Colors.grey.withOpacity(0.15),
                titleSpaceBetween: 15,
                backgroundColor: Colors.white,
                fullCalendarScroll: FullCalendarScroll.horizontal,
                fullCalendarDay: WeekDay.short, //Monthly Calendar
                selectedDateColor: Colors.white,
                dateColor: Colors.black,
                locale: 'en',
                initialDate: DateTime.now(),
                calendarEventColor: Styles.secondColor,
                firstDate: DateTime.now().subtract(const Duration(days: 140)),
                lastDate: DateTime.now().add(const Duration(days: 60)),
      
                onDateSelected: (date) {
                  _selectedDateAppBBar = date;
                  // setDayEventWorkoutList();
                  // setState(() {});
                },
      
                selectedDayLogo: Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(//Date Box
                        colors: [
                      const Color.fromRGBO(255, 0, 0, 72).withOpacity(0.5),
                      const Color.fromRGBO(255, 0, 0, 72)
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const Gap(10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Breakfast", 
                          style: Styles.title),
                        Text(
                          "${mealSched.firstWhere((mealCategory) => mealCategory['category'] == 'Breakfast', orElse: () => {'items': []})['items'].length} Items | 200 calories",
                          style: Styles.normal)
                      ],
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: (mealSched.firstWhere((mealCategory) => mealCategory['category'] == 'Breakfast', orElse: () => {'items': []})['items'] as List<Map<String, dynamic>>?)?.length ?? 0,
                      itemBuilder: (context, index) {
                        final breakfastItems = mealSched.firstWhere((mealCategory) => mealCategory['category'] == 'Breakfast', orElse: () => {'items': []})['items'] as List<Map<String, dynamic>>;
                        if (index >= 0 && index < breakfastItems.length) {
                          final mObj = breakfastItems[index];
                          return InkWell(
                            onTap: () {
                            Navigator.push(context,
                              MaterialPageRoute(builder: (context) => MealDetails(dObj: mObj)),
                            );
                          },
                            child: SchedMealRow(
                              image: mObj['image'],
                              title: mObj['name'],
                              bottomText: mObj['time'],
                            ),
                          );
                        } else {
                          // Handle out-of-range index or other errors as needed
                          return Container(); // A placeholder or an empty widget
                        }
                      },
                    ),
                    
                    
                    const Gap(15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Lunch", style: Styles.title),
                        Text(
                          "${mealSched.firstWhere((mealCategory) => mealCategory['category'] == 'Lunch', orElse: () => {'items': []})['items'].length} Items | 200 calories",
                          style: Styles.normal)
                      ],
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: (mealSched.firstWhere((mealCategory) => mealCategory['category'] == 'Lunch', orElse: () => {'items': []})['items'] as List<Map<String, dynamic>>?)?.length ?? 0,
                      itemBuilder: (context, index) {
                        final breakfastItems = mealSched.firstWhere((mealCategory) => mealCategory['category'] == 'Lunch', orElse: () => {'items': []})['items'] as List<Map<String, dynamic>>;
                        if (index >= 0 && index < breakfastItems.length) {
                          final mObj = breakfastItems[index];
                          return InkWell(
                            onTap: () {
                            Navigator.push(context,
                              MaterialPageRoute(builder: (context) => MealDetails(dObj: mObj)),
                            );
                          },
                            child: SchedMealRow(
                              image: mObj['image'],
                              title: mObj['name'],
                              bottomText: mObj['time'],
                            ),
                          );
                        } else {
                          // Handle out-of-range index or other errors as needed
                          return Container(); // A placeholder or an empty widget
                        }
                      },
                    ),
      
      
                    const Gap(15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Snacks", style: Styles.title),
                        Text(
                          "${mealSched.firstWhere((mealCategory) => mealCategory['category'] == 'Snacks', orElse: () => {'items': []})['items'].length} Items | 200 calories",
                            style: Styles.normal)
                      ],
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: (mealSched.firstWhere((mealCategory) => mealCategory['category'] == 'Snacks', orElse: () => {'items': []})['items'] as List<Map<String, dynamic>>?)?.length ?? 0,
                      itemBuilder: (context, index) {
                        final breakfastItems = mealSched.firstWhere((mealCategory) => mealCategory['category'] == 'Snacks', orElse: () => {'items': []})['items'] as List<Map<String, dynamic>>;
                        if (index >= 0 && index < breakfastItems.length) {
                          final mObj = breakfastItems[index];
                          return InkWell(
                            onTap: () {
                            Navigator.push(context,
                              MaterialPageRoute(builder: (context) => MealDetails(dObj: mObj)),
                            );
                          },
                            child: SchedMealRow(
                              image: mObj['image'],
                              title: mObj['name'],
                              bottomText: mObj['time'],
                            ),
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
      
      
                    const Gap(15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Dinner", style: Styles.title),
                        Text(
                          "${mealSched.firstWhere((mealCategory) => mealCategory['category'] == 'Dinner', orElse: () => {'items': []})['items'].length} Items | 200 calories",
                            style: Styles.normal)
                      ],
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: (mealSched.firstWhere((mealCategory) => mealCategory['category'] == 'Dinner', orElse: () => {'items': []})['items'] as List<Map<String, dynamic>>?)?.length ?? 0,
                      itemBuilder: (context, index) {
                        final breakfastItems = mealSched.firstWhere((mealCategory) => mealCategory['category'] == 'Dinner', orElse: () => {'items': []})['items'] as List<Map<String, dynamic>>;
                        if (index >= 0 && index < breakfastItems.length) {
                          final mObj = breakfastItems[index];
                          return InkWell(
                            onTap: () {
                            Navigator.push(context,
                              MaterialPageRoute(builder: (context) => MealDetails(dObj: mObj)),
                            );
                          },
                            child: SchedMealRow(
                              image: mObj['image'],
                              title: mObj['name'],
                              bottomText: mObj['time'],
                            ),
                          );
                        } else {
                          // Handle out-of-range index or other errors as needed
                          return Container(); // A placeholder or an empty widget
                        }
                      },
                    ),
                  ],
                ),
              )
            ], //main Children
          ),
        ],
      ),
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      AddSchedule(date: _selectedDateAppBBar)));
        },
        child: Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: Styles.gradientColor),
              borderRadius: BorderRadius.circular(27.5),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12, blurRadius: 5, offset: Offset(0, 2))
              ]),
          alignment: Alignment.center,
          child: const Icon(
            FluentSystemIcons.ic_fluent_add_regular,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class SchedMealRow extends StatefulWidget {
  final String image;
  final String title;
  final String bottomText;
  final IconData icon;

  const SchedMealRow({
    super.key,
    this.icon = FluentSystemIcons.ic_fluent_chevron_right_filled,
    required this.image,
    required this.title,
    required this.bottomText,
  });

  @override
  State<SchedMealRow> createState() => _SchedMealRowState();
}

class _SchedMealRowState extends State<SchedMealRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: 50,
              height: 50,
              color: Styles.secondColor.withOpacity(0.3),
              child: Image.asset(
                widget.image,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.title, style: Styles.text15bold),
                const Gap(3),
                Text(
                  widget.bottomText,
                  style: Styles.normal.copyWith(
                    fontSize: 12,
                  ),
                ),
                
              ],
            ),
          ),
          MoreIcon(options: const ['Edit', 'Remove', 'Cancel Today'],
            onTap: (String selectedOption) {
                if (selectedOption == 'Edit') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddSchedule(date: DateTime.now()),
                    ),
                  );
                } else if (selectedOption == 'Remove') {
                  // Execute the action for Option 2
                } else if (selectedOption == 'Cancel Today') {
                  // Execute the action for Option 3
                }
              },
            iconData: FluentSystemIcons.ic_fluent_more_vertical_filled,)
          
        ],
      ),
    );
  }
}
