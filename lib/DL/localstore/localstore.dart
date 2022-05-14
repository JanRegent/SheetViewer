// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:async';
import 'dart:convert';
import 'package:localstore/localstore.dart';

class LocalStore {
  final dbName;
  LocalStore(this.dbName);

  late final db;

  Future init() async {
    db = Localstore.instance;
  }

  Future<String> read(String key, String defaultValue) async {
    String docId = await getDocId4read(key);

    if (docId.isEmpty) {
      return defaultValue;
    }
    Map item = await db.collection(dbName).doc(docId).get();

    return item['value'];
  }

  Future readListDynamic(String key, List<dynamic> defaultValue) async {
    String docId = await getDocId4read(key);

    if (docId.isEmpty) {
      return defaultValue;
    }
    Map item = await db.collection(dbName).doc(docId).get();

    return item['value'];
  }

  Future<String> readString(String sheetName, String fileId, String varName,
      String defaultValue) async {
    return await read(varNameKey(sheetName, fileId, varName), defaultValue);
  }

  Future readMap(
      String sheetName, String fileId, String varName, Map defaultValue) async {
    String value =
        await readString(sheetName, fileId, varName, jsonEncode(defaultValue));
    return jsonDecode(value);
  }

  Future<List<String>> readList(String sheetName, String fileId, String varName,
      List<String> defaultValue) async {
    String value = await readString(
        sheetName, fileId, varName, defaultValue.join('__|__'));
    return value.split('__|__');
  }

  String varNameKey(String sheetName, String fileId, String varName) {
    return 'sheetName: ${sheetName}__||__var:${varName}__|__$fileId';
  }

  //-------------------------------------------------------------------update
  //----string
  Future updateStringSheet(
      String sheetName, String fileId, String varName, String value) async {
    await updateString(varNameKey(sheetName, fileId, varName), value);
  }

  Future updateString(String key, String value) async {
    String docId = await getDocId(key);
    await db.collection(dbName).doc(docId).set({'key': key, 'value': value});
  }

  //----Map
  Future updateMap(String key, Map value) async {
    String docId = await getDocId(key);
    await db.collection(dbName).doc(docId).set({'key': key, 'value': value});
  }

  //----List<string>
  Future updateListSring(String key, List<String> value) async {
    String docId = await getDocId(key);
    await db.collection(dbName).doc(docId).set({'key': key, 'value': value});
  }

  Future updateListStringSheet(String sheetName, String fileId, String varName,
      List<String> value) async {
    String key = varNameKey(sheetName, fileId, varName);
    String docId = await getDocId(key);
    await db.collection(dbName).doc(docId).set({'key': key, 'value': value});
  }

  //----List<dynamic>
  Future updateListDynamic(String key, List<dynamic> value) async {
    String docId = await getDocId(key);
    await db.collection(dbName).doc(docId).set({'key': key, 'value': value});
  }

  //-------------------------------------------------------------------delete
  Future delete(int id) async {
    db.collection(dbName).doc(id).delete();
  }

  //------------------------------------------------------------------getDoc key
  Future<String> getDocId(String key) async {
    final items = await db.collection(dbName).get();
    String docId = '';
    try {
      for (String keyDb in items.keys) {
        Map row = items[keyDb];
        if (row['key'] == key) {
          docId = keyDb;
          break;
        }
      }
    } catch (_) {}

    if (docId.isEmpty) {
      docId = db.collection(dbName).doc().id;
    }
    return docId;
  }

  Future<String> getDocId4read(String key) async {
    final items = await db.collection(dbName).get();
    String docId = '';
    try {
      for (String keyDb in items.keys) {
        Map row = items[keyDb];
        if (row['key'] == key) {
          docId = keyDb;
          break;
        }
      }
    } catch (_) {}

    return docId;
  }
}
