import 'dart:convert';

import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';

import 'package:flutter/foundation.dart';
import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/BL/lib/blglobal.dart';
import 'package:sheetviewer/DL/models/zsheetconfig.dart';
import 'package:sheetviewer/DL/models/sheetviewconfig.dart';

import 'models/sheetview.dart';

Future<SheetView?> sheetViewGetData(
    String fileId, String sheetName, String action, sheetViewConfig) async {
  Map queryMap =
      await actionMapCreate(fileId, sheetName, action, sheetViewConfig);

  String queryStringKey = queryStringKeyBuild(fileId, sheetName, queryMap);

  SheetView? sheetView;
  try {
    sheetView = await sheetsDb.readSheet(queryStringKey);

    if (sheetView!.aStatus.startsWith('warn: not exists')) {
      String queryString = queryStringBuild(fileId, sheetName, queryMap);

      await updateSheetToCache(queryString, queryStringKey);
      sheetView = await sheetsDb.readSheet(queryStringKey);
    }
  } catch (e) {
    if (kDebugMode) {
      print('----------------------getActionSheet readSheet');
      print(e);
    }
  }
  try {
    SheetViewConfig? sheetViewConfig =
        await sheetViewConfigDb.readSheet(queryStringKey);
    sheetView!.colsHeader = sheetViewConfig!.colsHeader.split('__|__');
    sheetView.sheetViewConfig = sheetViewConfig;
    return sheetView;
  } catch (e) {
    return (SheetView().aStatus = 'getActionSheet() readSheet ' + e.toString())
        as SheetView?;
  }
}

final dio = Dio(
  BaseOptions(
    baseUrl: bl.blGlobal.contentServiceUrl,
    sendTimeout: const Duration(seconds: 30).inMilliseconds,
    connectTimeout: const Duration(seconds: 30).inMilliseconds,
    receiveTimeout: const Duration(seconds: 30).inMilliseconds,
  ),
);
ChuckerDioInterceptor interceptor = ChuckerDioInterceptor();
String interceptorAdded = '';

Future updateSheetToCache(
  String queryString,
  String queryStringKey,
) async {
  // ignore: prefer_typing_uninitialized_variables
  var response;
  try {
    String urlQuery =
        Uri.encodeFull(bl.blGlobal.contentServiceUrl + '?' + queryString);
    interestStore.updateString('updateSheetToCache() 1 urlQuery', urlQuery);

    // ignore: unnecessary_null_comparison
    if (interceptorAdded.isEmpty) {
      dio.interceptors.add(interceptor);
      interceptorAdded = 'added';
    }

    response = await dio.get('?' + queryString);

    interestStore.updateString(
        'updateSheetToCache() 2 status', response.statusCode.toString());
  } catch (e) {
    interestStore.updateString(
        'updateSheetToCache() 2 request err', e.toString());
  }

  try {
    //List<String> cols = bl.blUti.toListString(response.data['cols']);
    //await sheetsDb.updateSheets(cacheKey, cols, response.data['rows']);
    await sheetsDb.updateSheetsFromResponse(response.data, queryStringKey);
  } catch (e) {
    if (kDebugMode) {
      print('-------------------------------updateSheetToCache() updateSheets');
      print(e);
    }
  }
}

String queryStringBuild(String fileId, String sheetName, Map getRowsPars) {
  String queryString = 'sheetName=$sheetName';
  for (var key in getRowsPars.keys) {
    queryString += '&$key=' + getRowsPars[key].toString();
  }
  queryString += '&fileId=' + fileId;
  return queryString;
}

String queryStringKeyBuild(String fileId, String sheetName, Map queryPars) {
  String queryStringKey = 'sheetName=$sheetName';
  for (String key in queryPars.keys) {
    if (key == 'action') {
      if (queryPars[key].toString().startsWith('getRows')) {
        queryStringKey += '&$key=' + queryPars[key].toString();
      }
      continue;
    }
    if (key.startsWith('rows')) continue;

    queryStringKey += '&$key=' + queryPars[key].toString();
  }
  queryStringKey += '&fileId=' + fileId;
  return queryStringKey;
}

String printMap(Map row) {
  String str = '';
  for (var entry in row.entries) {
    str += '\n ${entry.key}:  ${entry.value}';
  }
  return str;
}

Future<Map> actionMapCreate(String fileId, String sheetName, String action,
    SheetViewConfig sheetViewConfig) async {
  late Map getRowsMap;
  if (action == "getRowsFirst") {
    String rowsCount = sheetViewConfig.getRowsFirst.isNotEmpty
        ? sheetViewConfig.getRowsFirst
        : '10';
    getRowsMap = {"action": "getRowsFirst", "rowsCount": rowsCount};
  }
  if (action == "getRowsLast") {
    String rowsCount = sheetViewConfig.getRowsLast.isNotEmpty
        ? sheetViewConfig.getRowsLast
        : '10';
    getRowsMap = {"action": "getRowsLast", "rowsCount": rowsCount};
  }

  return getRowsMap;
}

Future<Map> actionMapFind(
    String fileId, String sheetName, String action) async {
  String sheetKey = SheetConfig().getKey(sheetName, fileId);
  SheetConfig? sheetConfig = await sheetConfigDb.readSheet(sheetKey);
  Map getRowsMap = {"action": action, "rowsCount": 10};
  for (var i = 0; i < sheetConfig!.getRows.length; i++) {
    Map map = jsonDecode(sheetConfig.getRows[i]);
    if (map['action'] == action) {
      getRowsMap = map;
      break;
    }
  }
  return getRowsMap;
}

Future<List<SheetViewConfig>> fileListSheet2sheetViewConfigs(
    Map fileListSheet, var queryMap) async {
  List<SheetViewConfig> sheetViewConfigs = [];

  for (var index = 0; index < fileListSheet['rows'].length; index++) {
    String fileId =
        bl.blUti.url2fileid(fileListSheet['rows'][index]['fileUrl']);
    String sheetName = fileListSheet['rows'][index]['sheetName'];
    String aQuerystringKey = queryStringKeyBuild(fileId, sheetName, queryMap);
    SheetViewConfig? sheetViewConfig =
        await sheetViewConfigDb.readSheet(aQuerystringKey);
    sheetViewConfig?.fileListSheetRow = fileListSheet['rows'][index];
    sheetViewConfig?.fileId = fileId;
    sheetViewConfig?.sheetName = sheetName;
    sheetViewConfigs.add(sheetViewConfig!);
  }
  return sheetViewConfigs;
}
