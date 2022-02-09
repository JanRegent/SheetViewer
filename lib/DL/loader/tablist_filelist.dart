import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/BL/sheet/filelistsheet.dart';

import 'local_crud.dart';

Future<FileListSheet> getFilelist(String fileId, String sheetName) async {
  try {
    String queryString =
        'sheetName=$sheetName&action=getfilelist&fileId=$fileId';

    String jsonString = await readString(queryString);
    if (jsonString != 'null') {
      return FileListSheet.fromJson(jsonDecode(jsonString));
    }
    String urlQuery = bl.blGlobal.contentServiceUrl + '?' + queryString;
    var response = await Dio().get(urlQuery);
    updateString(queryString, jsonEncode(response.data));
    FileListSheet fileListSheet = FileListSheet.fromJson(response.data);

    return fileListSheet;
  } catch (e) {
    return FileListSheet();
  }
}

Future<String> getTabsList() async {
  String fileId = '1LZlPCCI0TwWutwquZbC8HogIhqNvxqz0AVR1wrgPlis';
  //await loadAssetString('fileId');

  String sheetName = 'tabsList';
  // await loadAssetString('sheetName');
  try {
    String queryString =
        'sheetName=$sheetName&action=gettabslist&fileId=$fileId';

    String jsonString = await readString(queryString);
    if (jsonString != 'null') return jsonString;
    String urlQuery = bl.blGlobal.contentServiceUrl + '?' + queryString;
    var response = await Dio().get(urlQuery);
    String resp = response.data.toString().replaceFirst('cols:', '"cols":');

    resp = resp.replaceFirst('rows: [', '"rows": [');
    updateString(queryString, resp);
    return resp;
  } catch (e) {
    return '';
  }
}
