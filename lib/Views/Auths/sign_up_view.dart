import 'package:ffeed_hub/Commons/Components/auth_options.dart';
import 'package:ffeed_hub/Commons/Components/screen_description_text.dart';
import 'package:ffeed_hub/Commons/Components/sign_up_component.dart';
import 'package:ffeed_hub/Commons/color_theme.dart';
import 'package:flutter/material.dart';

class SignUpVC extends StatelessWidget {
  const SignUpVC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F4F4),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: IconThemeData(color: lightGreyColor),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            ScreenDescriptionTextComponent(
              title: "Creat account",
              subtitle: "Please enter the following details",
            ),
            const SignUpFormComponent(),
            AuthenticationsOptionsComponents(
              wrapperLeftText: "Already have an account?",
              wrapperRightText: "Login",
              rightWrapperTextOnTap: () => Navigator.pushNamedAndRemoveUntil(
                  context, "/sign-in-view", (route) => false),
            ),
          ],
        ),
      ),
    );
  }
}
