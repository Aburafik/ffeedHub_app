  import 'package:feather_icons/feather_icons.dart';
import 'package:ffeed_hub/Commons/Components/custom_button.dart';
import 'package:ffeed_hub/Commons/Components/drawer_tile.dart';
import 'package:flutter/material.dart';

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
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: CircleAvatar(radius: 60),
            ),
            DrawerTile(
              label: "Profile",
              icon: FeatherIcons.user,
              onTap: () {},
            ),
            DrawerTile(
              label: "My History",
              icon: FeatherIcons.list,
              onTap: () {},
            ),
            DrawerTile(
              label: "Pick Ups",
              icon: FeatherIcons.map,
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/pickup-request-view");
              },
            ),
            DrawerTile(
              label: "General Settings",
              icon: FeatherIcons.settings,
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
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: CustomButtonComponent(
                buttonText: "LogOut",
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
