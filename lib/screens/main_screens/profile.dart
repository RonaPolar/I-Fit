import 'package:flutter/material.dart';
// import 'package:ifit/common/widgets/bottom_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'ProfileScreen, On Standby'
        )
      ),
      // bottomNavigationBar: BottomBar(),
    );
  }
}