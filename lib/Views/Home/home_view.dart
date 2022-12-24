import 'package:feather_icons/feather_icons.dart';
import 'package:ffeed_hub/Commons/Components/common_drawer.dart';
import 'package:ffeed_hub/Commons/Components/food_request_card.dart';
import 'package:ffeed_hub/Commons/color_theme.dart';
import 'package:ffeed_hub/Commons/constants.dart';
import 'package:ffeed_hub/Providers/location_provider.dart';
import 'package:ffeed_hub/Services/location_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  LocationService locationService = LocationService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

 

  @override
  Widget build(BuildContext context) {
    LocationProvider userlocationCordinates =
        Provider.of<LocationProvider>(context);
    print(userlocationCordinates.getUserLocationCordinates);
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
           const TextField(
              cursorColor: Colors.grey,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                filled: true,
                fillColor: lightGreyColor,
                contentPadding:  EdgeInsets.symmetric(vertical: 5),
                hintText: "Search NGO or Hunger spot",
                suffixIcon:Icon(
                  FeatherIcons.search,
                  color: blackColor,
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    // borderRadius: BorderRadius.circular(10)
                    
                    ),
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
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: primaryColor,
      //   onPressed: () {
      //     Navigator.pushNamed(context, "/donate-view");
      //   },
      //   child: const Icon(Icons.rice_bowl),
      // ),
    );
  }
}
