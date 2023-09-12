import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/main_button.dart';
import 'package:ifit/common/widgets/text_field_container.dart';
import 'package:ifit/screens/account-login&reg/password/pass_recovery.dart';
import 'package:ifit/screens/account-login&reg/register/register.dart';
import 'package:ifit/screens/main_screens/main_bottom_bar.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool _isPasswordVisible = false; // Track password visibility


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
                            'Hey there,',
                            style: Styles.textStyle,
                          ),
                          Text(
                            'Welcome Back',
                            style: Styles.headline,
                          ),
                          const Gap(30),
                          const TextfieldContainer(
                            hitText: 'Email',
                            icon: FluentSystemIcons.ic_fluent_mail_regular,
                            obscureText: false,
                          ),
                          const Gap(15),
                          TextfieldContainer(
                            //password eye icon
                            hitText: 'Password',
                            icon: FluentSystemIcons.ic_fluent_lock_regular,
                            obscureText: !_isPasswordVisible,
                            rightIcon: IconButton(
                              icon: _isPasswordVisible
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                            ),
                          ),
                          const Gap(5),
                          const Align(
                            //make a condition that make if any of it wasnt filled it will display "Enter _____"
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              'Wrong Password',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          const Gap(10),
                          TextButton(onPressed: (){
                            Navigator.of(context).push( 
                              MaterialPageRoute(builder: (context) => const PasswordRecovery()));}, 
                            child: Text(
                            'Forgot your password?',
                            style: Styles.text2.copyWith(
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                    right: 20, left: 20, bottom: 5, top: 20),
                child: Column(
                  children: [
                    MainButton(
                      title: 'Login',
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainBottomBar(),
                          ),
                        );
                      },
                    ),
                    const Gap(10),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 1,
                            color: Styles.textColor,
                          ),
                        ),
                        Text(
                          ' Or ',
                          style: Styles.textStyle,
                        ),
                        Expanded(
                          child: Container(
                            height: 1,
                            color: Styles.textColor,
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigate to the login screen here
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const Register(),
                          ),
                        );
                      },
                      child: RichText(
                        text: TextSpan(
                          style: Styles.textStyle,
                          children: const <TextSpan>[
                            TextSpan(
                              text: 'Don’t have an account yet? ',
                            ),
                            TextSpan(
                              text: 'Register',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
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
