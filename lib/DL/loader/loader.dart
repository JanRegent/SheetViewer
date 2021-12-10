import 'dart:convert';

import 'package:cache_manager/core/delete_cache_service.dart';
import 'package:cache_manager/core/read_cache_service.dart';
import 'package:cache_manager/core/write_cache_service.dart'; //https://pub.dev/packages/cache_manager
import 'package:dio/dio.dart';

import 'package:flutter/services.dart';
//import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:sheetviewer/BL/sheet/datasheet.dart';
import 'package:sheetviewer/BL/sheet/filelistsheet.dart';

late String contentServiceUrl;

Future getContentServiceUrl() async {
  contentServiceUrl = await loadAssetString('contentServiceUrl');
}

Future getdatasheetRefresh(String fileId, String sheetName) async {
  String key = 'fileid=$fileId&sheetname=$sheetName';
  await deleteString(key);
}

Future<DataSheet> getdatasheet(String fileId, String sheetName) async {
  String key = 'fileid=$fileId&sheetname=$sheetName';

  String jsonString = await readString(key);
  if (jsonString.isNotEmpty) {
    var jsonData = json.decode(jsonString);
    return DataSheet.fromJson(jsonData);
  }
  Dio dio = Dio();
  // dio.interceptors.add(PrettyDioLogger());
  // dio.interceptors.add(PrettyDioLogger(
  //     requestHeader: true,
  //     requestBody: true,
  //     responseBody: true,
  //     responseHeader: false,
  //     error: true,
  //     compact: true,
  //     maxWidth: 90));

  try {
    String urlQuery =
        Uri.encodeFull(contentServiceUrl + '?action=getdatasheet&' + key);

    var response = await dio.get(urlQuery);
    // print(
    //   "${response.statusCode} :  ${response.data}",
    // );
    DataSheet dataSheet = DataSheet.fromJson(response.data);
    updateString(key, json.encode(response.data));
    return dataSheet;
  } catch (e) {
    return DataSheet();
  }
}

Future<FileListSheet> getFilelist(String fileId, String sheetName) async {
  String contentServiceUrl = await loadAssetString('contentServiceUrl');

  try {
    String key = 'filelistid=$fileId&sheetname=$sheetName';

    //String jsonString = await readString(key);
    //if (jsonString.isNotEmpty) return jsonString;
    String urlQuery = contentServiceUrl + '?action=getfilelist&' + key;
    var response = await Dio().get(urlQuery);
    FileListSheet fileListSheet = FileListSheet.fromJson(response.data);
    //updateString(key, response.data);

    return fileListSheet;
  } catch (e) {
    return FileListSheet();
  }
}

Future<String> getTabsList() async {
  String contentServiceUrl = await loadAssetString('contentServiceUrl');

  String fileId = '1LZlPCCI0TwWutwquZbC8HogIhqNvxqz0AVR1wrgPlis';
  //await loadAssetString('fileId');

  String sheetName = 'tabsList';
  // await loadAssetString('sheetName');
  try {
    String key = 'fileid=$fileId&sheetname=$sheetName';

    String jsonString = await readString(key);
    if (jsonString.isNotEmpty) return jsonString;

    var response =
        await Dio().get(contentServiceUrl + '?action=gettabslist&' + key);
    String resp = response.data.toString().replaceFirst('cols:', '"cols":');
    resp = resp.replaceFirst('rows: [', '"rows": [');
    updateString(key, resp);
    return resp;
  } catch (e) {
    return '';
  }
}

Future<String> logOn() async {
  String contentServiceUrl = await loadAssetString('contentServiceUrl');

  try {
    var response = await Dio().get(contentServiceUrl + '?action=logOn');
    String resp = response.data.toString();
    return resp;
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

//-------------------------------------------------------------assets
Future<String> loadAssetString(String varname) async {
  try {
    return await rootBundle.loadString('config/$varname.txt');
  } catch (_) {
    return '';
  }
}
