import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/main_button.dart';
import 'package:ifit/common/widgets/icon_text_icon.dart';
import 'package:ifit/common/widgets/toggle_switch.dart';
import 'package:ifit/screens/main_screens/home_screens/activity_tracker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool positive = false;
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
        title: Text('Profile',
        style: Styles.headlineSmall,),
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
                              'assets/icons/profile_pic.png',
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
                            "Stefani Wong",
                            style: Styles.textStyle.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Gap(5),
                          Text(
                            "Lose a Fat Program",
                            style: Styles.text2.copyWith(
                              color: Colors.black,
                            ),
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
                          
                        },
                        textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )),             
                    ],
                    ),
                    const Gap(10),
                    const Row(
                      children: [
                        Expanded(
                            child: ProfileCell(value: '188cm', title: 'Height')
                            ),
                        Gap(10),
                        Expanded(
                            child: ProfileCell(value: '56kg', title: 'Weight')
                            ),
                        Gap(10),
                        Expanded(
                            child: ProfileCell(value: '22yo', title: 'Height')
                            ),
                      ],
                    ),

                    const Gap(25),
                    Container(
                      height: 200,
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
                            style: Styles.textStyle.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          const Gap(1),
                          NextNavigation(
                            iconData: FluentSystemIcons.ic_fluent_person_accounts_regular,
                            title: 'Personal Data',
                            onTap: () {},
                          ),
                          NextNavigation(
                            iconData: FluentSystemIcons.ic_fluent_archive_regular,
                            title: 'Achievement',
                            onTap: () {},
                          ),
                          NextNavigation(
                            iconData: FluentSystemIcons.ic_fluent_history_regular,
                            title: 'Activity History',
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const ActivityTrackerScreen()));
                            },
                          ),
                          NextNavigation(
                            iconData: FluentSystemIcons.ic_fluent_activity_regular,
                            title: 'Workout Progress',
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),

                    const Gap(20),
                    Container(
                      height: 115,
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
                            style: Styles.textStyle.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
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
                                style: Styles.textStyle.copyWith(
                                  color: Colors.black,
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
                      height: 170,
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
                            style: Styles.textStyle.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          const Gap(1),
                          NextNavigation(
                            iconData: FluentSystemIcons.ic_fluent_mail_regular,
                            title: 'Contact Us',
                            onTap: () {},
                          ),
                          NextNavigation(
                            iconData: FluentSystemIcons.ic_fluent_shield_regular,
                            title: 'Privacy Policy',
                            onTap: () {},
                          ),
                          NextNavigation(
                            iconData: FluentSystemIcons.ic_fluent_settings_regular,
                            title: 'Settings',
                            onTap: () {},
                          ),
                          
                        ],
                      ),
                    ),
                
                ],
                )


              ],//main Children
            ),
          ),
        ],

      ),
    );
  }
}

class ProfileCell extends StatefulWidget {
  final String value;
  final String title;

  const ProfileCell({super.key, required this.value, required this.title});

  @override
  State<ProfileCell> createState() => _ProfileCellState();
}

class _ProfileCellState extends State<ProfileCell> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 2)]
      ),
      child: Row(
        children: [
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (bounds) {
                  return LinearGradient(
                          colors: Styles.gradientColor,
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight)
                      .createShader(
                          Rect.fromLTRB(0, 0, bounds.width, bounds.height));
                },
                child: Text(
                  widget.value,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
              ),
              Text(
                widget.title,
                style: Styles.text2.copyWith(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ],
          ),),
        ],
      ),
    );
  }
}