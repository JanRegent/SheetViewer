// ignore_for_file: file_names

import 'package:dio/dio.dart';
import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/BL/lib/blglobal.dart';

Future getSheet(String fileId, String sheetName) async {
  String queryString = '';
  // ignore: prefer_typing_uninitialized_variables
  late var response;

  try {
    queryString = 'sheetName=$sheetName&action=getSheet&fileId=$fileId';
    Map tabsList = await interestStore.readMap(queryString);
    if (tabsList.isNotEmpty) return tabsList;
  } catch (_) {}

  try {
    String urlQuery = bl.blGlobal.contentServiceUrl + '?' + queryString;
    interestStore.updateString('1_getSheet() urlQuery', urlQuery);
    response = await Dio().get(urlQuery);
    interestStore.updateString('2_getSheet() response.data length',
        response.data.toString().length.toString());
  } catch (e) {
    interestStore.updateString('2_getSheet() error response', e.toString());
    return {};
  }

  try {
    interestStore.updateMap(queryString, response.data);
  } catch (e) {
    interestStore.updateString('3_getListSheet() err2update', e.toString());
  }
  return response.data;
}