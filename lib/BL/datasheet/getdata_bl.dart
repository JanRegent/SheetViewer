import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/DL/models/sheet.dart';

import 'package:sheetviewer/BL/lib/blglobal.dart';
import 'package:sheetviewer/DL/models/sheet_config.dart';
import 'datasheet.dart';

Future<DataSheet> readSheetFromCache(
    String key, String fileId, String sheetName, Map queryMap) async {
  DataSheet dataSheet = DataSheet();
  Sheet? sheet = await sheetsDb.readSheet(key);
  dataSheet = DataSheet.fromSheet(sheet!);
  dataSheet.fileId = fileId;
  dataSheet.sheetName = sheetName;
  dataSheet.queryMap = queryMap;
  return dataSheet;
}

Future<DataSheet> getDataSheetBL(
    String fileId, String sheetName, Map queryMap) async {
  String queryString = queryStringBuild(fileId, sheetName, queryMap);

  String cacheKey =
      'sheetName=$sheetName&action=${queryMap['action']}&fileId=$fileId';

  try {
    Sheet? sheet = await sheetsDb.readSheet(cacheKey);
    if (sheet!.cacheKey.isNotEmpty) {
      return readSheetFromCache(cacheKey, fileId, sheetName, queryMap);
    }
  } catch (e) {
    if (kDebugMode) {
      print('----------------------getDataSheetBL readSheet');
      print(e);
    }
  }

  Dio dio = Dio();
  // ignore: prefer_typing_uninitialized_variables
  var response;
  try {
    String urlQuery =
        Uri.encodeFull(bl.blGlobal.contentServiceUrl + '?' + queryString);
    interestStore.updateString('getDataSheetBL() 1 urlQuery', urlQuery);

    response = await dio.get(urlQuery);

    interestStore.updateString(
        'getDataSheetBL() 2 status', response.statusCode.toString());
  } catch (e) {
    interestStore.updateString('getDataSheetBL() 2 request err', e.toString());
  }

  try {
    List<String> cols = bl.blUti.toListString(response.data['cols']);
    await sheetsDb.updateSheets(cacheKey, cols, response.data['rows']);
  } catch (e) {
    if (kDebugMode) {
      print('-------------------------------getDataSheetBL() updateSheets');
      print(e);
    }
  }
  try {
    return readSheetFromCache(cacheKey, fileId, sheetName, queryMap);
  } catch (e) {
    interestStore.updateString(
        'getDataSheetBL() DataSheet.fromJson err', e.toString());
    return DataSheet();
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

Future<Map> getRowsMapFind(
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
