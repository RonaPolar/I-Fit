import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/more_icon.dart';

class ExpActivityHistory extends StatefulWidget {
  const ExpActivityHistory({super.key});

  @override
  State<ExpActivityHistory> createState() => _ExpActivityHistoryState();
}

class _ExpActivityHistoryState extends State<ExpActivityHistory> {
  int touchedIndex = -1;

  List expactHistoryArr = [
    {
      "image": "assets/images/meal/nigiri.png",
      "title": "You have Created Nigiri lunch",
      "time": "About 1 minutes ago"
    },
    {
      "image": "assets/icons/Lower-Weights.png",
      "title": "You have Edited the Lowerbody Weights",
      "time": "About 3 hours ago"
    },
    {
      "image": "assets/images/meal/salad.png",
      "title": "You have Deleted Salad Dinner",
      "time": "About 3 hours ago"
    },
    {
      "image": "assets/icons/workout-pic.png",
      "title": "You have Created the 15 days Full Bo...",
      "time": "29 May"
    },
    {
      "image": "assets/images/experts/expert3.jpg",
      "title": "You have Followed Dr. Harley Quinn",
      "time": "8 April"
    },
    {
      "image": "assets/icons/Ab-workout.png",
      "title": "You removed Ab Workout to your Favorites",
      "time": "8 April"
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
            'Activity History',
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
                  
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: expactHistoryArr.length,
                    itemBuilder: (context, index) {
                      var expactObj = expactHistoryArr[index] as Map? ?? {};
                      return ExpActivityHistoryRow(expactObj: expactObj);
                    },
                  ),

                ], //Main Children
              ),
            ),
          ],
        ));
  }
}



class ExpActivityHistoryRow extends StatelessWidget {
  final Map expactObj;
  const ExpActivityHistoryRow({super.key, required this.expactObj});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              expactObj["image"].toString(),
              width: 40,
              height: 40,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                expactObj["title"].toString(),
                style: Styles.text12
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                expactObj["time"].toString(),
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          )),
          const MoreIcon(
            options: ['Remove'],
            iconData: FluentSystemIcons.ic_fluent_more_vertical_filled,
          )
        ],
      ),
    );
  }
}

