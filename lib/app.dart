import 'package:ffeed_hub/Commons/Components/location_picker.dart';
import 'package:ffeed_hub/Commons/Components/requset_sent_component.dart';
import 'package:ffeed_hub/Commons/color_theme.dart';
import 'package:ffeed_hub/Views/Auths/choose_role.dart';
import 'package:ffeed_hub/Views/Auths/pinCode_verification.dart';
import 'package:ffeed_hub/Views/Auths/sign_in_view.dart';
import 'package:ffeed_hub/Views/Auths/sign_up_view.dart';
import 'package:ffeed_hub/Views/Donate/donate.dart';
import 'package:ffeed_hub/Views/Donate/delivery_details.dart';
import 'package:ffeed_hub/Views/FoodPickUps/location_navigation_view.dart';
import 'package:ffeed_hub/Views/FoodPickUps/pick_up_request_view.dart';
import 'package:ffeed_hub/Views/FoodPickUps/pickup_details.dart';
import 'package:ffeed_hub/Views/Home/about_ngo.dart';
import 'package:ffeed_hub/Views/Home/home_view.dart';
import 'package:ffeed_hub/Views/Onboarding/onboarding_view.dart';
import 'package:ffeed_hub/Views/Onboarding/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(backgroundColor: primaryColor)
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const SplashScreenView(),
        "/sign-in-view": (context) => const SignInVC(),
        "/onboarding-view": (context) => const OnboardingView(),
        "/choose-role": (context) => const ChooseRole(),
        "/sign-up": (context) => const SignUpVC(),
        "/home-view": (context) => const HomeView(),
        "/donate-view": (context) => DonateFood(),
        "/pickup-request-view": (context) => const FoodPickRequestVC(),
        "/donate-details-view": (context) => const DonateFoodDetails(),
        "/successMesssage": (context) => const RequestSuccessMessageComponent(),
        "/pickup-details": (context) => const PickUpDetailsVC(),
        "/navigation_view": (context) => LocationNavigationVC(),
        "/code-verification-view": (context) => PinCodeVerificationScreen(),
        "/location_picker-view": (context) =>const LocationPickerVC(),
        "/about-org": (context) =>const AboutOrganization(),
      },
    );
  }
}
