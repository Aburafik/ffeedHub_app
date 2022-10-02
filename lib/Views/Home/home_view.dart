import 'package:feather_icons/feather_icons.dart';
import 'package:ffeed_hub/Commons/Components/custom_button.dart';
import 'package:ffeed_hub/Commons/Components/drawer_tile.dart';
import 'package:ffeed_hub/Commons/Components/food_request_card.dart';
import 'package:ffeed_hub/Commons/color_theme.dart';
import 'package:ffeed_hub/Commons/constants.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle appBarTextStyle = Theme.of(context).textTheme.bodyText1!;
    ScrollController scrollController = ScrollController();
    return Scaffold(
      appBar: commonAppBar(appBarTextStyle),
      drawer: const HomeDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
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
                child: Scrollbar(
              controller: scrollController,
              thumbVisibility: true,
              child: ListView.builder(
                controller: scrollController,
                itemCount: 10,
                itemBuilder: (context, index) => const FoodRequestCard(),
              ),
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {
          Navigator.pushNamed(context, "/donate-view");
        },
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
