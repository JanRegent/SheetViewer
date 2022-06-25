import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'firebase_config.dart';
import '../dlglobals.dart';

///
///https://console.firebase.google.com/project/sheetviewer-9eb27/firestore/data/~2FcontentSerciceConfig~2FnRFaHloMgDGNf8u50qrd
///

Future fireInit() async {
  await Firebase.initializeApp(options: DefaultFirebaseConfig.platformOptions);

  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(minutes: 1),
    minimumFetchInterval: const Duration(hours: 1),
  ));
  await remoteConfig.fetchAndActivate();
}

Future<DocumentSnapshot<Object?>> getContentServiceCollection(
    String documentId) async {
  ;
  CollectionReference users =
      FirebaseFirestore.instance.collection('contentSerciceConfig');
  return await users.doc(documentId).get();
}

Future<String> getBaseUrlAtFire() async {
  DocumentSnapshot coll =
      await getContentServiceCollection('nRFaHloMgDGNf8u50qrd');
  return coll['baseUrl'];
}

Future getKredencAtFire() async {
  DocumentSnapshot coll =
      await getContentServiceCollection('nRFaHloMgDGNf8u50qrd');
  String servKey = coll['service_account'];

  return servKey;
}

Future<String> interestsSheetUrlAtFire() async {
  DocumentSnapshot coll =
      await getContentServiceCollection('nRFaHloMgDGNf8u50qrd');
  return coll['interestsSheetUrl'];
}

Future<String> interestsSheetNameAtFire() async {
  DocumentSnapshot coll =
      await getContentServiceCollection('nRFaHloMgDGNf8u50qrd');
  return coll['interestsSheetName'];
}
