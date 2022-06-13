import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/BL/lib/log.dart';

import 'package:sheetviewer/DL/dlglobals.dart';

import 'package:sheetviewer/DL/get_sheetview.dart';
import 'package:sheetviewer/DL/loader/getsheet.dart';

import 'isardb/sheetview.dart';

///
///CORS workarround in flutter_tools
/// 1- Go to flutter\bin\cache and remove a file named: flutter_tools.stamp
///  2- Go to flutter\packages\flutter_tools\lib\src\web and open the file chrome.dart.
///c:\Android\flutter\packages\flutter_tools\lib\src\web\
/// 3- Find '--disable-extensions'
/// 4- Add '--disable-web-security'
///
///--> flutter build web
///Building flutter tool...
///Running pub upgrade...
///
/// e.callback
///
///
///
///
/// C:\Users\janre\AppData\Local\Pub\Cache\bin\fluttercors --disable
/// Patching C:\Android\flutter/packages/flutter_tools/lib/src/web/chrome.dart
///Deleting C:\Android\flutter/bin/cache/flutter_tools.stamp
///CORS checks are now disabled for Flutter's Chrome instance

Future<SheetView?> sheetViewGetData(
    String fileId, String sheetName, String action, String getBatch) async {
  Map queryMap = await actionMapCreate(
    fileId,
    sheetName,
    action,
  );

  String queryStringKey = queryStringKeyBuild(fileId, sheetName, queryMap);

  SheetView? sheetView;
  try {
    sheetView = await sheetsDb.readSheet(queryStringKey);

    if (sheetView!.id >= 1) {
      return sheetView;
    }

    if (getBatch.isEmpty) {
      String queryString = queryStringBuild(fileId, sheetName, queryMap);
      String urlQuery = Uri.encodeFull(dlGlobals.baseUrl + '?' + queryString);
      try {
        sheetView = await getSheetView(queryStringKey, url: urlQuery);
      } catch (_) {
        return sheetView;
      }
    } else {
      interestContr.fetshingRows.value = 'getBatch plan';
      Map getPlanResponse;
      try {
        getPlanResponse = await getSheetPlan(fileId, sheetName);
      } catch (_) {
        return sheetView;
      }
      List<dynamic> getPlan = getPlanResponse['rows'];

      List<List<int>> getPlanInt = [];
      if (getPlan.isNotEmpty) {
        int? rowsCount =
            int.tryParse(getPlan[getPlan.length - 1][1].toString());
        if (rowsCount! > 0) {
          for (var i = 0; i < getPlan.length; i++) {
            int fromNo = int.tryParse(getPlan[i][0].toString()) ?? 0;
            int toNo = int.tryParse(getPlan[i][1].toString()) ?? 0;

            getPlanInt.add([fromNo, toNo]);
          }
        }
      }
      try {
        sheetView = await getPlanParts(fileId, sheetName, getPlanInt);
      } catch (_) {
        return sheetView;
      }
    }
    return sheetView!;
  } catch (e) {
    logi('sheetViewGetData(', 'queryStringKey', 'error', ' e.toString()');
    return (SheetView().aStatus = 'error: \n' + e.toString()) as SheetView;
  }
}

Future<SheetView> getPlanParts(
    String fileId, String sheetName, List<List<int>> getPlan) async {
  interestContr.fetshingRows.value =
      '\n fetch parts: ' + getPlan.length.toString();
  interestContr.fetshingRows.value += '\n part 1: ' + getPlan[0].toString();

  SheetView sheetView = await sheetViewGetPlanPart(
      fileId, sheetName, 'getRowsFromTo', getPlan[0][0], getPlan[0][1]);
  for (var i = 1; i < getPlan.length; i++) {
    interestContr.fetshingRows.value +=
        '\n part ${(i + 1)}: ' + getPlan[i].toString();
    SheetView part = await sheetViewGetPlanPart(
        fileId, sheetName, 'getRowsFromTo', getPlan[i][0], getPlan[i][1]);

    sheetView.rows.addAll(part.rows);
  }
  interestContr.fetshingRows.value = '';
  sheetView.aQuerystringKey = queryStringAll(fileId, sheetName);
  await sheetsDb.updateSheetView(sheetView);
  return sheetView;
}

Future<SheetView> sheetViewGetPlanPart(String fileId, String sheetName,
    String action, int fromNo, int toNo) async {
  Map queryMap = await actionMapCreate(fileId, sheetName, action);
  String queryStringKey = queryStringKeyBuild(fileId, sheetName, queryMap);
  SheetView? sheetView;
  try {
    String queryString = queryStringBuild(fileId, sheetName, queryMap) +
        '&fromNo=' +
        fromNo.toString() +
        '&toNo=' +
        toNo.toString();
    String urlQuery = Uri.encodeFull(dlGlobals.baseUrl + '?' + queryString);

    sheetView =
        await getSheetView(queryStringKey, url: urlQuery, getPlan: true);
    return sheetView!;
  } catch (e) {
    logi('sheetViewGetPlanPart(', 'queryStringKey', 'error', ' e.toString()');
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

String queryStringAll(String fileId, String sheetName) {
  String queryStringKey = 'sheetName=$sheetName';
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
  if (action == 'getRowsFromTo') {
    getRowsMap = {"action": 'getRowsFromTo'};
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
