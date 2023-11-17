import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/main_button.dart';
import 'package:ifit/screens/account-login&reg/register/client_registration/client_reg_success.dart';

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
                            style: Styles.headline25,
                          ),
                          Text(
                            'It will help us to choose a best program for you',
                            style: Styles.text15normal,
                          ),
                          const Gap(30),
                          const CheckBoxList(questionText: 'In fitness, do you consider yourself as?',
                            choices: ['Beginner', 'Intermediate', 'Expert'],  
                          ),
                          const Gap(15),
                          const CheckBoxList(questionText: 'What fitness goals do you want to achieve?',
                            choices: ['Loss Weight', 'Body Toning', 'Gain Muscles'],  
                          ),
                          const Gap(15),
                          const CheckBoxList(questionText: 'What specific body part do you want for it?',
                            choices: ['Upper body', 'Abdominal', 'Lower body', 'Full body'], 
                          ),
                          const Gap(15),
                          const CheckBoxList(questionText: 'How do you want to attain these goals?',
                            choices: ['Body exercises', 'Lifting weights', 'Food restrictions'], 
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
                            choices: ['None', 'Injuries', 'Breathing complications(ex: Asthma)', 'Cardiovascular diseases'], 
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
                            builder: (context) => const ClientSuccessRegistration(),
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


class CheckBoxList extends StatefulWidget {
  final List<String> choices;
  final String questionText;

  const CheckBoxList({
    Key? key,
    required this.choices,
    required this.questionText,

  }) : super(key: key);

  @override
  State<CheckBoxList> createState() => _CheckBoxListState();
}

class _CheckBoxListState extends State<CheckBoxList> {

  List<bool> isCheckedList = [];

  @override
  void initState() {
    super.initState();
    isCheckedList = List<bool>.generate(widget.choices.length, (index) => false);
  }

  @override
  void didUpdateWidget(CheckBoxList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.choices.length != oldWidget.choices.length) {
      // The number of choices has changed, regenerate isCheckedList
      isCheckedList = List<bool>.generate(widget.choices.length, (index) => false);
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.questionText, 
          style:  Styles.text15bold
          ),
        for (int index = 0; index < widget.choices.length; index++)
          CheckboxListTile(
            activeColor: Styles.primaryColor, // Use your desired checkbox color 
            title: Text(
              widget.choices[index],
              style: Styles.text15normal,
            ),
             dense: true, 
            value: isCheckedList[index],
            onChanged: (bool? value) {
              setState(() {
                isCheckedList[index] = value!;
              });
            },
          ),
      ],
    );
  }
}