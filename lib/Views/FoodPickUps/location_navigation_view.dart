import 'package:ffeed_hub/Commons/Components/custom_button.dart';
import 'package:ffeed_hub/Commons/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class LocationNavigationVC extends StatelessWidget {
  LocationNavigationVC({super.key});
  String acccresToken =
      "pk.eyJ1IjoiY2l0aXplbnJhZiIsImEiOiJjbDljeXdhNGMwbWFvNDJvZXdxbGhkYXdvIn0.Il91C1CX0J0MVfm17mToiQ";

  String styleID =
      "https://api.mapbox.com/styles/v1/citizenraf/cl9cyzsho005i14pcm270gyxb/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiY2l0aXplbnJhZiIsImEiOiJjbDNnYjV0bDUwNGYzM2NueGluYzNhajVqIn0.XaVDjObnIhrF1ePw5zRTLg";
  static final myLocation = LatLng(5.4980877, -0.4162725);

  // 5.4980877,-0.4162725
  String tileID = "cl9cyzsho005i14pcm270gyxb";
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
      body:

          // Container(
          //   padding: EdgeInsets.all(10),
          //   height: 250,
          //   // color: Colors.red,
          //   width: MediaQuery.of(context).size.width,
          //   child: CustomPaint(
          //     painter: RPSCustomPainter(),
          //     size: Size(600, 600),
          //   ),
          // )

          Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              minZoom: 5,
              maxZoom: 18,
              zoom: 13,
              center: myLocation,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    styleID,
                additionalOptions: {
                  'mapStyleId': tileID,
                  'accessToken': acccresToken,
                },
              )
            ],
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

//  class RPSCustomPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint0 = Paint()
//       ..color = const Color.fromARGB(255, 33, 150, 243)
//       ..style = PaintingStyle.fill
//       ..strokeWidth = 1;

//     Path path0 = Path();
//     path0.moveTo(size.width * 0.0012500, size.height * 0.9975000);
//     path0.lineTo(0, size.height * 0.2525000);
//     path0.quadraticBezierTo(size.width * 0.2334375, size.height * 0.2487500,
//         size.width * 0.3112500, size.height * 0.2475000);
//     path0.cubicTo(
//         size.width * 0.3725750,
//         size.height * 0.2494750,
//         size.width * 0.3686000,
//         size.height * 0.1728000,
//         size.width * 0.3725500,
//         size.height * 0.1285750);
//     path0.cubicTo(
//         size.width * 0.3980750,
//         size.height * 0.0575750,
//         size.width * 0.4039250,
//         size.height * 0.0103250,
//         size.width * 0.4999125,
//         size.height * 0.0122250);
//     path0.cubicTo(
//         size.width * 0.6008875,
//         size.height * 0.0062500,
//         size.width * 0.6054125,
//         size.height * 0.0652000,
//         size.width * 0.6270375,
//         size.height * 0.1318500);
//     path0.cubicTo(
//         size.width * 0.6386250,
//         size.height * 0.1699500,
//         size.width * 0.6270000,
//         size.height * 0.2494000,
//         size.width * 0.6875000,
//         size.height * 0.2450000);
//     path0.quadraticBezierTo(size.width * 0.7650000, size.height * 0.2462500,
//         size.width * 0.9975000, size.height * 0.2500000);
//     path0.lineTo(size.width * 0.9987500, size.height * 0.9975000);
//     path0.lineTo(size.width * 0.0012500, size.height * 0.9975000);
//     path0.close();

//     canvas.drawPath(path0, paint0);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }
