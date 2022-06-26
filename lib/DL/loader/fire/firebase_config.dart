import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

///
///
///https://console.firebase.google.com/project/sheetviewer-9eb27/firestore/rules
/// allow read, write: if true;
///
/// https://console.firebase.google.com/project/sheetviewer-9eb27/settings/general/web:Y2VmZjYyODItZmM2Ny00ZTI1LWE2M2UtYmEwYzExZDNiOTE3
class DefaultFirebaseConfig {
  static FirebaseOptions get platformOptions {
    if (kIsWeb) {
      // Web

      return const FirebaseOptions(
          apiKey: "AIzaSyAkYa8JWHVofu05cDDphpfo2ctk61p3UMU",
          authDomain: "sheetviewer-9eb27.firebaseapp.com",
          databaseURL:
              "https://sheetviewer-9eb27-default-rtdb.europe-west1.firebasedatabase.app",
          projectId: "sheetviewer-9eb27",
          storageBucket: "sheetviewer-9eb27.appspot.com",
          messagingSenderId: "163665467888",
          appId: "1:163665467888:web:55a510a9dc62c52a0de535",
          measurementId: "G-C49366WV09");
    } else if (Platform.isIOS || Platform.isMacOS) {
      // iOS and MacOS
      return const FirebaseOptions(
        appId: '1:448618578101:ios:2bc5c1fe2ec336f8ac3efc',
        apiKey: 'AIzaSyAHAsf51D0A407EklG1bs-5wA7EbyfNFg0',
        projectId: 'react-native-firebase-testing',
        messagingSenderId: '448618578101',
        iosBundleId: 'io.flutter.plugins.firebase.firestore.example',
        iosClientId:
            '448618578101-ja1be10uicsa2dvss16gh4hkqks0vq61.apps.googleusercontent.com',
        androidClientId:
            '448618578101-2baveavh8bvs2famsa5r8t77fe1nrcn6.apps.googleusercontent.com',
        storageBucket: 'react-native-firebase-testing.appspot.com',
        databaseURL: 'https://react-native-firebase-testing.firebaseio.com',
      );
    } else {
      // Android
      return const FirebaseOptions(
        appId: '1:448618578101:android:3ad281c0067ccf97ac3efc',
        apiKey: 'AIzaSyCuu4tbv9CwwTudNOweMNstzZHIDBhgJxA',
        projectId: 'react-native-firebase-testing',
        messagingSenderId: '448618578101',
      );
    }
  }
}
