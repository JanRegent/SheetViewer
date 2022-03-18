//
import 'package:dio/dio.dart';

import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/DL/models/sheet_config.dart';

Future createSheetConfigIfNotExists(String fileId, String sheetName) async {
  SheetConfig sheetConfig = SheetConfig();
  sheetConfig.setKey(sheetName, fileId);
  int sheetKeyExistsId =
      await sheetConfigDb.sheetKeyExists(sheetConfig.sheetKey);
  if (sheetKeyExistsId > -1) return;

  sheetConfig.getRows.add('{"action":"getRowsLast","rowsCount":10}');
  sheetConfig.getRows.add('{"action":"getRowsFirst","rowsCount":10}');
  sheetConfigDb.updateConfig1(sheetConfig);
}

Future<SheetConfig> getSheetConfig(String fileId, String sheetName) async {
  try {
    String queryString =
        'sheetName=$sheetName&action=getSheetConfig&fileId=$fileId';

    String urlQuery = bl.blGlobal.contentServiceUrl + '?' + queryString;

    var response = await Dio().get(urlQuery);
    SheetConfig sheetConfig = SheetConfig.fromJson(response.data);
    sheetConfig.setKey(sheetName, fileId);
    sheetConfigDb.updateConfig1(sheetConfig);
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
