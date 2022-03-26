import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/BL/lib/blglobal.dart';
import 'package:sheetviewer/DL/models/sheetconfig.dart';
import 'package:sheetviewer/DL/models/sheetviewconfig.dart';

import 'models/sheetview.dart';

Future<SheetView?> sheetViewGetData(
    String fileId, String sheetName, String action) async {
  Map queryMap = await actionMapFind(fileId, sheetName, action);

  String queryStringKey = queryStringKeyBuild(fileId, sheetName, queryMap);

  SheetView? sheetView;
  try {
    sheetView = await sheetsDb.readSheet(queryStringKey);
    if (sheetView!.aStatus.startsWith('warn: not exists')) {
      String queryString = queryStringBuild(fileId, sheetName, queryMap);
      await updateSheetToCache(queryString);
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

Future updateSheetToCache(String queryString) async {
  Dio dio = Dio();
  // ignore: prefer_typing_uninitialized_variables
  var response;
  try {
    String urlQuery =
        Uri.encodeFull(bl.blGlobal.contentServiceUrl + '?' + queryString);
    interestStore.updateString('updateSheetToCache() 1 urlQuery', urlQuery);

    response = await dio.get(urlQuery);

    interestStore.updateString(
        'updateSheetToCache() 2 status', response.statusCode.toString());
  } catch (e) {
    interestStore.updateString(
        'updateSheetToCache() 2 request err', e.toString());
  }

  try {
    //List<String> cols = bl.blUti.toListString(response.data['cols']);
    //await sheetsDb.updateSheets(cacheKey, cols, response.data['rows']);
    await sheetsDb.updateSheetsFromResponse(response.data);
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
