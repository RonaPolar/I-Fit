import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/confirmation_dialog.dart';
import 'package:ifit/common/widgets/main_button.dart';
import 'package:ifit/common/widgets/text_field_container.dart';
import 'package:ifit/screens/clients_main_screens/main_bottom_bar.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  List experts = [
    {
      "name": "Dr. Otto Octavius",
      "image": "assets/images/experts/expert1.png",
      "profession": "Physician",
      "number": "09678882245",
      "age": "33",
      "gender": "Male",
      "email": "ottooctavius@gmail.com",
      "bday": "February 20, 1990",
      "rate": "4.5",
      "mealCreated": "2",
      "workoutCreated": "3",
      "descriptions": "Hello! I completed my course in 2017 and have 5 years of experience working as Physician. If you like my programs I created, you can visit me at Manila Center at Makati City.",
    },
  ];


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
            Navigator.pop(context);
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
        title: Text('Edit Profile',
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Profile Details",
                          style: Styles.title
                        ),
                        const Gap(20),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: Styles.primaryColor,
                              width: 2.0,
                            ),
                          ),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: Image.asset(
                                    experts[0]["image"].toString(),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: -2,
                                right: -2,
                                child: IconButton(
                                  icon: Icon(
                                    FluentSystemIcons.ic_fluent_camera_filled,
                                    color: Styles.primaryColor,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    // Handle camera button press
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Gap(15),
                        TextfieldContainer(hitText: experts[0]["name"].toString(), 
                          icon: FluentSystemIcons.ic_fluent_edit_regular, obscureText: false),
                        const Gap(15),
                        DisplayTextContainer(hitText: experts[0]["email"].toString(), 
                          icon: FluentSystemIcons.ic_fluent_mail_regular, obscureText: false),
                        const Gap(15),
                        TextfieldContainer(hitText: experts[0]["number"].toString(), 
                          icon: FluentSystemIcons.ic_fluent_edit_regular, obscureText: false),
                        const Gap(15),
                        DisplayTextContainer(hitText: experts[0]["profession"].toString(), 
                          icon: FluentSystemIcons.ic_fluent_person_accounts_regular, obscureText: false),
                        const Gap(15),
                        TextfieldContainer(hitText: experts[0]["bday"].toString(), 
                          icon: FluentSystemIcons.ic_fluent_edit_regular, obscureText: false),
                        const Gap(15),
                        DisplayTextContainer(hitText: experts[0]["age"].toString(), 
                          icon: FluentSystemIcons.ic_fluent_person_regular, obscureText: false),
                        const Gap(15),
                        DisplayTextContainer(hitText: experts[0]["gender"].toString(), 
                          icon: FluentSystemIcons.ic_fluent_people_regular, obscureText: false),
                      ],
                    ),
                    
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: MainButton(title: "Update Changes", onPressed: (){
              showDialog(context: context,
                builder: (BuildContext context) {
                  return ConfirmationDialog(
                    onYesPressed: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                        builder: (context) => const ProfileNavBar()));
                    },
                  );});
            }),
          )
        ],
      ),
    );
  }
}