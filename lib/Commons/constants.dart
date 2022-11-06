import 'package:feather_icons/feather_icons.dart';
import 'package:ffeed_hub/Commons/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';

showToast({String? msg, Color? color}) {
  return Fluttertoast.showToast(
      msg: msg!,
      gravity: ToastGravity.TOP,
      backgroundColor: color ?? Colors.green,
      // textColor: Colors.white,
      fontSize: 16.0);
}

startLoading() {
  return EasyLoading.show(
    // status: "Signing Up...",
    maskType: EasyLoadingMaskType.black,
  );
}

stopLoading() {
  return EasyLoading.dismiss();
}

AppBar commonAppBar(TextStyle appBarTextStyle, Map cordinates) {
  double lat = cordinates['lat'];
  double lng = cordinates['lng'];
  return AppBar(
    centerTitle: false,
    backgroundColor: primaryColor,
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.arrow_drop_down,
                  color: blackColor,
                ),
                Text(
                  "Current location",
                  style: appBarTextStyle,
                ),
                const SizedBox(width: 10),
                const Icon(
                  FeatherIcons.mapPin,
                  color: blackColor,
                  size: 15,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: FutureBuilder<List<Placemark>>(
                  future: placemarkFromCoordinates(lat, lng),
                  builder: (context, snapshot) {
                    final data = snapshot.data ?? [];
                    return Text(data.isEmpty ? 'N/A' : '${data[0].name}',
                        style: appBarTextStyle);
                  }),
            )
          ],
        ),
      )
    ],
  );
}

var borderRadius2 = BorderRadius.circular(10);
