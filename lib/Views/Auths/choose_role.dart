import 'package:feather_icons/feather_icons.dart';
import 'package:ffeed_hub/Commons/Components/screen_description_text.dart';
import 'package:ffeed_hub/Commons/color_theme.dart';
import 'package:flutter/material.dart';

class ChooseRole extends StatelessWidget {
  const ChooseRole({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Register as a..",
            style:
                Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18)),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ScreenDescriptionTextComponent(
              title: "Want to share Food?",
              subtitle: "Choose your role",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UserAuthTypeCard(
                  color: primaryColor,
                  icon: FeatherIcons.users,
                  title: "Donar",
                  subTitle: "Donate your foood\n for needy",
                  onTap: () => Navigator.pushNamed(context, "/sign-up-view"),
                ),
                UserAuthTypeCard(
                  color: greenColor,
                  icon: FeatherIcons.user,
                  title: "Volunteer",
                  subTitle: "Food pickUp and\n Deliver",
                  onTap: () =>
                      Navigator.pushNamed(context, "/register-technician"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
} //"/register-technician"

class UserAuthTypeCard extends StatelessWidget {
  UserAuthTypeCard(
      {Key? key, this.onTap, this.title, this.icon, this.subTitle, this.color})
      : super(key: key);

  final String? title;
  final String? subTitle;

  Function()? onTap;
  IconData? icon;
  Color? color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatar(
              backgroundColor: color,
              radius: 65,
              child: Center(
                child: Text(
                  title!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 18, color: whiteColor),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              subTitle!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(),
            ),
          ],
        ),
      ),
    );
  }
}
