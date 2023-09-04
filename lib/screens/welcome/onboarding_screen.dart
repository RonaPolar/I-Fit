import 'package:flutter/material.dart';
import 'package:ifit/common/utils/app_styles.dart';
import 'package:ifit/screens/account-login&reg/register/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController; //for the push button
  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(  //paging sliding
                    itemCount: demo_data.length,
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _pageIndex = index;
                      });
                    },
                    itemBuilder: (context, index) => OnboardContent(
                      image: demo_data[index].image,
                      title: demo_data[index].title,
                      description: demo_data[index].description,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      right: 10, left: 10, bottom: 30, top: 0),
                  child: Row(
                    children: [
                      ...List.generate( //page indicator on the left
                          demo_data.length,
                          (index) => Padding(
                                padding: const EdgeInsets.only(right: 4),
                                child:
                                    DotIndicator(isActive: index == _pageIndex),
                              )),
                      const Spacer(),
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: FloatingActionButton(  //button
                          onPressed: () async {
                            if (_pageIndex == demo_data.length - 1) {  //if it is on the last page, it will go to the next screen
                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              await prefs.setBool('onboarding_completed', true);  // Update onboarding status
                              // ignore: use_build_context_synchronously
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Register()  //Registration form
                                ),
                              );
                            } else {
                              _pageController.nextPage(
                              curve: Curves.ease,
                              duration: const Duration(milliseconds: 300),
                              );
                            }
                          },
                          backgroundColor: primary, //modification at the .../common/utils/app_styles.dart
                          shape: const CircleBorder(), //button components
                          child:
                              const Icon(Icons.arrow_right_outlined, size: 45),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
      )
    );
  }
}

class DotIndicator extends StatelessWidget {  //for page indicator on the left
  const DotIndicator({
    super.key,
    this.isActive = false,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {  //page indicator on the left components
    return AnimatedContainer(
      //size of pageIndicator
      duration: const Duration(milliseconds: 300),
      height: isActive ? 20 : 4,
      width: 5,
      decoration: BoxDecoration(
        color: isActive ? primary : primary.withOpacity(0.4),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}

class Onboard { //onboard Contents
  final String image, title, description;

  Onboard(
      {required this.image, required this.title, required this.description});
}

// ignore: non_constant_identifier_names
final List<Onboard> demo_data = [ //nested contents
  Onboard(
      image: "assets/images/Logo.png",
      title: "Fitness & Wellness Application",
      description:
          "Join us and begin your journey to improving and living a healthier lifestyle"),
  Onboard(
      image: "assets/images/1stSlide.png",
      title: "Track with Greatness",
      description:
          "Keep track of your fitness and wellness journey and achieve your goals here"),
  Onboard(
      image: "assets/images/2ndSlide.png",
      title: "Get Burn",
      description:
          "Let’s keep burning, to achieve yours goals, it hurts \nonly temporarily, if you give up now \nyou will be in pain forever"),
  Onboard(
      image: "assets/images/3rdSlide.png",
      title: "Eat Well",
      description:
          "Let's start a healthy lifestyle with us, we can determine the perfect meal plan for you. \nHealthy eating is fun"),
  Onboard(
      image: "assets/images/4thSlide.png",
      title: "Knowledge & More",
      description:
          "Don’t know where to start? We got you covered! \nTake the program and we can show you \nwhere to begin"),
];

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final String image, title, description;
@override
Widget build(BuildContext context) {  //OnboardingScreen
    return Scaffold(
    backgroundColor: Styles.bgColor,  //modification at the .../common/utils/app_styles.dart
    body: Center(
    child: ListView(  //for scrolling when landscape
      shrinkWrap: true,
      children: [
        Column(
          children: [
            Image.asset(  //pictures
              image,
              height: 250,
            ),
            const SizedBox(height: 20),
            Text( //Bold text below the picture
              title,
              style: Styles.headlineSmall,
            ),
            const SizedBox(height: 10),
            Text( //text below the bold Text
              description,
              style: Styles.textStyle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    ),
    ),
  );
}
}
