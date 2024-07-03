// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBaLeeso5-PRpQBxDam48L1PJ1PnrC1E0c',
    appId: '1:218647353551:web:9b1559e1f3bee8ae343fba',
    messagingSenderId: '218647353551',
    projectId: 'fir-auth-cf8c2',
    authDomain: 'fir-auth-cf8c2.firebaseapp.com',
    storageBucket: 'fir-auth-cf8c2.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB5fO0afaQ64RydmMhqux5oRxIqFkAfQv0',
    appId: '1:218647353551:android:868e285601b344e6343fba',
    messagingSenderId: '218647353551',
    projectId: 'fir-auth-cf8c2',
    storageBucket: 'fir-auth-cf8c2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCV_Jqf5K2CEkUivLPB8lPxPC-3TZ7dR8w',
    appId: '1:218647353551:ios:123b147920fcfdeb343fba',
    messagingSenderId: '218647353551',
    projectId: 'fir-auth-cf8c2',
    storageBucket: 'fir-auth-cf8c2.appspot.com',
    iosBundleId: 'com.example.halalProximity',
  );
}
