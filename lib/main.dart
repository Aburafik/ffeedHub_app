import 'package:ffeed_hub/Providers/location_provider.dart';
import 'package:ffeed_hub/app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ListenableProvider<LocationProvider>(
        create: (context) => LocationProvider()),
  ], child: const MyApp()));
}
