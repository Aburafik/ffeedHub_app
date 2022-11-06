import 'package:feather_icons/feather_icons.dart';
import 'package:ffeed_hub/Commons/Components/custom_button.dart';
import 'package:ffeed_hub/Commons/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:im_animations/im_animations.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationNavigationVC extends StatelessWidget {
  LocationNavigationVC({super.key});
  String accessToken =
      "pk.eyJ1IjoiY2l0aXplbnJhZiIsImEiOiJjbDljeXdhNGMwbWFvNDJvZXdxbGhkYXdvIn0.Il91C1CX0J0MVfm17mToiQ";

  String styleID =
      "https://api.mapbox.com/styles/v1/citizenraf/cl9cyzsho005i14pcm270gyxb/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiY2l0aXplbnJhZiIsImEiOiJjbDNnYjV0bDUwNGYzM2NueGluYzNhajVqIn0.XaVDjObnIhrF1ePw5zRTLg";
  static final myLocation = LatLng(5.4980877, -0.4162725);
  static final dropOffLocation = LatLng(4.4980822, -0.4162795);

  String tileID = "cl9cyzsho005i14pcm270gyxb";
  static void navigateTo(double lat, double lng) async {
    var uri = Uri.parse(
        "https://www.google.com/maps/dir/?api=1&origin=5.4980877,-0.4162725&destination=5.5475508,-0.3830625&travelmode=driving&dir_action=navigate");
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch ${uri.toString()}';
    }
  }

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
          FlutterMap(
            options: MapOptions(
              minZoom: 5,
              maxZoom: 18,
              zoom: 13,
              center: myLocation,
              keepAlive: true,
            ),
            children: [
              ////////////////////////////////
              TileLayer(
                urlTemplate: styleID,
                additionalOptions: {
                  'mapStyleId': tileID,
                  'accessToken': accessToken,
                },
              ),
              MarkerLayer(
                markers: [
                  /////////////////////////////
                  Marker(
                    point: myLocation,
                    builder: (context) => Sonar(
                      child: const Icon(
                        FeatherIcons.mapPin,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  ///////////////////////////////
                  Marker(
                    point: dropOffLocation,
                    builder: (context) => HeartBeat(
                      child: const Icon(
                        FeatherIcons.mapPin,
                        color: Colors.red,
                      ),
                    ),
                  ),

                  ////////////////////////////////
                ],
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: MediaQuery.of(context).size.height / 4,
              color: whiteColor,
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Head To Pickup Location",
                      style: textStyle.copyWith(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage("images/oph.jpeg"),
                                  fit: BoxFit.cover),
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
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
                                    fontWeight: FontWeight.normal,
                                    fontSize: 18),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    CustomButtonComponent(
                      buttonText: "PICKUP COMPLETE",
                      onPressed: () {
                        navigateTo(5.4980877, -0.4162725);
                      },
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

////////sk.eyJ1IjoiY2l0aXplbnJhZiIsImEiOiJjbDlraTRpbjAwZ2N6M3dxZ3Y4ZjIxam9pIn0.5MQ1k05pW73-a8cJSgU-Zg
///pk.eyJ1IjoiY2l0aXplbnJhZiIsImEiOiJjbDlraTg1YjMwZnY4M29xZ3VqMGIxZHAyIn0.vpbfwQDgeY8Sqo-QA1FY2Q