import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/screens/experts_main_screens/exp_profile_screens/settings/inbox/message.dart';

class ExpInbox extends StatefulWidget {
  const ExpInbox({super.key});

  @override
  State<ExpInbox> createState() => _ExpInboxState();
}

class _ExpInboxState extends State<ExpInbox> {
List inbox = [
    {
      "name": "Juan Dela Cruz",
      "email": "juandelacruz@gmail.com",
      "date": "29 June 2023",
      "message": "Hi Doc! What days can I go to consult on you?",
    },
    {
      "name": "Sheryl Haven",
      "email": "sherylhaven@gmail.com",      
      "date": "14 June 2023",
      "time": "6:30pm",
      "message": "I like the program you made Doc, I would like to know how much the consultation at your center?",
    },
    {
      "name": "Juana Dela Cruz",
      "email": "juanadelacruz@gmail.com",      
      "date": "30 May 2023",
      "message": "Hello! I like the workout program you made Doc, I would like to consult on you. Please message me the available schedule I can go to your center",
    },
    {
      "name": "Cristopher Pratt",
      "email": "cristopherpratt@gmail.com",      
      "date": "12 May 2023",
      "message": "Hello Doc! I like the program you made! I would like to know how much to get consultation from you?",
    },
    {
      "name": "Allen Rosales",
      "email": "allenrosales@gmail.com",      
      "date": "29 April 2023",
      "message": "Good Day Doc! I would like to consult on you. Please message me the schedule I can go to you",
    },
    {
      "name": "Anna Shin",
      "email": "annashin@gmail.com",      
      "date": "8 April 2023",
      "message": "Hello! I like the workout program you made Doc, I would like to consult on you. Please message me the available schedule I can go to your center",
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
        title: Text('Inbox',
        style: Styles.headline20,),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.builder(
                    // WorkoutRowContainer Content
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      var inboxObj = inbox[index] as Map? ?? {};
                      return InboxContainer(inboxObj: inboxObj,);
                    },
                  ),


              ],//main Children
            ),
          ),
        ],

      ),
    );
  }
}



class InboxContainer extends StatelessWidget {
  final Map inboxObj;
  const InboxContainer({super.key, required this.inboxObj});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
          MaterialPageRoute(
            builder: (context) => Message(inboxObj: inboxObj)));
      },
      child: Container(
        height: 80,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        decoration: BoxDecoration(
          color: Styles.bgColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 2)],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  inboxObj["name"].toString(),
                  style: Styles.title
                ),
                Text(
                  inboxObj["date"].toString(),
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            )),
            const Icon(
              FluentSystemIcons.ic_fluent_chevron_right_regular,
            )
          ],
        ),
      ),
    );
  }
}