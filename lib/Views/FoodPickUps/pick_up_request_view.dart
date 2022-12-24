import 'package:feather_icons/feather_icons.dart';
import 'package:ffeed_hub/Commons/Components/common_drawer.dart';
import 'package:ffeed_hub/Commons/Components/food_request_card.dart';
import 'package:ffeed_hub/Commons/color_theme.dart';
import 'package:ffeed_hub/Commons/constants.dart';
import 'package:ffeed_hub/Providers/location_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FoodPickRequestVC extends StatelessWidget {
  const FoodPickRequestVC({super.key});

  @override
  Widget build(BuildContext context) {
    LocationProvider userlocationCordinates =
        Provider.of<LocationProvider>(context);
    TextStyle appBarTextStyle = Theme.of(context).textTheme.bodyText1!;
    ScrollController scrollController = ScrollController();
    return Scaffold(
      appBar: commonAppBar(
          appBarTextStyle, userlocationCordinates.getUserLocationCordinates),
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
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                "Pickup Request",
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
                itemBuilder: (context, index) => const PickUpRequestCard(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
