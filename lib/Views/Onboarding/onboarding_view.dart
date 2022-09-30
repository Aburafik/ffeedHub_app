import 'package:ffeed_hub/Commons/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      color: blackColor,
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
    );
    return Scaffold(
      body: OnBoardingSlider(
        indicatorAbove: true,
        finishButtonText: 'Get Started',
        onFinish: () => Navigator.pushNamedAndRemoveUntil(
            context, "/sign-in-view", (route) => false),
        finishButtonColor: primaryColor,
        skipTextButton: const Text(
          'Skip',
          style: TextStyle(
            fontSize: 16,
            color: lightGreyColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: const Text(
          'Login',
          style: TextStyle(
            fontSize: 16,
            color: lightGreyColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailingFunction: () => Navigator.pushNamedAndRemoveUntil(
            context, "/sign-in-view", (route) => false),
        controllerColor: primaryColor,
        totalPage: 3,
        headerBackgroundColor: Colors.white,
        pageBackgroundColor: Colors.white,
        background: [
          SizedBox(
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Image.asset(
                'images/tips.png',
              ),
            ),
          ),
          SizedBox(
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Image.asset("images/survey.png"),
            ),
          ),
          SizedBox(
            height: 500,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Image.asset(
                'images/technician.png',
                height: 200,
                width: 200,
              ),
            ),
          ),
        ],
        speed: 1.8,
        pageBodies: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const <Widget>[
                SizedBox(
                  height: 480,
                ),
                Text(
                  'You have two hands,one to help\n yourself, the second to help others',
                  textAlign: TextAlign.center,
                  style: textStyle,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const <Widget>[
                SizedBox(
                  height: 480,
                ),
                Text('You can donate the leftover\n food to help the poor',
                    textAlign: TextAlign.center, style: textStyle),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const <Widget>[
                SizedBox(
                  height: 460,
                ),
                Text('Become a volunteer and\n help the needy ',
                    textAlign: TextAlign.center, style: textStyle),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
