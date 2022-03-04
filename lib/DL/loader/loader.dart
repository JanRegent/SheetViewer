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
  // dio.interceptors.add(PrettyDioLogger());
  // dio.interceptors.add(PrettyDioLogger(
  //     requestHeader: true,
  //     requestBody: true,
  //     responseBody: true,
  //     responseHeader: false,
  //     error: true,
  //     compact: true,
  //     maxWidth: 90));

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

Future<SheetConfig> getSheetConfig(String fileId, String sheetName) async {
  try {
    String queryString =
        'sheetName=$sheetName&action=getSheetConfig&fileId=$fileId';
    // String jsonString = await readString(queryString);
    // if (jsonString == 'null') jsonString = '';
    // if (jsonString.isNotEmpty) {
    //   return SheetConfig.fromJson(json.decode(jsonString));
    // }
    String urlQuery = bl.blGlobal.contentServiceUrl + '?' + queryString;

    var response = await Dio().get(urlQuery);
    SheetConfig sheetConfig = SheetConfig.fromJson(response.data);
    updateString(queryString, json.encode(response.data));
    sheetConfigDb.updateConfig(sheetConfig);
    return sheetConfig;
  } catch (e) {
    return SheetConfig();
  }
}

Future<String> getSheetConfigs(Map fileListSheet) async {
  for (var index = 0; index < fileListSheet['rows'].length; index++) {
    String fileId =
        bl.blUti.url2fileid(fileListSheet['rows'][index]['fileUrl']);
    String sheetName = fileListSheet['rows'][index]['sheetName'];
    bl.blGlobal.loadingMessage.value = (index + 1).toString() +
        ' of ' +
        fileListSheet['rows'].length.toString() +
        ' - ' +
        sheetName;

    await getSheetConfig(fileId, sheetName);
  }
  bl.blGlobal.loadingMessage.value = '';
  return 'OK';
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
