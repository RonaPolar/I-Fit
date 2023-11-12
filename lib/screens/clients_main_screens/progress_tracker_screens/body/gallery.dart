import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/screens/clients_main_screens/main_bottom_bar.dart';

class Gallery extends StatefulWidget {
  const Gallery({super.key});

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  List progressPhotoArr = [
    {
      "date": "08 September",
      "photo": [
        "assets/images/pp_1.png",
        "assets/images/pp_2.png",
        "assets/images/pp_3.png",
        "assets/images/pp_4.png",
      ]
    },
    {
      "date": "08 October",
      "photo": [
        "assets/images/pp_5.png",
        "assets/images/pp_6.png",
        "assets/images/pp_7.png",
        "assets/images/pp_8.png",
      ]
    },
    {
      "date": "08 November",
      "photo": [
        "assets/images/pp_5.png",
        "assets/images/pp_6.png",
        "assets/images/pp_7.png",
        "assets/images/pp_8.png",
      ]
    },
    {
      "date": "08 December",
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
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const ProgressTrackerNavBar()));
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
        title: Text('Gallery',
        style: Styles.headline20,),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                          const Gap(10),
                        ],
                      );
                    }))
              ],
            ),
          )
        ],
      ),
    );
  }
}