import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/check_boxes.dart';
import 'package:ifit/common/widgets/main_button.dart';
import 'package:ifit/screens/account-login&reg/register/registration_success.dart';

class RegisterPart3 extends StatefulWidget {
  const RegisterPart3({super.key});

  @override
  State<RegisterPart3> createState() => _RegisterPart3State();
}

class _RegisterPart3State extends State<RegisterPart3> {
String? selectedValue;
  List<bool> isCheckedList = [false, false, false];

@override
Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: Center(
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
                          Text(
                            'What\'s your goal?',
                            style: Styles.headline,
                          ),
                          Text(
                            'It will help us to choose a best program for you',
                            style: Styles.text2,
                          ),
                          const Gap(30),
                          const CheckBoxList(questionText: 'What fitness goals do you want to achieve?',
                            choices: ['Lose Weight', 'Body Toning', 'Gain muscles'],  
                          ),
                          const Gap(15),
                          const CheckBoxList(questionText: 'What specific body part do you want for it?',
                            choices: ['Upper Body', 'Abdominal', 'Lower Body', 'Full Body'], 
                          ),
                          const Gap(15),
                          const CheckBoxList(questionText: 'How do you want to attain these goals?',
                            choices: ['Body Exercises', 'Lifting Weights', 'Food Restrictions'], 
                          ),
                          const Gap(15),
                          const CheckBoxList(questionText: 'How many minutes/hours do you exercise?',
                            choices: ['Less than 30 minutes', 'An hour', 'More than an hour'], 
                          ),
                          const Gap(15),
                          const CheckBoxList(questionText: 'How many times in a week do you exercise?',
                            choices: ['None', 'Once a week', 'Twice a week', '3-4 times a week', 'More than'], 
                          ),
                          const Gap(15),
                          const CheckBoxList(questionText: 'Do you have a body or health complications that need to be considered upon the process?',
                            choices: ['None', 'Injuries', 'Breathing Complications(ex: Asthma)', 'Cardiovascular Diseases'], 
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
                      title: 'Confirm',
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SuccessRegistration(),
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
