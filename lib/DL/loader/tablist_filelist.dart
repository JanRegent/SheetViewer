import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/BL/lib/blglobal.dart';
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

Future<Map> tabsListGet() async {
  String fileId = '1LZlPCCI0TwWutwquZbC8HogIhqNvxqz0AVR1wrgPlis';
  //await loadAssetString('fileId');

  String sheetName = 'tabsList';
  String queryString = '';
  // ignore: prefer_typing_uninitialized_variables
  late var response;

  try {
    queryString = 'sheetName=$sheetName&action=gettabslist&fileId=$fileId';
    interestBox.write('1_tabsListGet() 1queryString', queryString);
    Map tabsList = await readMap(queryString);
    if (tabsList.isNotEmpty) return tabsList;
  } catch (_) {}

  try {
    String urlQuery = bl.blGlobal.contentServiceUrl + '?' + queryString;
    interestBox.write('1_tabsListGet() 2urlQuery', urlQuery);
    response = await Dio().get(urlQuery);
    interestBox.write(
        '1_tabsListGet() 3response.data', response.data.toString());
  } catch (e) {
    interestBox.write('1_tabsListGet() 3err1request', e.toString());
    return {};
  }

  try {
    updateMap(queryString, response.data);
  } catch (e) {
    interestBox.write('1_tabsListGet() 4err2update', e.toString());
  }
  return response.data;
}
