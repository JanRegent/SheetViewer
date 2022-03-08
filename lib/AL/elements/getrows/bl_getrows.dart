import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/BL/lib/blglobal.dart';
import 'package:sheetviewer/BL/datasheet/datasheet.dart';
import 'package:sheetviewer/DL/models/sheet.dart';

String queryStringBuild(String fileId, String sheetName, Map getRowsPars) {
  String queryString = 'sheetName=$sheetName';
  for (var key in getRowsPars.keys) {
    queryString += '&$key=' + getRowsPars[key];
  }
  queryString += '&fileId=' + fileId;
  return queryString;
}

Future<DataSheet> getRows(
    String fileId, String sheetName, Map getRowsPars) async {
  String key =
      'sheetName=$sheetName&action=${getRowsPars['action']}&fileId=$fileId';

  int keysCount = await sheetsDb.keysCount(key);
  if (keysCount > 0) {
    try {
      Sheet? sheet = await sheetsDb.readSheet(key);
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
    String queryString = queryStringBuild(fileId, sheetName, getRowsPars);

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
    Sheet? sheet = await sheetsDb.readSheet(key);
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
