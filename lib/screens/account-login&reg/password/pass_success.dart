import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/main_button.dart';
import 'package:ifit/screens/account-login&reg/login.dart';

class SuccessPassword extends StatefulWidget {
  const SuccessPassword({super.key});

  @override
  State<SuccessPassword> createState() => _SuccessPasswordState();
}

class _SuccessPasswordState extends State<SuccessPassword> {
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
                child: Center(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Container(
                        padding:
                            const EdgeInsets.only(right: 10, left: 10),
                        child: Column(
                          children: [
                            Image.asset('assets/images/pass_success.jpg'),
                            const Gap(30),
                            Text(
                              'Your Password has been changed successfully!',
                               style: Styles.headline,
                               textAlign: TextAlign.center,
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                    right: 20, left: 20, bottom: 30, top: 20),
                child: Column(
                  children: [
                    MainButton(
                      title: 'Login',
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LogIn(),
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