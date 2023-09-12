import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/main_button.dart';
import 'package:ifit/common/widgets/verification_text_box.dart';
import 'package:ifit/screens/account-login&reg/password/new_pass.dart';

class PasswordVerification extends StatefulWidget {
  const PasswordVerification({super.key});

  @override
  State<PasswordVerification> createState() => _PasswordVerificationState();
}

class _PasswordVerificationState extends State<PasswordVerification> {
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
                                  'Verification Code',
                                  style: Styles.headline,
                                ),
                            const Gap(30),
                            Align(
                            alignment: Alignment.bottomLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'We have sent the code verification to',
                                  style: Styles.text2,
                                ),
                                Text(
                                  'jua*********@gmail.com',
                                  style: Styles.textStyle.copyWith(
                                  fontSize: 15,
                                  color: Colors.blue, // You can change the color to your preference
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Gap(10),
                          VerificationTextBox(
                            numberOfFields: 4,
                            fieldWidth: 65.0,
                            fieldSpacing: 20.0,
                            onCodeChanged: (code) {
                              // Handle the OTP code here
                            },
                          ),
                          const Gap(15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Did\'nt receive yet?',
                                style: Styles.text2,
                                ),
                              TextButton(
                                onPressed: () {

                                  },
                                child: RichText(
                                  text: TextSpan(
                                    style: Styles.text2,
                                    children: const <TextSpan>[
                                      TextSpan(
                                        text: 'Resend',
                                        style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
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
                            builder: (context) => const NewPassword(),
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