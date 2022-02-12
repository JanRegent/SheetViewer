import 'dart:convert';

import 'package:cache_manager/core/delete_cache_service.dart';
import 'package:cache_manager/core/read_cache_service.dart';
import 'package:cache_manager/core/write_cache_service.dart';
import 'package:get_storage/get_storage.dart';

import 'package:sheetviewer/BL/lib/blglobal.dart';

GetStorage interestBox = GetStorage('interestBox');

Future updateString(String key, String jsonString) async {
  try {
    await WriteCache.setString(key: key, value: jsonString);
    interestBox.write(key, jsonDecode(jsonString));
    return 'OK';
  } catch (e) {
    //rint(e); //Do something if error occurs
    return '';
  }
}

Future updateMap(String key, Map map) async {
  try {
    interestBox.write(key, map);
    return 'OK';
  } catch (e) {
    logi('updateMap(String ', key);
    logi('updateMap(String ', e.toString());
    return '';
  }
}

Future readString(String key) async {
  try {
    String jsonString = await ReadCache.getString(key: key);
    return jsonString;
  } catch (e) {
    //print(e); //Do something if error occurs
    return 'null';
  }
}

Future<Map> readMap(String key) async {
  try {
    return interestBox.read(key);
  } catch (e) {
    //print(e); //Do something if error occurs
    return {};
  }
}

Future deleteString(String key) async {
  try {
    await DeleteCache.deleteKey(key, key = key);
    return 'OK';
  } catch (e) {
    return '';
  }
}

Future deleteStringFileId(String fileId, String sheetName) async {
  String key = 'fileid=$fileId&sheetname=$sheetName';

  await deleteString(key);
}
