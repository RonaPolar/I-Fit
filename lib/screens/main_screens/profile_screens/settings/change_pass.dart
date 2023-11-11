import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/confirmation_dialog.dart';
import 'package:ifit/common/widgets/main_button.dart';
import 'package:ifit/common/widgets/text_field_container.dart';
import 'package:ifit/common/widgets/verification_text_box.dart';
import 'package:ifit/screens/account-login&reg/password/pass_success.dart';

class ChangePass extends StatefulWidget {
  const ChangePass({super.key});

  @override
  State<ChangePass> createState() => _ChangePassState();
}

class _ChangePassState extends State<ChangePass> {
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
        title: Text('Change Password',
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
                          "Please enter your password to confirm identity",
                          style: Styles.title
                        ),
                        const Gap(20),
                        const TextfieldContainer(hitText: 'Current Password',
                          icon: FluentSystemIcons.ic_fluent_lock_regular,
                          obscureText: false,
                        ),
                        const Gap(15),
                        const TextfieldContainer(hitText: 'New Password',
                          icon: FluentSystemIcons.ic_fluent_mail_regular,
                          obscureText: false,
                        ),
                        const Gap(15),
                        const TextfieldContainer(hitText: 'Confirm Password',
                          icon: FluentSystemIcons.ic_fluent_mail_regular,
                          obscureText: false,
                        ),
                        const Gap(5),
                        Align(
                          //make a condition that make if any of it wasnt filled it will display "Enter _____"
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'Enter the new password again',
                            style: Styles.text15normal.copyWith(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                    
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: MainButton(title: "Confirm", onPressed: (){
              showDialog(context: context,
                builder: (BuildContext context) {
                  return ConfirmationDialog(
                    onYesPressed: () {
                      Navigator.pushReplacement(context,MaterialPageRoute(
                        builder: (context) => VerificationCodeScreen(onConfirmPressed: () {
                          Navigator.pushReplacement(context,MaterialPageRoute(
                            builder: (context) => const SuccessPassword()),);
                        },)),);
                    },
                  );});
            }),
          )
        ],
      ),
    );
  }
}