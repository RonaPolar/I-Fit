import 'package:flutter/material.dart';
// import 'package:ifit/common/widgets/bottom_bar.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'DiscoverScreen, On Standby'
        )
      ),
      // bottomNavigationBar: BottomBar(),
    );
  }
}