import 'package:feather_icons/feather_icons.dart';
import 'package:ffeed_hub/Commons/Components/custom_button.dart';
import 'package:ffeed_hub/Commons/Components/food_request_card.dart';
import 'package:ffeed_hub/Commons/color_theme.dart';
import 'package:ffeed_hub/Commons/constants.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle appBarTextStyle = Theme.of(context).textTheme.bodyText1!;
    return Scaffold(
      appBar: commonAppBar(appBarTextStyle),
      drawer: const HomeDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: lightGreyColor,
                contentPadding: const EdgeInsets.symmetric(vertical: 5),
                hintText: "Search NGO or Hunger spot",
                prefixIcon: const Icon(
                  FeatherIcons.search,
                  color: blackColor,
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                "Food Request",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 20, color: blackColor),
              ),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => const FoodRequestCard(),
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {},
        child: const Icon(Icons.rice_bowl),
      ),
    );
  }
}

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: CircleAvatar(radius: 60),
            ),
            DrawerTile(
              label: "Profile",
              icon: FeatherIcons.user,
              onTap: () {},
            ),
            DrawerTile(
              label: "General Settings",
              icon: FeatherIcons.settings,
              onTap: () {},
            ),
             DrawerTile(
              label: "My History",
              icon: FeatherIcons.list,
              onTap: () {},
            ),
      
             DrawerTile(
              label: "Invite Friends",
              icon: FeatherIcons.share2,
              onTap: () {},
            ),
             DrawerTile(
              label: "Help",
              icon: FeatherIcons.helpCircle,
              onTap: () {},
            ),
      
             DrawerTile(
              label: "Privacy policy",
              icon: FeatherIcons.settings,
              onTap: () {},
            ),
             DrawerTile(
              label: "About",
              icon: FeatherIcons.alertCircle,
              onTap: () {},
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              child: CustomButtonComponent(buttonText: "LogOut",onPressed: (){},),
            )
          ],
        ),
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  DrawerTile({Key? key, this.label, this.onTap, this.icon}) : super(key: key);
  String? label;

  IconData? icon;

  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(label!),
          leading: Icon(icon),
          onTap: onTap,
        ),
        Divider(),
      ],
    );
  }
}
