import 'package:ffeed_hub/Providers/location_provider.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationService {
  Location? location;

  double? lat;
  double? lng;

  Future<Position> determinePosition(BuildContext context) async {
    LocationProvider locationProvider =
        Provider.of<LocationProvider>(context, listen: false);
    final prefs = await SharedPreferences.getInstance();
    bool serviceEnabled;
    LocationPermission permission;
    Position? position;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    position = await Geolocator.getCurrentPosition();

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    print(position.latitude);
    print(position.longitude);
    locationProvider.setUserLoactionCordinates(userLocationCordinates: {
      'lat': position.latitude,
      'lng': position.longitude
    });
    lat = position.latitude;
    lng = position.longitude;
    return await Geolocator.getCurrentPosition();
  }
}
