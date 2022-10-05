import 'package:ffeed_hub/Views/Auths/choose_role.dart';
import 'package:ffeed_hub/Views/Auths/sign_in_view.dart';
import 'package:ffeed_hub/Views/Auths/sign_up_view.dart';
import 'package:ffeed_hub/Views/Donate/donate.dart';
import 'package:ffeed_hub/Views/Donate/delivery_details.dart';
import 'package:ffeed_hub/Views/FoodPickUps/pick_up_request_view.dart';
import 'package:ffeed_hub/Views/Home/home_view.dart';
import 'package:ffeed_hub/Views/Onboarding/onboarding_view.dart';
import 'package:ffeed_hub/Views/Onboarding/splash_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const SplashScreenView(),
        "/sign-in-view": (context) => const SignInVC(),
        "/onboarding-view": (context) => const OnboardingView(),
        "/choose-role": (context) => const ChooseRole(),
        "/sign-up": (context) => const SignUpVC(),
        "/home-view": (context) => const HomeView(),
        "/donate-view": (context) =>  DonateFood(),
        "/pickup-request-view": (context) => const FoodPickRequestVC(),
        "/donate-details-view": (context) =>  DonateFoodDetails(),
      },
    );
  }
}
