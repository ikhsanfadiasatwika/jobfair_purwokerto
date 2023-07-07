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
    apiKey: 'AIzaSyCpT-LujuH2-KOYrRxmVHyCbZeXj4QAwy4',
    appId: '1:271209128048:web:c7c22b7cf2694a1c0a14b5',
    messagingSenderId: '271209128048',
    projectId: 'job-fair-purwokerto',
    authDomain: 'job-fair-purwokerto.firebaseapp.com',
    storageBucket: 'job-fair-purwokerto.appspot.com',
    measurementId: 'G-4JQR05M7RK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA1GY1wPipbLqgwhieQ24De8h4yjpwOotg',
    appId: '1:271209128048:android:4d84a95d636839ad0a14b5',
    messagingSenderId: '271209128048',
    projectId: 'job-fair-purwokerto',
    storageBucket: 'job-fair-purwokerto.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCqiFyeSOgrGV_y3aSFhQ5bbNQUL0Lu4FQ',
    appId: '1:271209128048:ios:b5320911330683f80a14b5',
    messagingSenderId: '271209128048',
    projectId: 'job-fair-purwokerto',
    storageBucket: 'job-fair-purwokerto.appspot.com',
    iosClientId: '271209128048-4v08n4hldus563ik8qada71dercm3luu.apps.googleusercontent.com',
    iosBundleId: 'com.example.jobfairPurwokerto',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCqiFyeSOgrGV_y3aSFhQ5bbNQUL0Lu4FQ',
    appId: '1:271209128048:ios:60c543120b5b04760a14b5',
    messagingSenderId: '271209128048',
    projectId: 'job-fair-purwokerto',
    storageBucket: 'job-fair-purwokerto.appspot.com',
    iosClientId: '271209128048-tse3sp5jtq86mahfbbqnht2rs0mvfqtb.apps.googleusercontent.com',
    iosBundleId: 'com.example.jobfairPurwokerto.RunnerTests',
  );
}
