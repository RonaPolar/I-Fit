import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/more_icon.dart';
import 'package:ifit/screens/clients_main_screens/home_screens/activity_tracker.dart';

class ExpertActivtyHistory extends StatefulWidget {


  const ExpertActivtyHistory({super.key});

  @override
  State<ExpertActivtyHistory> createState() => _ExpertActivtyHistoryState();
}

class _ExpertActivtyHistoryState extends State<ExpertActivtyHistory> {
List actHistoryArr = [
    {
      "image": "assets/images/meal/nigiri.png",
      "title": "Eat lunch",
      "time": "About 1 minutes ago"
    },
    {
      "image": "assets/icons/Lower-Weights.png",
      "title": "You have finished the Lowerbody Weights",
      "time": "About 3 hours ago"
    },
    {
      "image": "assets/images/meal/salad.png",
      "title": "Eat dinner",
      "time": "About 3 hours ago"
    },
    {
      "image": "assets/icons/workout-pic.png",
      "title": "You have completed the 15 days Full Bo...",
      "time": "29 May"
    },
    {
      "image": "assets/images/meal/pancake.png",
      "title": "You added Pancake to your desserts",
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
        actions: const [
          MoreIcon(
            options: ['Today', 'This Week', 'This Month'],
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        itemBuilder: ((context, index) {
          var actObj = actHistoryArr[index];
          return ActivityHistoryRow(actObj: actObj);
        }), separatorBuilder: (context, index){
        return Divider(color: Colors.grey.withOpacity(0.5), height: 1);
        }, 
        itemCount: actHistoryArr.length
      ),

    );
  }
}
