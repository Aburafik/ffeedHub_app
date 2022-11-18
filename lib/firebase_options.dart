// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBNZ0jR2Wfy2ftfhSusabV84PXUi0yN-Kg',
    appId: '1:1005902038759:web:cd290fb69002270dddc442',
    messagingSenderId: '1005902038759',
    projectId: 'feedhub-a141f',
    authDomain: 'feedhub-a141f.firebaseapp.com',
    storageBucket: 'feedhub-a141f.appspot.com',
    measurementId: 'G-D43LPEH8SK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCR8J3y_cZgkN6mk-ljIEkrT-v5WKi9EYs',
    appId: '1:1005902038759:android:e840bd323f8f8ad3ddc442',
    messagingSenderId: '1005902038759',
    projectId: 'feedhub-a141f',
    storageBucket: 'feedhub-a141f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBRHiOkPubduoTef4VUPGsVviEa1N8WIYo',
    appId: '1:1005902038759:ios:93e3f97eb766604dddc442',
    messagingSenderId: '1005902038759',
    projectId: 'feedhub-a141f',
    storageBucket: 'feedhub-a141f.appspot.com',
    iosClientId: '1005902038759-2nru32c9og51efj5fbpoaihredcn9gc1.apps.googleusercontent.com',
    iosBundleId: 'com.example.ffeedHub',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBRHiOkPubduoTef4VUPGsVviEa1N8WIYo',
    appId: '1:1005902038759:ios:93e3f97eb766604dddc442',
    messagingSenderId: '1005902038759',
    projectId: 'feedhub-a141f',
    storageBucket: 'feedhub-a141f.appspot.com',
    iosClientId: '1005902038759-2nru32c9og51efj5fbpoaihredcn9gc1.apps.googleusercontent.com',
    iosBundleId: 'com.example.ffeedHub',
  );
}