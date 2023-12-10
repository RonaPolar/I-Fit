import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/confirmation_dialog.dart';
import 'package:ifit/common/widgets/main_button.dart';
import 'package:ifit/common/widgets/icon_text_icon.dart';
import 'package:ifit/common/widgets/toggle_switch.dart';
import 'package:ifit/screens/account-login&reg/login.dart';
import 'package:ifit/screens/clients_main_screens/profile_screens/about.dart';
import 'package:ifit/screens/clients_main_screens/profile_screens/contact_us.dart';
import 'package:ifit/screens/clients_main_screens/profile_screens/privacy_policy.dart';
import 'package:ifit/screens/clients_main_screens/profile_screens/profile.dart';
import 'package:ifit/screens/experts_main_screens/exp_bottom_bar.dart';
import 'package:ifit/screens/experts_main_screens/exp_profile_screens/activity_history.dart';
import 'package:ifit/screens/experts_main_screens/exp_profile_screens/settings/inbox/inbox.dart';
import 'package:ifit/screens/experts_main_screens/exp_profile_screens/settings/edit_profile.dart';
import 'package:ifit/screens/experts_main_screens/exp_profile_screens/settings/settings.dart';



class ExpProfileScreen extends StatefulWidget {
  const ExpProfileScreen({super.key});

  @override
  State<ExpProfileScreen> createState() => _ExpProfileScreenState();
}

class _ExpProfileScreenState extends State<ExpProfileScreen> {
  List experts = [
    {
      "name": "Dr. Otto Octavius",
      "image": "assets/images/experts/expert1.png",
      "profession": "Physician",
      "rate": "4.5",
      "mealCreated": "2",
      "workoutCreated": "3",
      "descriptions": "Hello! I completed my course in 2017 and have 5 years of experience working as Physician. If you like my programs I created, you can visit me at Manila Center at Makati City.",
    },
  ];

  
  bool positive = false;
  @override
  Widget build(BuildContext context) {
    // DateTime currentDate = DateTime.now();
    // DateTime lastMonthDate = DateTime(currentDate.year, currentDate.month - 1, currentDate.day);

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
              builder: (context) => const ExpHome()));
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
        title: Text('Profile',
        style: Styles.headline20,),
        actions: [
          InkWell(
            onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(
                builder: (context) => const ExpInbox()));
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal:15, vertical: 10),
              height: 35,
              width: 35,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10)),
              child: const Icon(FluentSystemIcons.ic_fluent_chat_regular,
                size: 20,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: Styles.primaryColor, // Replace with your desired border color
                            width: 2.0, // Replace with your desired border width
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Image.asset(
                              "${experts[0]["image"]}",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      const Gap(10),
                      Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${experts[0]["name"]}",
                            style: Styles.title
                          ),
                          const Gap(5),
                          Text(
                            "${experts[0]["profession"]}",
                            style: Styles.text15normal
                          )
                        ],
                      ),
                    ),
                      SizedBox(
                      width: 80,
                      height: 30,
                        child: MainButton(
                          title: "Edit",
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const EditProfile()));
                        },
                        textStyle: Styles.seeMore.copyWith(
                          color: Colors.white,
                        ),
                      )),             
                    ],
                    ),
                    const Gap(10),
                    Row(
                      children: [
                        Expanded(
                            child: ProfileCell(value: "${experts[0]["rate"]}", title: 'Star Rate')
                            ),
                        const Gap(10),
                        Expanded(
                            child: ProfileCell(value: "${experts[0]["mealCreated"]}", title: 'Meals')
                            ),
                        const Gap(10),
                        Expanded(
                            child: ProfileCell(value: "${experts[0]["workoutCreated"]}", title: 'Workouts')
                            ),
                      ],
                    ),

                    const Gap(15),
                    Container(
                      height: 140,
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(color: Colors.black26, blurRadius: 2)
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Account",
                            style: Styles.title
                          ),
                          const Gap(1),
                          NextNavigation(
                            iconData: FluentSystemIcons.ic_fluent_history_regular,
                            title: 'Activity History',
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const ExpertActivtyHistory()));
                            },
                          ),
                          NextNavigation(
                            iconData: FluentSystemIcons.ic_fluent_activity_regular,
                            title: 'Program Progress',
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const ExpPrograms()));
                            },
                          ),
                        ],
                      ),
                    ),

                    const Gap(20),
                    Container(
                      height: 110,
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(color: Colors.black26, blurRadius: 2)
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Notifications",
                            style: Styles.title
                          ),
                          const Gap(1),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(FluentSystemIcons.ic_fluent_alert_regular,),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Text(
                                "Pop-up Notification",
                                style: Styles.text12.copyWith(
                                  fontSize: 16
                                ),
                              ),
                            ),
                            const ToggleSwitch()
                          ]),
                          
                        ],
                      ),
                    ),

                    const Gap(20),
                    Container(
                      height: 250,
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(color: Colors.black26, blurRadius: 2)
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Other",
                            style: Styles.title
                          ),
                          const Gap(1),
                          NextNavigation(
                            iconData: FluentSystemIcons.ic_fluent_info_regular,
                            title: 'About',
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const About()));
                            },
                          ),
                          NextNavigation(
                            iconData: FluentSystemIcons.ic_fluent_mail_regular,
                            title: 'Contact Us',
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const ContactUs()));
                            },
                          ),
                          NextNavigation(
                            iconData: FluentSystemIcons.ic_fluent_shield_regular,
                            title: 'Privacy Policy',
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const PrivacyPolicyScreen()));
                            },
                          ),
                          NextNavigation(
                            iconData: FluentSystemIcons.ic_fluent_settings_regular,
                            title: 'Settings',
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const Settings()));
                            },
                          ),
                          NextNavigation(
                            iconData: Icons.logout_outlined,
                            title: 'Log Out',
                            onTap: () {
                              showDialog(context: context,
                                builder: (BuildContext context) {
                                  return ConfirmationDialog(
                                    onYesPressed: () {
                                      Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const LogIn()));
                                    },
                                  );});
                            },
                          ),
                        ],
                      ),
                    ),                
                ],
                ),

              ],//main Children
            ),
          ),
        ],

      ),
    );
  }
}
