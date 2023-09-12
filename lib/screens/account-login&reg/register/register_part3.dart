import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/main_button.dart';
import 'package:ifit/common/widgets/text_field_container.dart';
import 'package:ifit/screens/account-login&reg/login.dart';

class RegisterPart3 extends StatefulWidget {
  const RegisterPart3({super.key});

  @override
  State<RegisterPart3> createState() => _RegisterPart3State();
}

class _RegisterPart3State extends State<RegisterPart3> {
  @override

Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.only(right: 20, left: 20, top: 20),
                      child: Column(
                        children: [
                          // Image.asset(
                          //   "assets/images/complete-profile.png",
                          //   width: double.maxFinite,
                          //   fit: BoxFit.fitHeight,),
                          Text(
                            'What\'s your goal?',
                            style: Styles.headline,
                          ),
                          Text(
                            'It will help us to choose a best program for you',
                            style: Styles.text2,
                          ),
                          const Gap(30),
                          const TextfieldContainer(
                            hitText: 'Choose Gender', 
                            icon: FluentSystemIcons.ic_fluent_people_regular, 
                            obscureText: false
                            ),
                            const Gap(15),
                            const TextfieldContainer(
                            hitText: 'Date of Birth', 
                            icon: FluentSystemIcons.ic_fluent_calendar_regular, 
                            obscureText: false
                            ),
                            const Gap(15),
                            const TextfieldContainer(
                            hitText: 'Your Weight', 
                            icon: FluentSystemIcons.ic_fluent_data_funnel_regular, 
                            obscureText: false
                            ),
                            const Gap(15),
                            const TextfieldContainer(
                            hitText: 'Your Weight', 
                            icon: FluentSystemIcons.ic_fluent_arrow_sort_regular, 
                            obscureText: false
                            ),
                            const Gap(30),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                    right: 20, left: 20, bottom: 30, top: 20),
                child: Column(
                  children: [
                    MainButton(
                      title: 'Confirm',
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LogIn(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
