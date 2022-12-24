import 'package:ffeed_hub/Providers/auth_provider.dart';
import 'package:ffeed_hub/Providers/donate_provider.dart';
import 'package:ffeed_hub/Providers/location_provider.dart';
import 'package:ffeed_hub/app.dart';
import 'package:ffeed_hub/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    ListenableProvider<LocationProvider>(
create: (context) => LocationProvider()),
    ListenableProvider<Authprovider>(create: (context) => Authprovider()),
    ListenableProvider<DonateProvider>(create: (context) => DonateProvider()),
  ], child: const MyApp()));
}
