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
      apiKey: 'AIzaSyCYz7vOpFelNObOz_lrLpFOmcZMbRGD5kM',
      appId: '1:639090914957:web:5cb6a29c688ad00364d4c4',
      messagingSenderId: '639090914957',
      projectId: 'flutter-app-4fa34',
      authDomain: 'flutter-app-4fa34.firebaseapp.com',
      storageBucket: 'flutter-app-4fa34.appspot.com',
      databaseURL: 'https://flutter-app-4fa34-default-rtdb.firebaseio.com/');

  static const FirebaseOptions android = FirebaseOptions(
      apiKey: 'AIzaSyDggbmwCHRM4a8-UilwyC0bNFH2bCtofjE',
      appId: '1:639090914957:android:54b6c8179034c4ea64d4c4',
      messagingSenderId: '639090914957',
      projectId: 'flutter-app-4fa34',
      storageBucket: 'flutter-app-4fa34.appspot.com',
      databaseURL: 'https://flutter-app-4fa34-default-rtdb.firebaseio.com/');

  static const FirebaseOptions ios = FirebaseOptions(
      apiKey: 'AIzaSyBPC921NNVmFA0i-5L0KwKocFC32s37Fr8',
      appId: '1:639090914957:ios:5e7bc15c3eba1bba64d4c4',
      messagingSenderId: '639090914957',
      projectId: 'flutter-app-4fa34',
      storageBucket: 'flutter-app-4fa34.appspot.com',
      iosBundleId: 'com.example.lectureOne',
      databaseURL: 'https://flutter-app-4fa34-default-rtdb.firebaseio.com/');

  static const FirebaseOptions macos = FirebaseOptions(
      apiKey: 'AIzaSyBPC921NNVmFA0i-5L0KwKocFC32s37Fr8',
      appId: '1:639090914957:ios:b9bec3abd970e45364d4c4',
      messagingSenderId: '639090914957',
      projectId: 'flutter-app-4fa34',
      storageBucket: 'flutter-app-4fa34.appspot.com',
      iosBundleId: 'com.example.lectureOne.RunnerTests',
      databaseURL: 'https://flutter-app-4fa34-default-rtdb.firebaseio.com/');
}
