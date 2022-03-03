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

  int keysCount = await sheetsDb.keysCount(key);
  if (keysCount > 0) {
    try {
      Sheets? sheet = await sheetsDb.readSheet(key);

      return DataSheet.fromSheet(sheet!);
    } catch (e) {
      if (kDebugMode) {
        print('----------------------getRowsLast readSheet');
        print(e);
      }
    }
  }

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
    List<String> cols = bl.blUti.toListString(response.data['cols']);
    await sheetsDb.updateSheets(key, cols, response.data['rows']);
  } catch (e) {
    if (kDebugMode) {
      print('-------------------------------getRowsLast() updateSheets');
      print(e);
    }
    return DataSheet();
  }
  try {
    Sheets? sheet = await sheetsDb.readSheet(key);
    return DataSheet.fromSheet(sheet!);
  } catch (e) {
    interestStore.updateString(
        'getRowsLast() DataSheet.fromJson err', e.toString());
    return DataSheet();
  }
}

List<List<String>> listListRows(List<String> cols, List<dynamic> responseRows) {
  List<List<String>> rows = [];
  for (var rowIx = 0; rowIx < responseRows.length; rowIx++) {
    List<String> row = [];
    //var rowJson = jsonDecode(responseRows[rowIx]);
    for (var colIx = 0; colIx < cols.length; colIx++) {
      try {
        //row.add(rowJson[cols[colIx]]);
        row.add(rowIx.toString() + '_' + colIx.toString());
      } catch (e) {
        row.add('');
      }
    }
    rows.add(row);
  }
  return rows;
}
