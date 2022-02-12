import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/BL/lib/blglobal.dart';
import 'package:sheetviewer/BL/sheet/filelistsheet.dart';

Future<FileListSheet> getFilelist(String fileId, String sheetName) async {
  try {
    String queryString =
        'sheetName=$sheetName&action=getfilelist&fileId=$fileId';

    String jsonString = await interestStore.readString(queryString);
    if (jsonString != 'null') {
      return FileListSheet.fromJson(jsonDecode(jsonString));
    }
    String urlQuery = bl.blGlobal.contentServiceUrl + '?' + queryString;
    var response = await Dio().get(urlQuery);
    interestStore.updateString(queryString, jsonEncode(response.data));
    FileListSheet fileListSheet = FileListSheet.fromJson(response.data);

    return fileListSheet;
  } catch (e) {
    return FileListSheet();
  }
}

Future<Map> tabsListGet() async {
  String fileId = '1LZlPCCI0TwWutwquZbC8HogIhqNvxqz0AVR1wrgPlis';
  //await loadAssetString('fileId');

  String sheetName = 'tabsList';
  String queryString = '';
  // ignore: prefer_typing_uninitialized_variables
  late var response;

  try {
    queryString = 'sheetName=$sheetName&action=gettabslist&fileId=$fileId';
    Map tabsList = await interestStore.readMap(queryString);
    if (tabsList.isNotEmpty) return tabsList;
  } catch (_) {}

  try {
    String urlQuery = bl.blGlobal.contentServiceUrl + '?' + queryString;
    interestStore.updateString('1_tabsListGet() urlQuery', urlQuery);
    response = await Dio().get(urlQuery);
    interestStore.updateString('2_tabsListGet() response.data length',
        response.data.toString().length.toString());
  } catch (e) {
    interestStore.updateString('2_tabsListGet() error response', e.toString());
    return {};
  }

  try {
    interestStore.updateMap(queryString, response.data);
  } catch (e) {
    interestStore.updateString('1_tabsListGet() 4err2update', e.toString());
  }
  return response.data;
}
