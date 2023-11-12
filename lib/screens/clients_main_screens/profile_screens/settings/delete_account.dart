import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/confirmation_dialog.dart';
import 'package:ifit/common/widgets/main_button.dart';
import 'package:ifit/common/widgets/text_field_container.dart';

class DeleteAccount extends StatefulWidget {
  const DeleteAccount({super.key});

  @override
  State<DeleteAccount> createState() => _DeleteAccountState();
}

class _DeleteAccountState extends State<DeleteAccount> {
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
        title: Text('Gallery',
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
                        const TextfieldContainer(hitText: 'Enter your Password',
                          icon: FluentSystemIcons.ic_fluent_lock_regular,
                          obscureText: false,
                        ),
                        Align(
                          //make a condition that make if any of it wasnt filled it will display "Enter _____"
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'Wrong Password',
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
            child: MainButton(title: "Delete Account", onPressed: (){
              showDialog(context: context,
                builder: (BuildContext context) {
                  return ConfirmationDialog(
                    onYesPressed: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //   builder: (context) => const LogIn()));
                    },
                  );});
            }),
          )
        ],
      ),
    );
  }
}