import 'package:ffeed_hub/Views/Auths/choose_role.dart';
import 'package:ffeed_hub/Views/Auths/sign_in_view.dart';
import 'package:ffeed_hub/Views/Auths/sign_up_view.dart';
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
        "/": (context) => const HomeView(),
        "/sign-in-view": (context) => SignInVC(),
        "/onboarding-view": (context) => OnboardingView(),
        "/choose-role": (context) => ChooseRole(),
        "/sign-up": (context) => SignUpVC()


      
      },
    );
  }
}
