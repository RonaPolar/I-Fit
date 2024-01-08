import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/confirmation_dialog.dart';
import 'package:ifit/common/widgets/main_button.dart';
import 'package:ifit/common/widgets/text_field_container.dart';
import 'package:ifit/screens/experts_main_screens/exp_program_screens/create_program_screens/create_meal.dart';
import 'package:ifit/screens/experts_main_screens/exp_program_screens/create_program_screens/create_work.dart';

class CreateWorkoutNext extends StatefulWidget {
  const CreateWorkoutNext({super.key});

  @override
  State<CreateWorkoutNext> createState() => _CreateWorkoutNextState();
}

class _CreateWorkoutNextState extends State<CreateWorkoutNext> {
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
            showDialog(context: context,
              builder: (BuildContext context) {
                return ConfirmationDialog(
                  question: "Are you Done?",
                  onYesPressed: () {
                    Navigator.pushReplacement(context,
                      MaterialPageRoute(
                        builder: (context) => const CreateWorkout()));
                  },
            );});
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
              Icons.close,
              size: 20,
              color: Colors.black,
            ),
          ),
        ),
        title: Text('Exercise Continuation',
        style: Styles.headline20,),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(15),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 100,
                      child: BigTextField(
                        hintText: "Descriptions",
                      ),
                    ),

                    const Gap(10),
                    Text(
                      'How many repetitions or how long?',
                      style: Styles.title,
                    ),
                    const Gap(5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      const SizedBox(
                        width: 150,
                        child: TextfieldContainer(
                          hitText: 'times',
                          icon: FluentSystemIcons.ic_fluent_data_funnel_regular,
                          obscureText: false),
                      ),
                      Text("or", style: Styles.text15bold),
                      const SizedBox(
                        width: 150,
                        child: TextfieldContainer(
                          hitText: 'seconds',
                          icon: FluentSystemIcons.ic_fluent_data_funnel_regular,
                          obscureText: false),
                        ),
                      ],
                    ),

                    const Gap(10),
                    Row(
                      children: [
                        Text(
                          'Tutorial',
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

                    const Gap(20),
                    Text(
                      "Step by Step Tutorial",
                      style: Styles.title,
                    ),
                    const Gap(5),
                    const SizedBox(
                      height: 100,
                      child: BigTextField(
                        hintText: 'Input the Step 1 to the Preparation',
                      ),
                    ),
                    const AddsubButton(
                      title: 'Steps', 
                      add: SizedBox(
                        height: 100,
                        child: BigTextField(hintText: 'Input the Next Step to the Preparation'))),
                  ],
                )
              ],
            ),
          ),
          Container(
            padding:
                const EdgeInsets.only(right: 20, left: 20, bottom: 30, top: 20),
            child: Column(
              children: [
                MainButton(
                  title: 'Done',
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return ConfirmationDialog(
                          question: "Are you Done?",
                          onYesPressed: () {
                            Navigator.push(context,
                              MaterialPageRoute(
                                builder: (context) => const CreateWorkout()));
                          },
                        );
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}