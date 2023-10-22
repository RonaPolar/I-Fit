import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/main_button.dart';
import 'package:ifit/screens/main_screens/main_bottom_bar.dart';
import 'package:ifit/screens/main_screens/progress_tracker_screens/body/progress_comparison.dart';

class ProgressTrackerScreen extends StatefulWidget {
  const ProgressTrackerScreen({super.key});

  @override
  State<ProgressTrackerScreen> createState() => _ProgressTrackerScreenState();
}

class _ProgressTrackerScreenState extends State<ProgressTrackerScreen> {
  List progressPhotoArr = [
    {
      "date": "2 September",
      "photo": [
        "assets/images/pp_1.png",
        "assets/images/pp_2.png",
        "assets/images/pp_3.png",
        "assets/images/pp_4.png",
      ]
    },
    {
      "date": "5 October",
      "photo": [
        "assets/images/pp_5.png",
        "assets/images/pp_6.png",
        "assets/images/pp_7.png",
        "assets/images/pp_8.png",
      ]
    }
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
            Navigator.of(context).push(
            MaterialPageRoute(
            builder: (context) => const HomeNavBar()));
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
          'Progress Tracker',
          style: Styles.headline20,
        ),
      ),
      body: ListView(
        children: [
          Container(
          padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Styles.secondColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)),
                        width: 50,
                        height: 50,
                        alignment: Alignment.center,
                        child: const Icon(
                          FluentSystemIcons.ic_fluent_timer_filled,
                          size: 30,
                        ),
                      ),
                      const Gap(10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "Reminder!",
                                style: Styles.text12.copyWith(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                            const Gap(5),
                            Text(
                              "Next Photos Fall On November 08",
                              style: Styles.seeMore.copyWith(
                                  color: Colors.black),
                            ),
                          ],
                        )),
                    ],
                  ),
                ),

                const Gap(15),
                Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.all(20),
                    height: 140,
                    decoration: BoxDecoration(
                        color: Styles.secondColor.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Track Your Progress Each\nMonth With Photo',
                                style: Styles.text15bold.copyWith(
                                  color: Colors.white
                                )
                              ),
                              const Spacer(),
                              SizedBox(
                                width: 115,
                                height: 35,
                                  child: MainButton(
                                    title: "Learn More",
                                  onPressed: () {
                                    // Navigator.of(context).push(
                                    //   MaterialPageRoute(
                                    //   builder: (context) => const WorkoutSchedule()));
                                  },
                                  textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    ),
                                  )),                    
                            ]),
                      Image.asset(
                          "assets/images/progress-photo.png")
                      ],
                    ),
                  ),  

                const Gap(15),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Styles.secondColor.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Compare my Photo',
                        style: Styles.text15bold.copyWith(
                          color: Colors.white
                        )
                      ),
                      SizedBox(
                        width: 90,
                        height: 30,
                          child: MainButton(
                            title: "Compare",
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                              builder: (context) => const ProgressComparison()));
                          },
                          textStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )),                    
                        ],
                      ),
                  ),

                const Gap(15),
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Gallery",
                    style: Styles.title
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //         builder: (context) =>
                      //             const WorkoutTrackerScreen()
                      //       ),
                      //     );
                    },
                    child: Text(
                      "See More",
                      style: Styles.seeMore
                      ),
                    )
                  ],
                ),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: progressPhotoArr.length,
                    itemBuilder: ((context, index) {
                      var pObj = progressPhotoArr[index] as Map? ?? {};
                      var imaArr = pObj["photo"] as List? ?? [];

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Gap(10),
                          Text(
                            pObj["date"].toString(),
                            style: Styles.normal.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Styles.fadeTextColor),
                          ),
                          const Gap(5),
                          SizedBox(
                            height: 110,
                            width: double.maxFinite,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              padding: EdgeInsets.zero,
                              itemCount: imaArr.length,
                              itemBuilder: ((context, indexRow) {
                                return Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      imaArr[indexRow] as String? ?? "",
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ],
                      );
                    }))
              ], //main Children
            ),
          ),
        ],
      ),
      floatingActionButton: InkWell(
        // onTap: () {
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) =>
        //             WorkoutAddSchedule(date: _selectedDateAppBBar)));
        // },
        child: Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
              color: Styles.primaryColor,
              // gradient: LinearGradient(colors: Styles.gradientColor),
              borderRadius: BorderRadius.circular(27.5),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12, blurRadius: 5, offset: Offset(0, 2))
              ]),
          alignment: Alignment.center,
          child: const Icon(
            FluentSystemIcons.ic_fluent_camera_regular,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
