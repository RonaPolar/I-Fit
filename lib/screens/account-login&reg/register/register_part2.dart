import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/drop_down_container.dart';
import 'package:ifit/common/widgets/main_button.dart';
import 'package:ifit/common/widgets/text_field_container.dart';
import 'package:ifit/screens/account-login&reg/register/register_part3.dart';

class RegisterPart2 extends StatefulWidget {
  const RegisterPart2({super.key});

  @override
  State<RegisterPart2> createState() => _RegisterPart2State();
}

class _RegisterPart2State extends State<RegisterPart2> {
  @override

Widget build(BuildContext context) {
String? selectedValue;
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
                          const EdgeInsets.only(right: 20, left: 20, top: 10),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/complete-profile.png",
                            fit: BoxFit.fitHeight,),
                          const Gap(15),
                          Text(
                            'Let\'s complete your profile',
                            style: Styles.headline,
                          ),
                          Text(
                            'It will help us to know more about you',
                            style: Styles.text2,
                          ),
                          const Gap(30),
                          DropDownContainer(hintText: 'Gender', 
                          icon: FluentSystemIcons.ic_fluent_people_regular,
                          items: const [
                            DropdownMenuItem<String>(
                              value: "Male",
                              child: Text("Male"),),
                            DropdownMenuItem<String>(
                              value: "Female",
                              child: Text("Female"),)
                          ],  
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value;
                            });
                          },
                          selectedValue: selectedValue,
                          ),
                            const Gap(15),
                            const TextfieldContainer(
                            hitText: 'Date of Birth', 
                            icon: FluentSystemIcons.ic_fluent_calendar_regular, 
                            obscureText: false
                            ),
                            const Gap(15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Expanded(
                                  child: TextfieldContainer(
                                  hitText: 'Your Weight', 
                                  icon: FluentSystemIcons.ic_fluent_data_funnel_regular, 
                                  obscureText: false
                                  ),
                                ),
                                const Gap(5),
                                Container(
                                  width: 50,
                                  height: 50,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Styles.primaryColor,
                                    borderRadius: BorderRadius.circular(15)
                                  ),
                                  child: const Text(
                                    'KG',
                                    style: TextStyle(
                                      color: Colors.white,
                                    )
                                  ),)
                              ],
                            ),
                            const Gap(15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Expanded(
                                  child: TextfieldContainer(
                                  hitText: 'Your Height', 
                                  icon: FluentSystemIcons.ic_fluent_arrow_sort_regular, 
                                  obscureText: false
                                  ),
                                ),
                                const Gap(5),
                                Container(
                                  width: 50,
                                  height: 50,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Styles.primaryColor,
                                    borderRadius: BorderRadius.circular(15)
                                  ),
                                  child: const Text(
                                    'CM',
                                    style: TextStyle(
                                      color: Colors.white,
                                    )
                                  ),)
                              ],
                            ),
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
                      title: 'Next',
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterPart3(),
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
