import 'package:ffeed_hub/Commons/Components/auth_options.dart';
import 'package:ffeed_hub/Commons/Components/screen_description_text.dart';
import 'package:ffeed_hub/Commons/Components/sign_in_component.dart';
import 'package:flutter/material.dart';

class SignInVC extends StatelessWidget {
  const SignInVC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F4F4),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height/4),
            ScreenDescriptionTextComponent(
              title: "Welcome Back",
              subtitle: "Please login to continue",
            ),
            const SignInFormComponent(),
            AuthenticationsOptionsComponents(
              wrapperLeftText: "Not a member?",
              wrapperRightText: "Create account",
              rightWrapperTextOnTap: () => Navigator.pushNamed(
                context,
                "/sign-up",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
