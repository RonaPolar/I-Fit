import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/confirmation_dialog.dart';
import 'package:ifit/common/widgets/main_button.dart';
import 'package:ifit/common/widgets/text_field_container.dart';
import 'package:ifit/screens/account-login&reg/register/client_registration/register_part2.dart';
import 'package:ifit/screens/experts_main_screens/exp_bottom_bar.dart';

class CreateMeal extends StatefulWidget {
  const CreateMeal({super.key});

  @override
  State<CreateMeal> createState() => _CreateMealState();
}

class _CreateMealState extends State<CreateMeal> {
  String? selectedValue;
  String? selectedFoodCategory;
  String? selectedFoodPurpose;


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
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return ConfirmationDialog(
                    question: "Are you sure to Quit?",
                    onYesPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ExpPrograms()));
                    },
                  );
                });
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
        title: Text(
          'Create Meal Plan',
          style: Styles.headline20,
        ),
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
                      hintText: 'Food Category',
                      icon: FluentSystemIcons.ic_fluent_food_regular,
                      items: const [
                        DropdownMenuItem<String>(
                          value: "Breakfast",
                          child: Text("Breakfast"),
                        ),
                        DropdownMenuItem<String>(
                          value: "Lunch",
                          child: Text("Lunch"),
                        ),
                        DropdownMenuItem<String>(
                          value: "Dinner",
                          child: Text("Dinner"),
                        ),
                        DropdownMenuItem<String>(
                          value: "Snacks",
                          child: Text("Snacks"),
                        ),
                        DropdownMenuItem<String>(
                          value: "Drinks",
                          child: Text("Drinks"),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedFoodCategory = value;
                        });
                      },
                      selectedValue: selectedFoodCategory,
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
                          selectedFoodPurpose  = value;
                        });
                      },
                      selectedValue: selectedFoodPurpose ,
                    ),


                    const Gap(10),
                    const TextfieldContainer(
                        hitText: 'Food Plan Name',
                        icon: FluentSystemIcons.ic_fluent_food_regular,
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
                          'Food Picture',
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
                      "Nutritions",
                      style: Styles.title,
                    ),
                    const Gap(5),
                    const TextfieldContainer(
                      hitText: 'Calories',
                      imagePath: "assets/icons/calories.png",
                      obscureText: false),
                    const Gap(10),
                    const TextfieldContainer(
                      hitText: 'Fats',
                      imagePath: "assets/icons/fat.png",
                      obscureText: false),
                    const Gap(10),
                    const TextfieldContainer(
                      hitText: 'Sugar',
                      imagePath: "assets/icons/sugar.png",
                      obscureText: false),
                    const Gap(10),
                    const TextfieldContainer(
                      hitText: 'Protein',
                      imagePath: "assets/icons/protein.png",
                      obscureText: false),

                    const Gap(20),
                    Text(
                      "Ingrediets Needed",
                      style: Styles.title,
                    ),
                    const Gap(5),
                    const TextfieldContainer(
                      hitText: 'Ingredients with Measurement',
                      icon: FluentSystemIcons.ic_fluent_food_regular,
                      obscureText: false),
                    const AddsubButton(
                      title: 'Ingredients', 
                      add: TextfieldContainer(
                        hitText: 'Ingredients with Measurement', 
                        icon: FluentSystemIcons.ic_fluent_food_regular,
                        obscureText: false)),

                    const Gap(20),
                    Text(
                      "Step by Step Preparations",
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


//Button for Add and Subtract
class AddsubButton extends StatefulWidget {
  final String title;
  final Widget add;
  const AddsubButton({super.key, required this.title, required this.add});

  @override
  State<AddsubButton> createState() => _AddsubButtonState();
}

class _AddsubButtonState extends State<AddsubButton> {
  List<Widget> steps = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () {
                setState(() {
                  if (steps.isNotEmpty) {
                    steps.removeLast();
                  }
                });
              },
            ),
            Text(widget.title, style: Styles.text15bold),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                setState(() {
                  steps.add(
                    Column(
                      children: [
                        const Gap(5),
                        widget.add
                      ],
                    ),
                  );
                });
              },
            ),
          ],
        ),
        const Gap(5),
        Column(
          children: [...steps],
        ),
      ],
    );
  }
}
