import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/confirmation_dialog.dart';
import 'package:ifit/common/widgets/main_button.dart';
import 'package:ifit/common/widgets/text_field_container.dart';
import 'package:ifit/screens/account-login&reg/register/client_registration/register_part2.dart';
import 'package:ifit/screens/clients_main_screens/profile_screens/contact_us.dart';
import 'package:ifit/screens/experts_main_screens/exp_bottom_bar.dart';
import 'package:ifit/screens/experts_main_screens/exp_program_screens/create_program_screens/create_meal.dart';
import 'package:ifit/screens/experts_main_screens/exp_program_screens/create_program_screens/create_work_next.dart';

class CreateWorkout extends StatefulWidget {
  const CreateWorkout({super.key});

  @override
  State<CreateWorkout> createState() => _CreateWorkoutState();
}

class _CreateWorkoutState extends State<CreateWorkout> {
  String? selectedWorkoutCategory;
  String? selectedWorkoutDifficulty;
  String? selectedWorkoutPurpose;
  String? selectedValue;

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
                  question: "Are you sure to Quit?",
                  onYesPressed: () {
                    Navigator.push(context,MaterialPageRoute(
                      builder: (context) => const ExpPrograms()));
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
        title: Text('Create Workout Plan',
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
                    RegisterDropDown(
                      hintText: 'Category',
                      icon: Icons.fitness_center_outlined,
                      items: const [
                        DropdownMenuItem<String>(
                          value: "Upper Body",
                          child: Text("Upper Body"),
                        ),
                        DropdownMenuItem<String>(
                          value: "Abdominal",
                          child: Text("Abdominal"),
                        ),
                        DropdownMenuItem<String>(
                          value: "Lower Body",
                          child: Text("Lower Body"),
                        ),
                        DropdownMenuItem<String>(
                          value: "Full Body",
                          child: Text("Full Body"),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedWorkoutCategory = value;
                        });
                      },
                      selectedValue: selectedWorkoutCategory,
                    ),

                    const Gap(10),
                    RegisterDropDown(
                      hintText: 'Purpose',
                      icon: Icons.fitness_center_outlined,
                      items: const [
                        DropdownMenuItem<String>(
                          value: "Lose Weight",
                          child: Text("Lose Weight"),
                        ),
                        DropdownMenuItem<String>(
                          value: "Gain Muscles",
                          child: Text("Gain Muscles"),
                        ),
                        DropdownMenuItem<String>(
                          value: "Body Toning",
                          child: Text("Body Toning"),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedWorkoutPurpose  = value;
                        });
                      },
                      selectedValue: selectedWorkoutPurpose ,
                    ),


                    const Gap(10),
                    RegisterDropDown(
                      hintText: 'Difficulty',
                      icon: Icons.fitness_center_outlined,
                      items: const [
                        DropdownMenuItem<String>(
                          value: "Beginner",
                          child: Text("Beginner"),
                        ),
                        DropdownMenuItem<String>(
                          value: "Intermediate",
                          child: Text("Intermediate"),
                        ),
                        DropdownMenuItem<String>(
                          value: "Expert",
                          child: Text("Expert"),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedWorkoutDifficulty  = value;
                        });
                      },
                      selectedValue: selectedWorkoutDifficulty ,
                    ),

                    const Gap(10),
                    const TextfieldContainer(
                      hitText: 'Plan Name',
                      icon: Icons.fitness_center_outlined,
                      obscureText: false),
                    const Gap(10),
                    const SizedBox(
                      height: 100,
                      child: BigTextField(
                        hintText: "Descriptions",
                      ),
                    ),
                    const Gap(10),
                    Row(
                      children: [
                        Text(
                          'Workout Picture',
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
                    const TextfieldContainer(
                      hitText: 'Days of the Plan',
                      icon: FluentSystemIcons.ic_fluent_calendar_regular,
                      obscureText: false),
                    const Gap(10),
                    const TextfieldContainer(
                      hitText: 'Minutes it Takes to Do',
                      icon: FluentSystemIcons.ic_fluent_timer_regular,
                      obscureText: false),
                    const Gap(10),
                    const TextfieldContainer(
                      hitText: 'Calories',
                      imagePath: "assets/icons/calories.png",
                      obscureText: false),

                    const Gap(20),
                    Text(
                      "Equipments Needed",
                      style: Styles.title,
                    ),
                    const Gap(5),
                    const TextfieldContainer(
                      hitText: 'Equipment with Quantity',
                      icon: Icons.fitness_center_outlined,
                      obscureText: false),

                    const AddsubButton(
                      title: 'Items', 
                      add: TextfieldContainer(
                        hitText: 'Equipment with Quantity', 
                        icon: Icons.fitness_center_outlined,
                        obscureText: false)),

                    const Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Exercises",
                          style: Styles.title,
                        ),
                        Text("Indicate how many sets", style: Styles.text15normal),
                      ],
                    ),
                    AddsubButton(
                      title: 'Sets',
                      add: Column(
                        children: [
                          const Gap(5),
                          Text('Input the Exercises to the Set and Click Continue', style: Styles.text15bold,),
                          const Gap(5),
                          TextfieldContainer(
                            hitText: 'Exercise',
                            icon: Icons.fitness_center_outlined,
                            rightIcon: SizedBox(width: 100, 
                              child: MainButton(title: 'Continue', 
                                textStyle: Styles.text15bold.copyWith(color: Colors.white), 
                                onPressed: (){
                                  Navigator.pushReplacement(context,
                                    MaterialPageRoute(
                                      builder: (context) => const CreateWorkoutNext()));
                                })),
                            obscureText: false),

                          AddsubButton(
                            title: 'Exercise', 
                            add: TextfieldContainer(
                              hitText: 'Exercise',
                              icon: Icons.fitness_center_outlined,
                              rightIcon: SizedBox(width: 100, 
                                child: MainButton(title: 'Continue', 
                                textStyle: Styles.text15bold.copyWith(color: Colors.white), 
                                onPressed: (){
                                  Navigator.pushReplacement(context,
                                    MaterialPageRoute(
                                      builder: (context) => const CreateWorkoutNext()));
                                })),
                              obscureText: false
                            ),
                          ),
                        ],
                        )
                      ),
                  ],
                ),
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
                          question: "Are you sure to create?",
                          onYesPressed: () {
                            Navigator.push(context,
                              MaterialPageRoute(
                                builder: (context) => const ExpPrograms()));
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