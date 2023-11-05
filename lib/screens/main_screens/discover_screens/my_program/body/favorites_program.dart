import 'package:flutter/material.dart';
import 'package:ifit/common/utils/app_styles.dart';

class FavoritesProgramScreen extends StatefulWidget {
  const FavoritesProgramScreen({super.key});

  @override
  State<FavoritesProgramScreen> createState() => _FavoritesProgramScreenState();
}

class _FavoritesProgramScreenState extends State<FavoritesProgramScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        children: const [
          Column(
            children: [
              Text('Favorites'),
            ],
          )]));
  }
}