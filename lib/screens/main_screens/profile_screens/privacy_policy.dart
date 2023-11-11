import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/screens/main_screens/profile_screens/contact_us.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
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
        title: Text('Privacy Policy',
        style: Styles.headline20,),
      ),
      body: ListView(
        children:  [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'This outlines how we collect, use, and protect the data of users who access and use our Application. It is important that you read and understand this Policy before using it.',
                ),
                const SizedBox(height: 5),
                const Text(
                  '• Information Collection',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                const Text(
                  '1. Personal Information: We may collect personal information from users, such as names, email addresses, and contact information. This information is provided voluntarily by users when they register or use certain features of the Application.',
                ),
                const SizedBox(height: 10),
                const Text(
                  '• Use of Collected Information',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                const Text(
                  '2. Personal Information: We may use personal information to provide users with a personalized experience within the Application, to communicate with them about updates or changes to the Application, and to respond to inquiries or support requests.',
                ),
                const SizedBox(height: 10),
                const Text(
                  '• Data Sharing and Disclosure',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                const Text(
                  '3.1 Third-Party Service Providers: We may engage third-party service providers to perform certain functions on our behalf, such as hosting the Application or analyzing user data. These service providers will have access to personal information only to the extent necessary to perform their functions and are obligated to maintain the confidentiality and security of the data.',
                ),
                const Text(
                  '3.2 Legal Requirements: We may disclose personal information if required to do so by law or in the good faith belief that such action is necessary to comply with legal obligations or protect our rights, property, or safety, or the rights, property, or safety of others.',
                ),
                const SizedBox(height: 10),
                const Text(
                  '• Data Security',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                const Text(
                  'We implement reasonable security measures to protect personal information from unauthorized access, alteration, disclosure, or destruction. However, no method of transmission over the internet or electronic storage is 100% secure, and we cannot guarantee absolute security.',
                ),
                const SizedBox(height: 10),
                const Text(
                  '• Changes to the Privacy Policy',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                const Text(
                  'We reserve the right to modify or update this Privacy Policy at any time. Users will be notified of any material changes to this Policy by updating the "Effective Date" at the beginning of this document. Continued use of the Application after such modifications constitutes acceptance of the revised Privacy Policy.',
                ),
                const SizedBox(height: 10),
                const Text(
                  '• Contact Us',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text.rich(
                  TextSpan(
                    text: 'If you have any questions or concerns regarding this Privacy Policy or our data practices, please go to \n',
                    children: [
                      TextSpan(
                        text: 'Contact Us',
                        style: const TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const ContactUs()));
                            },
                          ),
                        ],
                      ),
                    ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}