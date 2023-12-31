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
    apiKey: 'AIzaSyDp-ded6wHjdjoiLHLFgeyBz6jDVUKQNdw',
    appId: '1:298490344585:web:41927adb2ca8464e3d4258',
    messagingSenderId: '298490344585',
    projectId: 'innoverse-tanmay',
    authDomain: 'innoverse-tanmay.firebaseapp.com',
    storageBucket: 'innoverse-tanmay.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDk1VIYuria8vgOaBh5dB1FofwHZM2dvFg',
    appId: '1:298490344585:android:6e9a1f7478e779543d4258',
    messagingSenderId: '298490344585',
    projectId: 'innoverse-tanmay',
    storageBucket: 'innoverse-tanmay.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDrFxlYsB2DJvcWyGzn2OZGZHEj9MyLLgM',
    appId: '1:298490344585:ios:9b59c5e52c4e81543d4258',
    messagingSenderId: '298490344585',
    projectId: 'innoverse-tanmay',
    storageBucket: 'innoverse-tanmay.appspot.com',
    iosClientId: '298490344585-b1o620rh8etnb4kofe925kl6138nk7f7.apps.googleusercontent.com',
    iosBundleId: 'com.example.innoverse',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDrFxlYsB2DJvcWyGzn2OZGZHEj9MyLLgM',
    appId: '1:298490344585:ios:2045ad5f8510bc813d4258',
    messagingSenderId: '298490344585',
    projectId: 'innoverse-tanmay',
    storageBucket: 'innoverse-tanmay.appspot.com',
    iosClientId: '298490344585-n08p842jlk3jcr1opffgn5rqb835icqm.apps.googleusercontent.com',
    iosBundleId: 'com.example.innoverse.RunnerTests',
  );
}
