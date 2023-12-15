import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/confirmation_dialog.dart';
import 'package:ifit/screens/account-login&reg/register/client_registration/register_part2.dart';
import 'package:ifit/screens/experts_main_screens/exp_bottom_bar.dart';

class CreateMeal extends StatefulWidget {
  const CreateMeal({super.key});

  @override
  State<CreateMeal> createState() => _CreateMealState();
}

class _CreateMealState extends State<CreateMeal> {
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
        title: Text('Create Meal Plan',
        style: Styles.headline20,),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              RegisterDropDown(hintText: 'Meal Category', 
                icon: FluentSystemIcons.ic_fluent_people_regular,
                items: const [
                  DropdownMenuItem<String>(
                    value: "Breakfast",
                    child: Text("Breakfast"),),
                  DropdownMenuItem<String>(
                    value: "Lunch",
                    child: Text("Lunch"),),
                  DropdownMenuItem<String>(
                    value: "Dinner",
                    child: Text("Dinner"),),
                  DropdownMenuItem<String>(
                    value: "Snacks",
                    child: Text("Snacks"),),
                  DropdownMenuItem<String>(
                    value: "Drinks",
                    child: Text("Drinks"),),
                ],  
                onChanged: (value) {
                  setState(() {
                    selectedValue = value;
                  });
                },
                selectedValue: selectedValue,
                ),
            ],
          ),
        ),
      ),
    );
  }
}