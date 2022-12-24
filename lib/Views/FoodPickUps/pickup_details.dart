import 'package:feather_icons/feather_icons.dart';
import 'package:ffeed_hub/Commons/Components/custom_button.dart';
import 'package:ffeed_hub/Commons/color_theme.dart';
import 'package:ffeed_hub/Commons/constants.dart';
import 'package:ffeed_hub/Commons/Components/delivery_details_card.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PickUpDetailsVC extends StatefulWidget {
  const PickUpDetailsVC({super.key});

  @override
  State<PickUpDetailsVC> createState() => _PickUpDetailsVCState();
}

class _PickUpDetailsVCState extends State<PickUpDetailsVC> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle =
        Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          "PickUp Details",
          style: textStyle,
        ),
      ),
      body: LayoutBuilder(
        builder: (context, boxConstraints) => ConstrainedBox(
          constraints: BoxConstraints(minHeight: boxConstraints.maxHeight),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 2.5,
                    child: Row(
                      children: [
                        Column(
                          children: [
                            circleDot("1"),
                            const Expanded(
                              child: VerticalDivider(
                                color: primaryColor,
                                thickness: 1,
                              ),
                            ),
                            circleDot("2"),
                          ],
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DeliveryPickUpDetailsCard(
                                pickUpsTitle: "Pick Up",
                                title: "Kumasi",
                                location: "Accra",
                                contact: "0551143980",
                                onGotoLocation: () {
                                  print("Routing to location");
                                },
                                onPhoneCall: () {},
                              ),
                              DeliveryPickUpDetailsCard(
                                pickUpsTitle: "Drop off",
                                title: "Tamale",
                                location: "Cape Coast",
                                contact: "033586776",
                                onGotoLocation: () {
                                  print("Routing to location");
                                },
                                onPhoneCall: () {},
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Food Details",
                        style: textStyle.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: DeliveryDetailsCard(
                          canDelete: false,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CustomButtonComponent(
                      buttonText: "Complete Delivery",
                      onPressed: () {
                        MapUtils.openMap();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  CircleAvatar circleDot(String value) {
    return CircleAvatar(
      backgroundColor: lightGreyColor,
      radius: 15,
      child: Text(
        value,
        style: const TextStyle(fontSize: 10),
      ),
    );
  }
}

class DeliveryPickUpDetailsCard extends StatelessWidget {
  DeliveryPickUpDetailsCard(
      {Key? key,
      this.contact,
      this.location,
      this.title,
      this.imageUrl,
      this.pickUpsTitle,
      this.onGotoLocation,
      this.onPhoneCall})
      : super(key: key);
  String? title;
  String? location;
  String? contact;
  String? imageUrl;
  String? pickUpsTitle;
  Function()? onGotoLocation;
  Function()? onPhoneCall;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: borderRadius2),
      child: SizedBox(
        height: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(pickUpsTitle!),
            ),
            Expanded(
              child: Row(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: borderRadius2,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          title!,
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              FeatherIcons.mapPin,
                              size: 20,
                            ),
                            SizedBox(width: 10),
                            Text(location!),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                actionButton(
                                    icon: FeatherIcons.phoneCall,
                                    onTap: onPhoneCall),
                                const SizedBox(width: 10),
                                Text(contact!),
                              ],
                            ),
                            actionButton(
                                icon: Icons.directions, onTap: onGotoLocation)
                          ],
                        ),
                      ],
                    ),
                  ) 
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  actionButton({IconData? icon, Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        icon,
        size: 20,
      ),
    );
  }
}

class MapUtils {
  MapUtils._();

  static Future<void> openMap() async {
    String googleUrl = 'https://www.google.com/maps/search/?api=1&query=5.498194,-0.4161389';
    if (await canLaunchUrl(Uri.parse(googleUrl))) {
      await launchUrl(Uri.parse(googleUrl));
    } else {
      throw 'Could not open the map.';
    }
  }
}
