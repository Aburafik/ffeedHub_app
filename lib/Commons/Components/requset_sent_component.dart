import 'package:feather_icons/feather_icons.dart';
import 'package:ffeed_hub/Commons/color_theme.dart';
import 'package:flutter/material.dart';

class RequestSuccessMessageComponent extends StatelessWidget {
  const RequestSuccessMessageComponent({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.bodyText1!;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: primaryColor,
              child: Icon(FeatherIcons.check, color: whiteColor, size: 50),
            ),
            const SizedBox(height: 10),
            Text("REQUEST SENT SUCCESSFULLY",
                style: textStyle.copyWith(
                    fontSize: 20, fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                "A volunteer will be assigned to pickup\n the order",
                style: textStyle,
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              "You have ssaved Hungary souls today",
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}