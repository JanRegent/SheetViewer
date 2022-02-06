import 'dart:convert';

import 'package:cache_manager/core/delete_cache_service.dart';
import 'package:cache_manager/core/read_cache_service.dart';
import 'package:cache_manager/core/write_cache_service.dart';
//https://pub.dev/packages/cache_manager
import 'package:dio/dio.dart';

import 'package:flutter/services.dart';
import 'package:sheetviewer/BL/bl.dart';
//import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:sheetviewer/BL/sheet/datasheet.dart';
import 'package:sheetviewer/BL/sheet/filelistsheet.dart';
import 'package:sheetviewer/BL/sheet/sheet_config.dart';

Future<DataSheet> getEndpoint(String serviceQueryString) async {
  String queryString =
      serviceQueryString.substring(bl.blGlobal.contentServiceUrl.length);

  String jsonString = await readString(queryString);
  if (jsonString != 'null') {
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
        Uri.encodeFull(bl.blGlobal.contentServiceUrl + queryString);
    var response = await dio.get(urlQuery);
    DataSheet dataSheet = DataSheet.fromJson(response.data);

    updateString(queryString, json.encode(response.data));
    return dataSheet;
  } catch (e) {
    return DataSheet();
  }
}

Future<DataSheet> getRowsLast(String fileId, String sheetName) async {
  String key = 'sheetName=$sheetName&fileId=$fileId';

  String jsonString = await readString(key);
  if (jsonString != 'null') {
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
    String urlQuery = Uri.encodeFull(bl.blGlobal.contentServiceUrl +
        '?action=getRowsLast&rowsCount=10&' +
        key);
    //rint(urlQuery);
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

Future<SheetConfig> getSheetConfig(String fileId, String sheetName) async {
  try {
    String key = 'fileId=$fileId&sheetName=$sheetName';
    String jsonString = await readString(key + '__sheetConfig__');
    if (jsonString == 'null') jsonString = '';
    if (jsonString.isNotEmpty) {
      return SheetConfig.fromJson(json.decode(jsonString));
    }
    String urlQuery =
        bl.blGlobal.contentServiceUrl + '?action=getSheetConfig&' + key;
    //rint(urlQuery);
    var response = await Dio().get(urlQuery);
    SheetConfig sheetConfig = SheetConfig.fromJson(response.data);
    updateString(key + '__sheetConfig__', json.encode(response.data));

    return sheetConfig;
  } catch (e) {
    return SheetConfig();
  }
}

Future<String> getSheetConfigs(FileListSheet fileListSheet) async {
  for (var index = 0; index < fileListSheet.rows.length; index++) {
    String fileId = bl.blUti.url2fileid(fileListSheet.rows[index]['fileUrl']);
    String sheetName = fileListSheet.rows[index]['sheetName'];
    bl.blGlobal.loadingMessage.value = (index + 1).toString() +
        ' of ' +
        fileListSheet.rows.length.toString() +
        ' - ' +
        sheetName;

    await getSheetConfig(fileId, sheetName);
  }
  bl.blGlobal.loadingMessage.value = '';
  return 'OK';
}

Future<FileListSheet> getFilelist(String fileId, String sheetName) async {
  try {
    String key = 'fileId=$fileId&sheetName=$sheetName';

    //String jsonString = await readString(key);
    //if (jsonString.isNotEmpty) return jsonString;
    String urlQuery =
        bl.blGlobal.contentServiceUrl + '?action=getfilelist&' + key;
    var response = await Dio().get(urlQuery);
    FileListSheet fileListSheet = FileListSheet.fromJson(response.data);
    //updateString(key, response.data);

    return fileListSheet;
  } catch (e) {
    return FileListSheet();
  }
}

Future<String> getTabsList() async {
  String fileId = '1LZlPCCI0TwWutwquZbC8HogIhqNvxqz0AVR1wrgPlis';
  //await loadAssetString('fileId');

  String sheetName = 'tabsList';
  // await loadAssetString('sheetName');
  try {
    String key = 'fileId=$fileId&sheetName=$sheetName';

    String jsonString = await readString(key);
    if (jsonString != 'null') return jsonString;
    String urlQuery =
        bl.blGlobal.contentServiceUrl + '?action=gettabslist&' + key;
    var response = await Dio().get(urlQuery);
    String resp = response.data.toString().replaceFirst('cols:', '"cols":');

    resp = resp.replaceFirst('rows: [', '"rows": [');
    updateString(key, resp);
    return resp;
  } catch (e) {
    return '';
  }
}

Future<String> logOn() async {
  try {
    var response =
        await Dio().get(bl.blGlobal.contentServiceUrl + '?action=logOn');
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
    return jsonString;
  } catch (e) {
    //print(e); //Do something if error occurs
    return 'null';
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
