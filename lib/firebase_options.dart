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
    apiKey: 'AIzaSyBLICeEF0U8idZr71mKxWszSCYR6e3EVTM',
    appId: '1:167572580881:web:52a5acc00246bd71805fb0',
    messagingSenderId: '167572580881',
    projectId: 'auth-a4c4f',
    authDomain: 'auth-a4c4f.firebaseapp.com',
    storageBucket: 'auth-a4c4f.appspot.com',
    measurementId: 'G-T9XV60LYVP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDB-wtfa2iVsnJfU-dWAmOBKXgkOHwfh08',
    appId: '1:167572580881:android:265b3180212b2ba7805fb0',
    messagingSenderId: '167572580881',
    projectId: 'auth-a4c4f',
    storageBucket: 'auth-a4c4f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBgLez4rxl7L2fBgpjrTiKy1-JzByrwlEU',
    appId: '1:167572580881:ios:8400fa568bd866b0805fb0',
    messagingSenderId: '167572580881',
    projectId: 'auth-a4c4f',
    storageBucket: 'auth-a4c4f.appspot.com',
    iosBundleId: 'com.example.loginReg',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBgLez4rxl7L2fBgpjrTiKy1-JzByrwlEU',
    appId: '1:167572580881:ios:8400fa568bd866b0805fb0',
    messagingSenderId: '167572580881',
    projectId: 'auth-a4c4f',
    storageBucket: 'auth-a4c4f.appspot.com',
    iosBundleId: 'com.example.loginReg',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBLICeEF0U8idZr71mKxWszSCYR6e3EVTM',
    appId: '1:167572580881:web:42c79da0c2597bd2805fb0',
    messagingSenderId: '167572580881',
    projectId: 'auth-a4c4f',
    authDomain: 'auth-a4c4f.firebaseapp.com',
    storageBucket: 'auth-a4c4f.appspot.com',
    measurementId: 'G-1B3FJGYFR8',
  );
}
