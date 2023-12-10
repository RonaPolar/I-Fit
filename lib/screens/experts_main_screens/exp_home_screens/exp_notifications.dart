import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/more_icon.dart';

class ExpNotifications extends StatefulWidget {
  const ExpNotifications({super.key});

  @override
  State<ExpNotifications> createState() => _ExpNotificationsState();
}

class _ExpNotificationsState extends State<ExpNotifications> {
  List notificationArr = [
    {"image": "assets/images/meal/nigiri.png", "title": "You got 3 stars for Dinner Plan", "time": "About 1 minutes ago"},
    {"image": "assets/icons/Lower-Weights.png", "title": "You got 4 stars for Lowerbody Weights", "time": "About 3 hours ago"},
    {"image": "assets/images/meal/salad.png", "title": "Hey, let’s add some meals plan", "time": "About 3 hours ago"},
    {"image": "assets/icons/workout-pic.png", "title": "Congratulations, You have reached 100 clients for Full Bo...", "time": "29 May"},
    {"image": "assets/images/meal/pancake.png", "title": "Hey, your Dessert Plan has 4.3 ratings", "time": "8 April"},
    {"image": "assets/icons/inbox.png", "title": "Ups, You have 2 messages", "time": "8 April"},
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
        title: Text('Notification',
        style: Styles.headline20,),
      actions: const [
           MoreIcon(options: ['Today','This Week','This Month']
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        itemBuilder: ((context, index) {
          var nObj = notificationArr[index] as Map? ?? {};
          return NotificationRow(nObj: nObj);
      }), separatorBuilder: (context, index){
        return Divider(color: Colors.grey.withOpacity(0.5), height: 1, );
      }, itemCount: notificationArr.length),
    );
  }
}

class NotificationRow extends StatelessWidget {
  final Map nObj;
  const NotificationRow({super.key, required this.nObj});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              nObj["image"].toString(),
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
                nObj["title"].toString(),
                style: Styles.text12.copyWith(
                    fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                nObj["time"].toString(),
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          )),
          const MoreIcon(options: ['Remove'], iconData: FluentSystemIcons.ic_fluent_more_vertical_filled,)
        ],
      ),
    );
  }
}