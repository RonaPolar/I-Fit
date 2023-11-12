// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/screens/clients_main_screens/home_screens/home.dart';
import 'package:ifit/screens/clients_main_screens/main_bottom_bar.dart';
import 'package:ifit/screens/clients_main_screens/program_tracker_screens/meal_screens/meal_tracker.dart';
import 'package:ifit/screens/clients_main_screens/program_tracker_screens/program_schedule/program_schedule.dart';
import 'package:ifit/screens/clients_main_screens/program_tracker_screens/workout_screens/workout_tracker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ifit/screens/welcome/onboarding_screen.dart';
import 'package:ifit/screens/account-login&reg/register/register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final WidgetsBinding widgetsBinding = WidgetsBinding.instance; // Define and initialize widgetsBinding
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  SharedPreferences prefs = await SharedPreferences.getInstance();  //dependency to check if just installed
  bool isFirstTime = prefs.getBool('isFirstTime') ?? true;
  Widget homeScreen;

  if (isFirstTime) {  //condition to when the OnboardingScreen shows
    homeScreen = const OnboardingScreen();
    await prefs.setBool('isFirstTime', false);
  } else {
    homeScreen = const Register();  //Registration
  }

  runApp(MyApp(homeScreen: homeScreen));
}

class MyApp extends StatefulWidget {
  final Widget? homeScreen;

  const MyApp({Key? key, this.homeScreen}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();

    // whenever initialization is completed, remove the splash screen:
    Future.delayed(const Duration(seconds: 2)).then((value) => {
      FlutterNativeSplash.remove()
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primary,
      ),
      title: 'I-Fit',
    // home: const HomeNavBar(),
    home: widget.homeScreen, //either Onboarding or Register Screen

    );
  }
}
 