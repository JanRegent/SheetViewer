import 'package:cache_manager/core/delete_cache_service.dart';
import 'package:cache_manager/core/read_cache_service.dart';
import 'package:cache_manager/core/write_cache_service.dart'; //https://pub.dev/packages/cache_manager
import 'package:dio/dio.dart';

import 'package:flutter/services.dart';

late String contentServiceUrl;

Future getContentServiceUrl() async {
  contentServiceUrl = await loadAssetString('contentServiceUrl');
}

Future<String> sheetGet(String fileId, String sheetName) async {
  String key = 'fileid=$fileId&sheetname=$sheetName';

  String jsonString = await readString(key);
  if (jsonString.isNotEmpty) return jsonString;

  try {
    var response = await Dio().get(contentServiceUrl + '?' + key);
    updateString(key, response.data);
    return response.data;
  } catch (e) {
    return '';
  }
}

Future<String> loadAssetString(String varname) async {
  try {
    return await rootBundle.loadString('config/$varname.txt');
  } catch (_) {
    return '';
  }
}

Future<String> getFilelist() async {
  String contentServiceUrl = await loadAssetString('contentServiceUrl');

  String fileId = '1LZlPCCI0TwWutwquZbC8HogIhqNvxqz0AVR1wrgPlis';
  //await loadAssetString('fileId');

  String sheetName = 'fileListProHledace';
  // await loadAssetString('sheetName');
  try {
    String key = 'filelistid=$fileId&sheetname=$sheetName';

    String jsonString = await readString(key);
    if (jsonString.isNotEmpty) return jsonString;

    var response = await Dio().get(contentServiceUrl + '?' + key);
    updateString(key, response.data);
    return response.data;
  } catch (e) {
    return '';
  }
}

//-------------------------------------------------------------------CRUD

Future updateString(String key, String jsonString) async {
  try {
    await WriteCache.setString(key: key, value: jsonString);
    return 'OK';
  } catch (e) {
    //rint(e); //Do something if error occurs
    return '';
  }
}

Future readString(String key) async {
  try {
    String jsonString = await ReadCache.getString(key: key);
    // ignore: unnecessary_null_comparison
    if (jsonString == null) return '';
    return jsonString;
  } catch (e) {
    //rint(e); //Do something if error occurs
    return '';
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
