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
    apiKey: 'AIzaSyCedMaM9gs7KQdPjJjgrVIB49iqKuo51YU',
    appId: '1:542880054649:web:852fd5a28d35bf8ae3c3a8',
    messagingSenderId: '542880054649',
    projectId: 'chat-app-6a808',
    authDomain: 'chat-app-6a808.firebaseapp.com',
    storageBucket: 'chat-app-6a808.appspot.com',
    measurementId: 'G-H3P1RYBMG7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA3jeOe5R4GBIQniTIKBuOMazrtAmCVJ-4',
    appId: '1:542880054649:android:a7241e5467e7bdd0e3c3a8',
    messagingSenderId: '542880054649',
    projectId: 'chat-app-6a808',
    storageBucket: 'chat-app-6a808.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCbQS6Jwhj7MJ7yYnPAAKtFmfIdJeCZ0Jw',
    appId: '1:542880054649:ios:c7c3e5000f6bef52e3c3a8',
    messagingSenderId: '542880054649',
    projectId: 'chat-app-6a808',
    storageBucket: 'chat-app-6a808.appspot.com',
    iosBundleId: 'com.example.chatAppFirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCbQS6Jwhj7MJ7yYnPAAKtFmfIdJeCZ0Jw',
    appId: '1:542880054649:ios:6734d7876edbb675e3c3a8',
    messagingSenderId: '542880054649',
    projectId: 'chat-app-6a808',
    storageBucket: 'chat-app-6a808.appspot.com',
    iosBundleId: 'com.example.chatAppFirebase.RunnerTests',
  );
}
