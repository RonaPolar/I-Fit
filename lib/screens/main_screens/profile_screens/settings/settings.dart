import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/icon_text_icon.dart';
import 'package:ifit/screens/main_screens/main_bottom_bar.dart';
import 'package:ifit/screens/main_screens/profile_screens/settings/change_email.dart';
import 'package:ifit/screens/main_screens/profile_screens/settings/change_pass.dart';
import 'package:ifit/screens/main_screens/profile_screens/settings/delete_account.dart';
import 'package:ifit/screens/main_screens/profile_screens/settings/edit_profile.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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
        title: Text('Settings',
        style: Styles.headline20,),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    const Gap(15),
                    Container(
                      height: 240,
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
                            iconData: FluentSystemIcons.ic_fluent_person_accounts_regular,
                            title: 'Edit Profile Details',
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const EditProfile()));
                            },
                          ),
                          NextNavigation(
                            iconData: FluentSystemIcons.ic_fluent_lock_regular,
                            title: 'Change Email',
                            onTap: () {
                              Navigator.of(context).push( MaterialPageRoute(
                                builder: (context) => const ChangeEmail()));
                            },
                          ),
                          NextNavigation(
                            iconData: FluentSystemIcons.ic_fluent_lock_regular,
                            title: 'Change Password',
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const ChangePass()));
                            },
                          ),
                          NextNavigation(
                            iconData: FluentSystemIcons.ic_fluent_lock_regular,
                            title: 'Delete Account',
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const DeleteAccount()));
                            },
                          ),
                        ],
                      ),
                    ),
                    
                  ],
                ),
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}