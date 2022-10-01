 import 'package:feather_icons/feather_icons.dart';
import 'package:ffeed_hub/Commons/color_theme.dart';
import 'package:flutter/material.dart';

class FoodRequestCard extends StatelessWidget {
  const FoodRequestCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: yellowColor,
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 3,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 25,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Cape Deaf",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 20),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration:  const BoxDecoration(
                    image: DecorationImage(image:AssetImage("images/oph.jpeg"),
                    fit: BoxFit.contain
                     ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Meal for 25 required"),
                  Row(
                    children: const [
                      Icon(
                        FeatherIcons.mapPin,
                        size: 20,
                        color: blackColor,
                      ),
                      Text("20km")
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}