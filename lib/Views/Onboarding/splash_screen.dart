import 'dart:async';

import 'package:ffeed_hub/Commons/color_theme.dart';
import 'package:ffeed_hub/Services/location_services.dart';
import 'package:flutter/material.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  LocationService locationService = LocationService();

  @override
  void initState() {
    Timer(const Duration(seconds: 3),
        () => Navigator.pushNamed(context, "/onboarding-view"));
    super.initState();
    getUserLocation();
  }

  getUserLocation() {
    locationService.determinePosition(context);
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context)
        .textTheme
        .bodyText1!
        .copyWith(fontSize: 20, color: blackColor);
    return Scaffold(
      backgroundColor: whiteColor,
      body: Center(child: Image.asset("images/logo2.jpg")),
    );
  }
}
