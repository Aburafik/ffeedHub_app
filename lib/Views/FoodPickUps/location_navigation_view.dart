import 'package:ffeed_hub/Commons/Components/custom_button.dart';
import 'package:ffeed_hub/Commons/color_theme.dart';
import 'package:flutter/material.dart';

class LocationNavigationVC extends StatelessWidget {
  const LocationNavigationVC({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle =
        Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          "Navigation",
          style: textStyle,
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: lightGreyColor,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: MediaQuery.of(context).size.height / 4.5,
              color: whiteColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Head To Pickup Location",
                    style: textStyle.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Kasoa", style: textStyle),
                          const SizedBox(height: 10),
                          Text(
                            "Kasoa",
                            style: textStyle.copyWith(
                                fontWeight: FontWeight.normal, fontSize: 18),
                          ),
                        ],
                      )
                    ],
                  ),
                  CustomButtonComponent(
                    buttonText: "PICKUP COMPLETE",
                    onPressed: () {},
                  ),
                  
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
