import 'dart:convert';

//
import 'package:dio/dio.dart';

import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/BL/sheet/datasheet.dart';
import 'package:sheetviewer/BL/sheet/sheet_config.dart';

import 'local_crud.dart';

Future<DataSheet> getEndpoint(String serviceQueryString) async {
  String queryString =
      serviceQueryString.substring(bl.blGlobal.contentServiceUrl.length);

  String jsonString = await readString(queryString);
  if (jsonString != 'null') {
    var jsonData = json.decode(jsonString);
    return DataSheet.fromJson(jsonData);
  }
  Dio dio = Dio();

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

Future createSheetConfigIfNotExists(String fileId, String sheetName) async {
  SheetConfig sheetConfig = SheetConfig();
  sheetConfig.setKey(sheetName, fileId);
  int sheetKeyExistsId =
      await sheetConfigDb.sheetKeyExists(sheetConfig.sheetKey);
  if (sheetKeyExistsId > -1) return;

  sheetConfig.getRows.add('{"action":"getRowsLast","rowsCount":10}');
  sheetConfig.getRows.add('{"action":"getRowsFirst","rowsCount":10}');
  sheetConfigDb.updateConfig(sheetConfig);
}

Future<SheetConfig> getSheetConfig(String fileId, String sheetName) async {
  try {
    String queryString =
        'sheetName=$sheetName&action=getSheetConfig&fileId=$fileId';

    String urlQuery = bl.blGlobal.contentServiceUrl + '?' + queryString;

    var response = await Dio().get(urlQuery);
    SheetConfig sheetConfig = SheetConfig.fromJson(response.data);
    sheetConfigDb.updateConfig(sheetConfig);
    return sheetConfig;
  } catch (e) {
    return SheetConfig();
  }
}

Future<String> logOn() async {
  try {
    var response =
        await Dio().get(bl.blGlobal.contentServiceUrl + '?action=logon');
    String resp = response.data.toString();
    return resp;
  } catch (e) {
    return '';
  }
}
