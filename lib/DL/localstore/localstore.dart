// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:async';
import 'package:localstore/localstore.dart';

class LocalStore {
  final dbName;
  LocalStore(this.dbName);

  late final db;

  Future init() async {
    db = Localstore.instance;
  }

  Future<String> read(String key, String defaultValue) async {
    final items = await db.collection(dbName).get();
    String keyDb2update = '';
    try {
      for (String keyDb in items.keys) {
        Map row = items[keyDb];
        if (row['key'] == key) {
          keyDb2update = keyDb;
          break;
        }
      }
    } catch (_) {}

    if (keyDb2update.isEmpty) {
      keyDb2update = await db.collection(dbName).doc().id;
      db
          .collection(dbName)
          .doc(keyDb2update)
          .set({'key': key, 'value': defaultValue});
      return defaultValue;
    }
    Map item = await db.collection(dbName).doc(keyDb2update).get();

    return item['value'];
  }

  Future<String> readVar(String sheetName, String fileId, String varName,
      String defaultValue) async {
    return await read(varNameKey(sheetName, fileId, varName), defaultValue);
  }

  String varNameKey(String sheetName, String fileId, String varName) {
    return 'sheetName: ${sheetName}__||__var:${varName}__|__$fileId';
  }

  Future updateVar(
      String sheetName, String fileId, String varName, String value) async {
    await update(varNameKey(sheetName, fileId, varName), value);
  }

  Future update(String key, String value) async {
    final items = await db.collection(dbName).get();
    String keyDb2update = '';
    try {
      for (String keyDb in items.keys) {
        Map row = items[keyDb];
        if (row['key'] == key) {
          keyDb2update = keyDb;
          break;
        }
      }
    } catch (_) {}

    if (keyDb2update.isEmpty) {
      keyDb2update = db.collection(dbName).doc().id;
    }
    await db
        .collection(dbName)
        .doc(keyDb2update)
        .set({'key': key, 'value': value});
  }

  Future delete(int id) async {
    db.collection(dbName).doc(id).delete();
  }
}
