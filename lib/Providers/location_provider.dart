import 'package:flutter/material.dart';

class LocationProvider extends ChangeNotifier {
  Map<String, dynamic>? _getUserLocationCordinates;

  setUserLoactionCordinates({  Map<String, dynamic>? userLocationCordinates}) {
    _getUserLocationCordinates = userLocationCordinates!;

    notifyListeners();
  }

  get getUserLocationCordinates => _getUserLocationCordinates;
}


