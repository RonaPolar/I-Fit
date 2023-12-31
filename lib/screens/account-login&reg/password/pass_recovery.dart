import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/main_button.dart';
import 'package:ifit/common/widgets/text_field_container.dart';
import 'package:ifit/common/widgets/verification_text_box.dart';
import 'package:ifit/screens/account-login&reg/password/new_pass.dart';

class PasswordRecovery extends StatefulWidget {
  const PasswordRecovery({super.key});

  @override
  State<PasswordRecovery> createState() => _PasswordRecoveryState();
}

class _PasswordRecoveryState extends State<PasswordRecovery> {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
      backgroundColor: Styles.bgColor,
      body: SingleChildScrollView(
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
                                  'Password Recovery',
                                  style: Styles.headline25,
                                ),
                            const Gap(30),
                            Align(
                            alignment: Alignment.bottomLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Enter your information to recover your password',
                                  style: Styles.text15normal,
                                ),
                                const Gap(10),
                                const TextfieldContainer(
                                  hitText: 'Email',
                                  icon: FluentSystemIcons.ic_fluent_mail_regular,
                                  obscureText: false,
                                ),
                                const Gap(15),
                                const TextfieldContainer(
                                  hitText: 'Number',
                                  icon: FluentSystemIcons.ic_fluent_call_end_regular,
                                  obscureText: false,
                                ),
                                const Gap(5),
                                const Text(
                                  'Your number don\'t match to your information',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          )
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
                      title: 'Next',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VerificationCodeScreen(onConfirmPressed: (){
                              Navigator.pushReplacement(context,MaterialPageRoute(
                                builder: (context) => const NewPassword()),);
                            }),
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