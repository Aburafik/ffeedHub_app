import 'package:feather_icons/feather_icons.dart';
import 'package:ffeed_hub/Commons/Components/custom_button.dart';
import 'package:ffeed_hub/Commons/Components/screen_description_text.dart';
import 'package:ffeed_hub/Commons/Components/text_form_field.dart';
import 'package:ffeed_hub/Commons/color_theme.dart';
import 'package:flutter/material.dart';

class ForgotPasswordVC extends StatelessWidget {
  const ForgotPasswordVC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: IconThemeData(color: lightGreyColor),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              FeatherIcons.lock,
              size: 50,
              color: primaryColor,
            ),
            ScreenDescriptionTextComponent(
              title: "Forget password",
              subtitle:
                  "Enter your email address you used to register, to reset your password",
            ),
            CustomTextFormField(
              hintText: "Enter email",
              hasPreffix: true,
              prefixIcon: FeatherIcons.mail,
            ),
            CustomButtonComponent(
              buttonText: "Continue",
            ),
          ],
        ),
      ),
    );
  }
}
