import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/utils/common_utils.dart';
import 'package:ifit/common/widgets/main_button.dart';
import 'package:ifit/common/widgets/more_icon.dart';
import 'package:ifit/screens/clients_main_screens/program_tracker_screens/program_schedule/add_schedule.dart';

class WorkoutSchedule extends StatefulWidget {
  const WorkoutSchedule({super.key});

  @override
  State<WorkoutSchedule> createState() => _WorkoutScheduleState();
}

class _WorkoutScheduleState extends State<WorkoutSchedule> {
  final CalendarAgendaController _calendarAgendaControllerAppBar =
      CalendarAgendaController();

  late DateTime _selectedDateAppBBar;

  List eventArr = [
    {
      "name": "Ab Workout",
      "start_time": "28/09/2023 08:30 AM",
    },
    {
      "name": "Upperbody Workout",
      "start_time": "28/09/2023 09:00 AM",
    },
    {
      "name": "Lowerbody Workout",
      "start_time": "28/09/2023 03:00 PM",
    },
    {
      "name": "Ab Workout",
      "start_time": "29/09/2023 07:30 AM",
    },
    {
      "name": "Upperbody Workout",
      "start_time": "29/09/2023 09:00 AM",
    },
    {
      "name": "Lowerbody Workout",
      "start_time": "30/09/2023 03:00 PM",
    },
    {
      "name": "Ab Workout",
      "start_time": "01/10/2023 08:00 AM",
    },
    {
      "name": "Upperbody Workout",
      "start_time": "02/10/2023 09:00 AM",
    },
    {
      "name": "Lowerbody Workout",
      "start_time": "03/10/2023 03:00 PM",
    }
  ];

  List selectDayEventArr = [];

  @override
  void initState() {
    super.initState();
    _selectedDateAppBBar = DateTime.now();
    setDayEventWorkoutList();
  }

  void setDayEventWorkoutList() {
    var date = dateToStartDate(_selectedDateAppBBar);
    selectDayEventArr = eventArr.map((wObj) {
      return {
        "name": wObj["name"],
        "start_time": wObj["start_time"],
        "date": stringToDate(wObj["start_time"].toString(),
            formatStr: "dd/MM/yyyy hh:mm aa")
      };
    }).where((wObj) {
      return dateToStartDate(wObj["date"] as DateTime) == date;
    }).toList();

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: Column(
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
              setDayEventWorkoutList();
              setState(() {});
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
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: media.width * 1.5,
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (content, index) {
                      // var timelineDataWidth = (media.width * 1.5) - (80 + 40);
                      var availWidth = (media.width * 1.2) - (80 + 40);
                      var slotArr = selectDayEventArr.where((wObj) {
                        return (wObj["date"] as DateTime).hour == index;
                      }).toList();
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 80,
                              child: Text(
                                getTime(index * 60),
                                style: Styles.normal.copyWith(
                                    fontSize: 15),
                              ),
                            ),
                            if (slotArr.isNotEmpty)
                              Expanded(
                                  child: Stack(
                                alignment: Alignment.centerLeft,
                                children: slotArr.map((sObj) {
                                  var min = (sObj["date"] as DateTime).minute;
                                  //(0 to 2)
                                  var pos = (min / 60) * 2 - 1;

                                  return Align(
                                    alignment: Alignment(pos, 0),
                                    child: InkWell(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                backgroundColor:
                                                    Colors.transparent,
                                                contentPadding: EdgeInsets.zero,
                                                content: Container(
                                                  width: media.width * 0.9,
                                                  padding:
                                                      const EdgeInsets.all(20),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          InkWell(
                                                            onTap: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: const Icon(
                                                              Icons.close,
                                                              size: 20,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                          Text(
                                                            'Workout Schedule',
                                                            style: Styles
                                                                .headline20,
                                                          ),
                                                          MoreIcon(
                                                            options: const ['Edit', 'Remove'], iconData: FluentSystemIcons.ic_fluent_more_vertical_filled,
                                                            onTap: (String selectedOption) {
                                                              // Handle the selected option here
                                                              if (selectedOption == 'Edit') {
                                                                Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                    builder: (context) => AddSchedule(date: _selectedDateAppBBar),
                                                                  ),
                                                                );
                                                              } else if (selectedOption == 'Remove') {
                                                                // Execute the action for Option 2
                                                              }
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                      const Gap(20),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                  sObj["name"]
                                                                      .toString(),
                                                                  style: Styles
                                                                      .text18),
                                                              const InkWell(
                                                                // onTap: () {
                                                                //   Navigator.push(
                                                                //     context,
                                                                //     MaterialPageRoute(
                                                                //         builder: (context) => const WorkoutDetails()));
                                                                // },
                                                                child: Icon(Icons
                                                                    .navigate_next),
                                                              ),
                                                            ],
                                                          ),
                                                          const Gap(5),
                                                          Row(
                                                            children: [
                                                              const Icon(Icons
                                                                  .alarm_outlined),
                                                              const Gap(5),
                                                              Text(
                                                                  "${getDayTitle(sObj["start_time"].toString())} | ${getStringDateToOtherFormate(sObj["start_time"].toString(), outFormatStr: "h:mm aa")}",
                                                                  style: Styles.text15normal),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      const Gap(15),
                                                      MainButton(
                                                          title: 'Cancel Workout',
                                                          onPressed: () {
                                                            Navigator.pop(context);
                                                          }),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            });
                                      },
                                      child: Container(
                                        height: 35,
                                        width: availWidth * 0.7,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 8),
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                                colors: Styles.gradientColor),
                                            borderRadius:
                                                BorderRadius.circular(17)),
                                        child: Text(
                                          "${sObj["name"].toString()}, ${getStringDateToOtherFormate(sObj["start_time"].toString(), outFormatStr: "h:mm aa")}",
                                          maxLines: 1,
                                          style: Styles.normal.copyWith(
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ))
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (content, index) {
                      return Divider(
                        color: Colors.grey.withOpacity(0.3),
                        height: 1,
                      );
                    },
                    itemCount: 24),
              ),
            ),
          )
        ], //main Children
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
