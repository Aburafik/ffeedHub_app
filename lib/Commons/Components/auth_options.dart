import 'package:ffeed_hub/Commons/color_theme.dart';
import 'package:flutter/material.dart';

class AuthenticationsOptionsComponents extends StatelessWidget {
  const AuthenticationsOptionsComponents({
    Key? key,
    this.wrapperLeftText,
    this.wrapperRightText,
    this.rightWrapperTextOnTap,
  }) : super(key: key);

  final String? wrapperLeftText;
  final String? wrapperRightText;
  final Function()? rightWrapperTextOnTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          alignment: WrapAlignment.center,
          children: [
            Text(
              wrapperLeftText!,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            InkWell(
              onTap: rightWrapperTextOnTap,
              child: Text(
                wrapperRightText!,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: blueColor),
              ),
            )
          ],
        ),
      ],
    );
  }
}
