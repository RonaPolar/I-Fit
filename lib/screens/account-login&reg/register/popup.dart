import 'package:flutter/material.dart';

class CustomDialogs {
  static void showPrivacyPolicyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Privacy Policy'),
          content: const SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'This outlines how we collect, use, and protect the data of users who access and use our Application. It is important that you read and understand this Policy before using it.',
                ),
                SizedBox(height: 5),
                Text(
                  '• Information Collection',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  '1. Personal Information: We may collect personal information from users, such as names, email addresses, and contact information. This information is provided voluntarily by users when they register or use certain features of the Application.',
                ),
                SizedBox(height: 10),
                Text(
                  '• Use of Collected Information',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  '2. Personal Information: We may use personal information to provide users with a personalized experience within the Application, to communicate with them about updates or changes to the Application, and to respond to inquiries or support requests.',
                ),
                SizedBox(height: 10),
                Text(
                  '• Data Sharing and Disclosure',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  '3.1 Third-Party Service Providers: We may engage third-party service providers to perform certain functions on our behalf, such as hosting the Application or analyzing user data. These service providers will have access to personal information only to the extent necessary to perform their functions and are obligated to maintain the confidentiality and security of the data.',
                ),
                Text(
                  '3.2 Legal Requirements: We may disclose personal information if required to do so by law or in the good faith belief that such action is necessary to comply with legal obligations or protect our rights, property, or safety, or the rights, property, or safety of others.',
                ),
                SizedBox(height: 10),
                Text(
                  '• Data Security',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  'We implement reasonable security measures to protect personal information from unauthorized access, alteration, disclosure, or destruction. However, no method of transmission over the internet or electronic storage is 100% secure, and we cannot guarantee absolute security.',
                ),
                SizedBox(height: 10),
                Text(
                  '• Changes to the Privacy Policy',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  'We reserve the right to modify or update this Privacy Policy at any time. Users will be notified of any material changes to this Policy by updating the "Effective Date" at the beginning of this document. Continued use of the Application after such modifications constitutes acceptance of the revised Privacy Policy.',
                ),
                SizedBox(height: 10),
                Text(
                  '• Contact Us',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  'If you have any questions or concerns regarding this Privacy Policy or our data practices, please contact us at earist.edu@gmail.com',
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }


  // Function to show a Terms of Use dialog
  static void showTermsOfUseDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Terms of Use'),
          content: const SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'This outlines how we collect, use, and protect the data of users who access and use our Application. It is important that you read and understand this Policy before using it.',
                ),
                SizedBox(height: 10),
                Text(
                  '• Information Collection',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  '1. Personal Information: We may collect personal information from users, such as names, email addresses, and contact information. This information is provided voluntarily by users when they register or use certain features of the Application.',
                ),
                SizedBox(height: 10),
                Text(
                  '• Use of Collected Information',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  '2. Personal Information: We may use personal information to provide users with a personalized experience within the Application, to communicate with them about updates or changes to the Application, and to respond to inquiries or support requests.',
                ),
                SizedBox(height: 10),
                Text(
                  '• Data Sharing and Disclosure',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  '3.1 Third-Party Service Providers: We may engage third-party service providers to perform certain functions on our behalf, such as hosting the Application or analyzing user data. These service providers will have access to personal information only to the extent necessary to perform their functions and are obligated to maintain the confidentiality and security of the data.',
                ),
                Text(
                  '3.2 Legal Requirements: We may disclose personal information if required to do so by law or in the good faith belief that such action is necessary to comply with legal obligations or protect our rights, property, or safety, or the rights, property, or safety of others.',
                ),
                SizedBox(height: 10),
                Text(
                  '• Data Security',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  'We implement reasonable security measures to protect personal information from unauthorized access, alteration, disclosure, or destruction. However, no method of transmission over the internet or electronic storage is 100% secure, and we cannot guarantee absolute security.',
                ),
                SizedBox(height: 10),
                Text(
                  '• Changes to the Privacy Policy',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  'We reserve the right to modify or update this Privacy Policy at any time. Users will be notified of any material changes to this Policy by updating the "Effective Date" at the beginning of this document. Continued use of the Application after such modifications constitutes acceptance of the revised Privacy Policy.',
                ),
                SizedBox(height: 10),
                Text(
                  '• Contact Us',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  'If you have any questions or concerns regarding this Privacy Policy or our data practices, please contact us at earist.edu@gmail.com',
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
