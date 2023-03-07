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
    apiKey: 'AIzaSyAegLInUAljuBu-GwZm7nkGrtvOe6GVad8',
    appId: '1:700480415968:web:a448f95a2b2f03327c0885',
    messagingSenderId: '700480415968',
    projectId: 'newfireproject',
    authDomain: 'newfireproject.firebaseapp.com',
    storageBucket: 'newfireproject.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAdPgvFyB_U-RjS57KA4e10oHJW0fupdVk',
    appId: '1:700480415968:android:6c6e29277076e3377c0885',
    messagingSenderId: '700480415968',
    projectId: 'newfireproject',
    storageBucket: 'newfireproject.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB9v0K68j1klEgOwKGv644q79q79cMKDdA',
    appId: '1:700480415968:ios:abe6cfd0f9a748907c0885',
    messagingSenderId: '700480415968',
    projectId: 'newfireproject',
    storageBucket: 'newfireproject.appspot.com',
    iosClientId: '700480415968-i7itsbgsnknnkukcbiblmrf1gtb6vfki.apps.googleusercontent.com',
    iosBundleId: 'com.example.firestorage',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB9v0K68j1klEgOwKGv644q79q79cMKDdA',
    appId: '1:700480415968:ios:abe6cfd0f9a748907c0885',
    messagingSenderId: '700480415968',
    projectId: 'newfireproject',
    storageBucket: 'newfireproject.appspot.com',
    iosClientId: '700480415968-i7itsbgsnknnkukcbiblmrf1gtb6vfki.apps.googleusercontent.com',
    iosBundleId: 'com.example.firestorage',
  );
}
