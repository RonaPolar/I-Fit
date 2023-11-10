import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/screens/account-login&reg/login.dart';

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        width: 200,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:30, bottom:20),
              child: Text(
                'Are you sure?',
                style: Styles.headline20,
              ),
            ),
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const LogIn()));
                  },
                  child: Text(
                    'Yes',
                    style: Styles.title),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);},
                  child: Text(
                    'No',
                    style: Styles.title),
                ),
              ],
            ),
          ],
        ),
      ),
      
    );
  }
}