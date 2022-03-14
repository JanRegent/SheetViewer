import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:sheetviewer/BL/bl.dart';

import 'package:sheetviewer/DL/models/sheet_config.dart';
import '../../DL/loader/local_crud.dart';
import '_actionsheet.dart';

Future<ActionSheet> getEndpoint(String serviceQueryString) async {
  String queryString =
      serviceQueryString.substring(bl.blGlobal.contentServiceUrl.length);

  String jsonString = await readString(queryString);
  if (jsonString != 'null') {
    var jsonData = json.decode(jsonString);
    return ActionSheet.fromJson(jsonData);
  }
  Dio dio = Dio();

  try {
    String urlQuery =
        Uri.encodeFull(bl.blGlobal.contentServiceUrl + queryString);
    var response = await dio.get(urlQuery);
    ActionSheet dataSheet = ActionSheet.fromJson(response.data);

    updateString(queryString, json.encode(response.data));
    return dataSheet;
  } catch (e) {
    return ActionSheet();
  }
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
