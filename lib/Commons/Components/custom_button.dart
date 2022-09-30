import 'package:ffeed_hub/Commons/color_theme.dart';
import 'package:flutter/material.dart';

class CustomButtonComponent extends StatelessWidget {
  CustomButtonComponent({
    Key? key,
    this.hasIcon = false,
    this.icon,
    this.buttonText,
    this.iconColor,
    this.onPressed,
  }) : super(key: key);
  bool hasIcon = false;
  final IconData? icon;
  final String? buttonText;
  final Color? iconColor;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(backgroundColor: primaryColor),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Text(
                buttonText!,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: hasIcon ?lightGreyColor : whiteColor,)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
