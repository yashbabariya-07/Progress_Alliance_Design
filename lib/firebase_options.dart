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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyC82UbiORjKawGP4P_y2p0uSxv28bNxbM0',
    appId: '1:313259333539:web:5b0376f57927fbf5572c16',
    messagingSenderId: '313259333539',
    projectId: 'paapp-a918f',
    authDomain: 'paapp-a918f.firebaseapp.com',
    storageBucket: 'paapp-a918f.appspot.com',
    measurementId: 'G-P9EN6DC3V1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAVxNXQceN_ZNr_qdYfEpNU5oiwLqD-_s4',
    appId: '1:313259333539:android:2116817a2310c7fb572c16',
    messagingSenderId: '313259333539',
    projectId: 'paapp-a918f',
    storageBucket: 'paapp-a918f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA6CBgfC0O1gCsTHmmSF5P5fMAG0dtWm3A',
    appId: '1:313259333539:ios:c6b7cec8cfdd57ac572c16',
    messagingSenderId: '313259333539',
    projectId: 'paapp-a918f',
    storageBucket: 'paapp-a918f.appspot.com',
    iosBundleId: 'com.example.progressAlliance',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA6CBgfC0O1gCsTHmmSF5P5fMAG0dtWm3A',
    appId: '1:313259333539:ios:c6b7cec8cfdd57ac572c16',
    messagingSenderId: '313259333539',
    projectId: 'paapp-a918f',
    storageBucket: 'paapp-a918f.appspot.com',
    iosBundleId: 'com.example.progressAlliance',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC82UbiORjKawGP4P_y2p0uSxv28bNxbM0',
    appId: '1:313259333539:web:f3a8c0102c3bf3ec572c16',
    messagingSenderId: '313259333539',
    projectId: 'paapp-a918f',
    authDomain: 'paapp-a918f.firebaseapp.com',
    storageBucket: 'paapp-a918f.appspot.com',
    measurementId: 'G-W35D4EYB3Z',
  );
}
