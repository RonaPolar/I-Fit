import 'package:flutter/material.dart';
import 'package:ifit/common/utils/app_styles.dart';

class ExpHomeScreen extends StatefulWidget {
  const ExpHomeScreen({super.key});

  @override
  State<ExpHomeScreen> createState() => _ExpHomeScreenState();
}

class _ExpHomeScreenState extends State<ExpHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Text("Home", style: Styles.headlineBig,));
  }
}