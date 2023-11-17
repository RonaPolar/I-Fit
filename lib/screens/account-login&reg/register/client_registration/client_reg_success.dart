import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/main_button.dart';
import 'package:ifit/screens/account-login&reg/login.dart';

class ClientSuccessRegistration extends StatefulWidget {
  const ClientSuccessRegistration({super.key});

  @override
  State<ClientSuccessRegistration> createState() => _ClientSuccessRegistrationState();
}

class _ClientSuccessRegistrationState extends State<ClientSuccessRegistration> {
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
                            Image.asset('assets/images/registration_success.png'),
                            const Gap(30),
                            Text(
                              'Welcome!',
                               style: Styles.headline25,
                               textAlign: TextAlign.center,
                              ),
                            Text(
                              'You are all set now, let’s reach your goals together with us',
                               style: Styles.text18,
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
                      title: 'Go to Login',
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