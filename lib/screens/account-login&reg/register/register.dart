import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/common/widgets/main_button.dart';
import 'package:ifit/common/widgets/verification_text_box.dart';
import 'package:ifit/screens/account-login&reg/login.dart';
import 'package:ifit/screens/account-login&reg/register/client_registration/register_part2.dart';
import 'package:ifit/screens/account-login&reg/register/expert_registration/expert_registration1.dart';
import 'package:ifit/screens/account-login&reg/register/popup_privacy_terms.dart';
import 'package:ifit/common/widgets/text_field_container.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _isPasswordVisible = false; // Track password visibility
  bool _isCheck = false; // Track check box
  String? selectedValue;
  String? destinationScreen;

  // Function to show the Privacy Policy dialog
  void _showPrivacyPolicyDialog() {
    CustomDialogs.showPrivacyPolicyDialog(context);
  }

  // Function to show the Terms of Use dialog
  void _showTermsOfUseDialog() {
    CustomDialogs.showTermsOfUseDialog(context);
  }

  void _showTypesOfUserDialog() {
    CustomDialogs.showTypesOfUserDialog(context);
  }

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
                            style: Styles.text18,
                          ),
                          Text(
                            'Create an Account',
                            style: Styles.headline25,
                          ),
                          const Gap(30),
                          // this is where the modification of it --> /common/widgets/textfield_container.dart';
                          const TextfieldContainer(
                            hitText: 'First Name',
                            icon: FluentSystemIcons.ic_fluent_person_regular,
                            obscureText: false,
                          ),
                          const Gap(15),
                          const TextfieldContainer(
                            hitText: 'Last Name',
                            icon: FluentSystemIcons.ic_fluent_person_regular,
                            obscureText: false,
                          ),
                          const Gap(15),
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
                          const Gap(15),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text.rich(
                              TextSpan(
                                text: 'Click here to learn about ',
                                children: [
                                  TextSpan(
                                    text: 'Type of User',
                                    style: TextStyle(
                                      color: Styles.textColor,
                                      decoration: TextDecoration.underline,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        _showTypesOfUserDialog(); // Show Privacy Policy dialog
                                      },
                                  ),
                                ],
                              ),
                              style: TextStyle(color: Styles.fadeTextColor),
                            ),
                          ),
                          const Gap(5),
                          RegisterDropDown(
                            hintText: 'Type of User',
                            icon: FluentSystemIcons.ic_fluent_people_regular,
                            items: const [
                              DropdownMenuItem<String>(
                                value: "Client",
                                child: Text("Client"),
                              ),
                              DropdownMenuItem<String>(
                                value: "Expert",
                                child: Text("Expert"),
                              )
                            ],
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value;

                                if (value == "Client") {
                                destinationScreen = "ClientRegistration";
                                } else if (value == "Expert") {
                                  destinationScreen = "ExpertRegistration";
                                } 
                                
                              });                              
                            },
                            selectedValue: selectedValue,
                          ),
                          const Gap(5),
                          Align(
                            //make a condition that make if any of it wasnt filled it will display "Enter _____"
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              'Password must contain at least 8 characters',
                              style: Styles.text15normal.copyWith(
                                color: Colors.red,
                              ),
                            ),
                          ),
                          const Gap(10),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isCheck = !_isCheck;
                                  });
                                },
                                icon: _isCheck
                                    ? const Icon(FluentSystemIcons
                                        .ic_fluent_checkbox_checked_regular)
                                    : const Icon(FluentSystemIcons
                                        .ic_fluent_checkbox_unchecked_regular),
                                color: Styles.fadeTextColor,
                              ),
                              Expanded(
                                child: Text.rich(
                                  TextSpan(
                                    text: 'By continuing you accept our ',
                                    children: [
                                      TextSpan(
                                        text: 'Privacy Policy',
                                        style: TextStyle(
                                          color: Styles.textColor,
                                          decoration: TextDecoration.underline,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            _showPrivacyPolicyDialog(); // Show Privacy Policy dialog
                                          },
                                      ),
                                      const TextSpan(text: ' and '),
                                      TextSpan(
                                        text: 'Terms of Use',
                                        style: TextStyle(
                                          color: Styles.textColor,
                                          decoration: TextDecoration.underline,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            _showTermsOfUseDialog(); // Show Terms of Use dialog
                                          },
                                      ),
                                    ],
                                  ),
                                  style: TextStyle(color: Styles.fadeTextColor),
                                ),
                              ),
                            ],
                          ),
                          const Gap(10),
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
                      title: 'Register',
                      onPressed: () {
                          Navigator.push(context,
                            MaterialPageRoute(
                              builder: (context) => VerificationCodeScreen(onConfirmPressed: (){
                                if (destinationScreen == "ClientRegistration") {
                                  Navigator.pushReplacement(context,MaterialPageRoute(
                                    builder: (context) => const RegisterPart2()),);
                                } else if (destinationScreen == "ExpertRegistration") {
                                  Navigator.pushReplacement(context,MaterialPageRoute(
                                    builder: (context) => const ExpertRegistration1()),);
                                } 
                              }),
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
                          style: Styles.text18,
                        ),
                        Expanded(
                          child: Container(
                            height: 1,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigate to the login screen here
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const LogIn(),
                          ),
                        );
                      },
                      child: RichText(
                        text: TextSpan(
                          style: Styles.text18,
                          children: <TextSpan>[
                            const TextSpan(
                              text: 'Already have an Account? ',
                            ),
                            TextSpan(
                              text: 'Login',
                              style: Styles.title.copyWith(
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
