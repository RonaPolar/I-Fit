import 'package:flutter/material.dart';
import 'package:ifit/common/utils/app_styles.dart';


class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'NotificationsScreen, On Standby',
          style: Styles.headline,
        )
      ),
    );
  }
}