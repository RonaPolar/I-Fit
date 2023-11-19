import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/main_button.dart';
import 'package:ifit/common/widgets/text_field_container.dart';
import 'package:ifit/screens/account-login&reg/register/client_registration/register_part2.dart';
import 'package:ifit/screens/account-login&reg/register/expert_registration/expert_reg_success.dart';


class ExpertRegistration1 extends StatefulWidget {
  const ExpertRegistration1({super.key});

  @override
  State<ExpertRegistration1> createState() => _ExpertRegistration1State();
}

class _ExpertRegistration1State extends State<ExpertRegistration1> {
String? selectedValue;

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
                          const EdgeInsets.only(right: 20, left: 20, top: 10),
                      child: Column(
                        children: [
                          
                          Text(
                            'Let\'s complete your profile',
                            style: Styles.headline25,
                          ),
                          Text(
                            'It will help us to the verification about you',
                            style: Styles.text15normal,
                          ),
                          const Gap(30),
                          RegisterDropDown(hintText: 'Gender', 
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
                          const TextfieldContainer(
                          hitText: 'Number', 
                          icon: FluentSystemIcons.ic_fluent_book_number_regular, 
                          obscureText: false
                          ),
                          const Gap(15),
                          const TextfieldContainer(
                          hitText: 'Profession', 
                          icon: FluentSystemIcons.ic_fluent_person_accounts_regular, 
                          obscureText: false
                          ),
                          const Gap(15),
                          Row(
                            children: [
                              Text(
                                'Profession ID',
                                style: Styles.title,
                              ),
                              const Gap(10),
                              SizedBox(
                                height: 25,
                                width: 100,
                                child: MainButton(title: 'Upload', 
                                  textStyle: Styles.title.copyWith(color: Colors.white),
                                  onPressed: (){}))
                            ],
                          ),
                          const Gap(15),
                          Row(
                            children: [
                              Text(
                                'Proof of Field of Study',
                                style: Styles.title,
                              ),
                              const Gap(10),
                              SizedBox(
                                height: 25,
                                width: 100,
                                child: MainButton(title: 'Upload', 
                                  textStyle: Styles.title.copyWith(color: Colors.white),
                                  onPressed: (){}))
                            ],
                          ),
                          const Gap(10),
                          Align(
                            //make a condition that make if any of it wasnt filled it will display "Enter _____"
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              'You must upload documents needed',
                              style: Styles.text15normal.copyWith(
                                color: Colors.red,
                              ),
                            ),
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
                        Navigator.pushReplacement(context,
                          MaterialPageRoute(
                            builder: (context) => const ExpertSuccessRegistration()),);
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