import 'package:ffeed_hub/Commons/color_theme.dart';
import 'package:ffeed_hub/Commons/constants.dart';
import 'package:flutter/material.dart';
import 'package:location_picker_flutter_map/location_picker_flutter_map.dart';

class LocationPickerVC extends StatelessWidget {
  const LocationPickerVC({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: FlutterLocationPicker(
            initZoom: 11,
            minZoomLevel: 5,
            maxZoomLevel: 16,
            trackMyPosition: true,
            showZoomController: false,
            locationButtonBackgroundColor: primaryColor,
            searchBarBackgroundColor: Colors.white,
            selectLocationButtonStyle:
                TextButton.styleFrom(backgroundColor: primaryColor),
            mapLanguage: 'en',
            onError: (e) => showToast(msg: e.toString()),
            onPicked: (pickedData) {
              print(pickedData.addressData);
              Navigator.pop(context);
            }),
      ),
    );
  }
}
