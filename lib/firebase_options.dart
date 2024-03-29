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
    apiKey: 'AIzaSyBAzxD9sdhJcQjalsMN5Q9-Pz_Bwv3m_iM',
    appId: '1:1025646156849:web:83c54329fa5204c2cf0910',
    messagingSenderId: '1025646156849',
    projectId: 'brainpulse-56c91',
    authDomain: 'brainpulse-56c91.firebaseapp.com',
    storageBucket: 'brainpulse-56c91.appspot.com',
    measurementId: 'G-HXXJJ7TK61',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDEjjnUe76jQvluA7xzmtcDLpgckN2sBpQ',
    appId: '1:1025646156849:android:2dd558ac6ffecf8ccf0910',
    messagingSenderId: '1025646156849',
    projectId: 'brainpulse-56c91',
    storageBucket: 'brainpulse-56c91.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCcyt8boEh1Azn2_lnmo3DpyGYmlfp1Z7w',
    appId: '1:1025646156849:ios:a051415fc5b18f55cf0910',
    messagingSenderId: '1025646156849',
    projectId: 'brainpulse-56c91',
    storageBucket: 'brainpulse-56c91.appspot.com',
    iosBundleId: 'com.example.brainPulse',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCcyt8boEh1Azn2_lnmo3DpyGYmlfp1Z7w',
    appId: '1:1025646156849:ios:93fa1c77e3222179cf0910',
    messagingSenderId: '1025646156849',
    projectId: 'brainpulse-56c91',
    storageBucket: 'brainpulse-56c91.appspot.com',
    iosBundleId: 'com.example.brainPulse.RunnerTests',
  );
}
