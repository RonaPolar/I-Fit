import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/confirmation_dialog.dart';
import 'package:ifit/common/widgets/main_button.dart';
import 'package:ifit/common/widgets/text_field_container.dart';
import 'package:ifit/screens/account-login&reg/register/client_registration/register_part2.dart';
import 'package:ifit/screens/clients_main_screens/main_bottom_bar.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
    List user = [
    {
      "name": "Juan Dela Cruz",
      "image": "assets/icons/profile_pic.png",
      "program": "Loss Weight Program",
      "number": "09678882245",
      "height": "188cm",
      "weight": "56kg",
      "age": "22",
      "gender": "Female",
      "email": "juandelacruz@gmail.com",
      "bday": "February 13, 2001",
    },
  ];


  @override
  Widget build(BuildContext context) {
  String? selectedValue;

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
                                    user[0]["image"].toString(),
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
                        TextfieldContainer(hitText: user[0]["name"].toString(), 
                          icon: FluentSystemIcons.ic_fluent_edit_regular, obscureText: false),
                        const Gap(15),
                        TextfieldContainer(hitText: user[0]["email"].toString(), 
                          icon: FluentSystemIcons.ic_fluent_edit_regular, obscureText: false),
                        const Gap(15),
                        TextfieldContainer(hitText: user[0]["number"].toString(), 
                          icon: FluentSystemIcons.ic_fluent_edit_regular, obscureText: false),
                        const Gap(15),
                        RegisterDropDown(hintText: user[0]["program"].toString(), 
                          icon: FluentSystemIcons.ic_fluent_edit_regular,
                          items: const [
                            DropdownMenuItem<String>(
                              value: "Loss Weight",
                              child: Text("Loss Weight Program"),),
                            DropdownMenuItem<String>(
                              value: "Body Toning",
                              child: Text("Body Toning Program"),),
                            DropdownMenuItem<String>(
                              value: "Gain Muscles",
                              child: Text("Gain Muscles Program"),)
                          ],  
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value;
                            });
                          },
                          selectedValue: selectedValue,
                          ),
                        // TextfieldContainer(hitText: user[0]["program"].toString(), 
                        //   icon: FluentSystemIcons.ic_fluent_edit_regular, obscureText: false),
                        const Gap(15),
                        TextfieldContainer(hitText: user[0]["bday"].toString(), 
                          icon: FluentSystemIcons.ic_fluent_edit_regular, obscureText: false),
                        const Gap(15),
                        DisplayTextContainer(hitText: user[0]["age"].toString(), 
                          icon: FluentSystemIcons.ic_fluent_person_accounts_regular, obscureText: false),
                        const Gap(15),
                        DisplayTextContainer(hitText: user[0]["gender"].toString(), 
                          icon: FluentSystemIcons.ic_fluent_person_accounts_regular, obscureText: false),
                        const Gap(15),
                        DisplayTextContainer(hitText: user[0]["height"].toString(), 
                          icon: FluentSystemIcons.ic_fluent_person_accounts_regular, obscureText: false),
                        const Gap(15),
                        DisplayTextContainer(hitText: user[0]["weight"].toString(), 
                          icon: FluentSystemIcons.ic_fluent_person_accounts_regular, obscureText: false),
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