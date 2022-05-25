import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_config.dart';

///
///https://console.firebase.google.com/project/sheetviewer-9eb27/firestore/data/~2FcontentSerciceConfig~2FnRFaHloMgDGNf8u50qrd
///
Future fireInit() async {
  await Firebase.initializeApp(options: DefaultFirebaseConfig.platformOptions);
}

Future<DocumentSnapshot<Object?>> getContentServiceCollection(
    String documentId) async {
  await fireInit();
  CollectionReference users =
      FirebaseFirestore.instance.collection('contentSerciceConfig');
  return await users.doc(documentId).get();
}

Future<String> getBaseUrlAtFire() async {
  DocumentSnapshot coll =
      await getContentServiceCollection('nRFaHloMgDGNf8u50qrd');
  return coll['baseUrl'];
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
