import 'package:flutter/foundation.dart';
import 'package:sheetviewer/BL/bl.dart';

import 'package:sheetviewer/DL/dlglobals.dart';

import 'package:sheetviewer/DL/get_sheetview.dart';

import 'isardb/sheetview.dart';

///
///CORS workarround in flutter_tools
/// 1- Go to flutter\bin\cache and remove a file named: flutter_tools.stamp
///  2- Go to flutter\packages\flutter_tools\lib\src\web and open the file chrome.dart.
///c:\Android\flutter\packages\flutter_tools\lib\src\web\
/// 3- Find '--disable-extensions'
/// 4- Add '--disable-web-security'
///
///--> build
///Building flutter tool...
///Running pub upgrade...
///
/// e.callback

Future<SheetView> sheetViewGetData(
    String fileId, String sheetName, String action) async {
  Map queryMap = await actionMapCreate(fileId, sheetName, action);

  String queryStringKey = queryStringKeyBuild(fileId, sheetName, queryMap);
  SheetView? sheetView;
  try {
    sheetView = await sheetsDb.readSheet(queryStringKey);

    if (sheetView!.id >= 1) {
      return sheetView;
    }

    String queryString = queryStringBuild(fileId, sheetName, queryMap);
    String urlQuery = Uri.encodeFull(dlGlobals.baseUrl + '?' + queryString);

    sheetView = await getSheetView(queryStringKey, url: urlQuery);
    return sheetView!;
  } catch (e) {
    if (kDebugMode) {
      print('----------------------getActionSheet readSheet');
      print(e);
    }
    return (SheetView().aStatus = 'error: \n' + e.toString()) as SheetView;
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

Future<Map> actionMapCreate(
    String fileId, String sheetName, String action) async {
  late Map getRowsMap;

  if (action == "getRowsFirst") {
    getRowsMap = {"action": "getRowsFirst", "rowsCount": '10'};
  }
  if (action == "getRowsLast") {
    getRowsMap = {"action": "getRowsLast", "rowsCount": '10'};
  }
  if (action == "getSheet") {
    getRowsMap = {"action": "getSheet"};
  }
  return getRowsMap;
}

Future<Map> actionMapFind(
    String fileId, String sheetName, String action) async {
  // String sheetKey = SheetConfig().getKey(sheetName, fileId);
  // SheetViewConfig? sheetConfig = await sheetConfigDb.readSheet(sheetKey);
  Map getRowsMap = {"action": action, "rowsCount": 10};
  // for (var i = 0; i < sheetConfig!.getRows.length; i++) {
  //   Map map = jsonDecode(sheetConfig.getRows[i]);
  //   if (map['action'] == action) {
  //     getRowsMap = map;
  //     break;
  //   }
  // }
  return getRowsMap;
}
