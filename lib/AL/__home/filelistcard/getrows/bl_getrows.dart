import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/BL/lib/blglobal.dart';
import 'package:sheetviewer/BL/sheet/datasheet.dart';
import 'package:sheetviewer/DL/models/sheets.dart';

Future getRowsUpdateMap(String fileId, String sheetName, varName, value) async {
  String key = 'sheetName=$sheetName&vars=getRows&fileId=$fileId';
  Map map = await interestStore.readMap(key);
  map[varName] = value;
  await interestStore.updateMap(key, map);
}

String getRowsReadString(
    String fileId, String sheetName, String varName, String defaultValue) {
  String key = 'sheetName=$sheetName&vars=getRows&fileId=$fileId';
  try {
    Map map = interestStore.readMapNoFuture(key);
    return map[varName];
  } catch (_) {
    getRowsUpdateMap(fileId, sheetName, varName, defaultValue);
    return defaultValue;
  }
}

Future getRowsLastDelete(String fileId, String sheetName) async {
  String key = 'sheetName=$sheetName&action=getRowsLast&fileId=$fileId';
  await interestStore.deleteKey(key);
}

Future<DataSheet> getRowsLast(String fileId, String sheetName) async {
  String key = 'sheetName=$sheetName&action=getRowsLast&fileId=$fileId';
  Sheets? sheet = await sheetsDb.readSheet(key);
  if (kDebugMode) {
    print(sheet?.cols);
    print(sheet?.id);
    print(sheet?.rows[2]);

    var row = jsonDecode(sheet!.rows[2]);

    print(row['Mise']);
  }
  try {
    Map map = await interestStore.readMap(key);
    if (map.isNotEmpty) {
      return DataSheet.fromJson(map);
    }
  } catch (_) {}

  Dio dio = Dio();
  // ignore: prefer_typing_uninitialized_variables
  var response;
  try {
    String rowsCount =
        getRowsReadString(fileId, sheetName, 'lastRowsCount', '10');
    String queryString =
        'sheetName=$sheetName&action=getRowsLast&rowsCount=$rowsCount&fileId=$fileId';

    String urlQuery =
        Uri.encodeFull(bl.blGlobal.contentServiceUrl + '?' + queryString);
    interestStore.updateString('getRowsLast() 1 urlQuery', urlQuery);

    response = await dio.get(urlQuery);

    interestStore.updateString(
        'getRowsLast() 2 status', response.statusCode.toString());
  } catch (e) {
    interestStore.updateString('getRowsLast() 2 request err', e.toString());
  }

  try {
    interestStore.updateMap(key, response.data);
  } catch (e) {
    interestStore.updateString('getRowsLast() updateMap err', e.toString());
    return DataSheet();
  }
  try {
    List<String> cols = bl.blUti.toListString(response.data['cols']);
    List<String> rows = bl.blUti.toListString(response.data['rows']);
    await sheetsDb.updateSheets(key, cols, rows);
  } catch (e) {
    interestStore.updateString('getRowsLast() updateSheets err', e.toString());
    return DataSheet();
  }
  try {
    DataSheet dataSheet = DataSheet.fromJson(response.data);
    return dataSheet;
  } catch (e) {
    interestStore.updateString(
        'getRowsLast() DataSheet.fromJson err', e.toString());
    return DataSheet();
  }
}
