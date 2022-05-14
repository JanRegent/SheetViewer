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

  Future<List<dynamic>> readListDynamic(String sheetName, String fileId,
      String varName, List<String> defaultValue) async {
    String value = await readString(
        sheetName, fileId, varName, defaultValue.join('__|__'));
    List<String> list = value.split('__|__');
    List<dynamic> listDynamic = [];
    for (var i = 0; i < list.length; i++) {
      listDynamic.add(json.decode(list[i]));
    }
    return listDynamic;
  }

  String varNameKey(String sheetName, String fileId, String varName) {
    return 'sheetName: ${sheetName}__||__var:${varName}__|__$fileId';
  }

  //-------------------------------------------------------------------update
  Future updateString(
      String sheetName, String fileId, String varName, String value) async {
    await update(varNameKey(sheetName, fileId, varName), value);
  }

  Future updateMap(
      String sheetName, String fileId, String varName, Map value) async {
    await update(varNameKey(sheetName, fileId, varName), jsonEncode(value));
  }

  Future updateList(String sheetName, String fileId, String varName,
      List<String> value) async {
    await update(varNameKey(sheetName, fileId, varName), value.join('__|__'));
  }

  Future updateListDynamic(String sheetName, String fileId, String varName,
      List<dynamic> value) async {
    List<String> encodedList = [];
    for (var i = 0; i < value.length; i++) {
      encodedList.add(json.encode(value[i]));
    }
    await updateList(sheetName, fileId, varName, encodedList);
  }

  Future updateListMapDynamicDynamic(String sheetName, String fileId,
      String varName, Map<dynamic, dynamic> value) async {
    List<String> encodedList = [];
    for (var i = 0; i < value.length; i++) {
      encodedList.add(json.encode(value[i]));
    }
    await updateList(sheetName, fileId, varName, encodedList);
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
