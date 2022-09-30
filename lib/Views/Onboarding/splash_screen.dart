import 'dart:async';

import 'package:ffeed_hub/Commons/color_theme.dart';
import 'package:flutter/material.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    Timer(Duration(seconds: 3),
        () => Navigator.pushNamed(context, "/onboarding-view"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context)
        .textTheme
        .bodyText1!
        .copyWith(fontSize: 20, color: blackColor);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.handshake,
              size: 50,
            ),
            RichText(
                text: TextSpan(text: "fFeed", style: textStyle, children: [
              TextSpan(
                  text: "Hub",
                  style: textStyle.copyWith(
                      color: greenColor, fontWeight: FontWeight.bold))
            ]))
          ],
        ),
      ),
    );
  }
}
