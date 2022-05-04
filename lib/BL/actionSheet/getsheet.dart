// ignore_for_file: file_names

import 'package:dio/dio.dart';
import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/BL/lib/blglobal.dart';

Future getSheet(String fileId, String sheetName) async {
  if (fileId.toLowerCase().startsWith('https')) {
    fileId = bl.blUti.url2fileid(fileId);
  }
  String queryString = '';
  // ignore: prefer_typing_uninitialized_variables
  late var response;

  try {
    queryString = 'sheetName=$sheetName&action=getSheet&fileId=$fileId';
    String urlQuery = bl.blGlobal.contentServiceUrl + '?' + queryString;
    response = await Dio().get(urlQuery);
    return response.data;
  } catch (e) {
    localDb.update('getSheet error', '1 response\n' + e.toString());
    return {};
  }
}

Future getrowslast1quote(String fileId, String sheetName) async {
  if (fileId.toLowerCase().startsWith('https')) {
    fileId = bl.blUti.url2fileid(fileId);
  }
  String queryString = '';
  // ignore: prefer_typing_uninitialized_variables
  late var response;

  try {
    queryString =
        'sheetName=$sheetName&action=getrowslast1quote&fileId=$fileId';
    Map tabsList = await interestStore.readMap(queryString);
    if (tabsList.isNotEmpty) return tabsList;
  } catch (_) {}

  try {
    String urlQuery = bl.blGlobal.contentServiceUrl + '?' + queryString;
    interestStore.updateString('1_getrowslast1quote() urlQuery', urlQuery);
    response = await Dio().get(urlQuery);
    interestStore.updateString('2_getrowslast1quote() response.data length',
        response.data.toString().length.toString());
  } catch (e) {
    interestStore.updateString(
        '2_getrowslast1quote() error response', e.toString());
    return {};
  }

  try {
    interestStore.updateMap(queryString, response.data);
  } catch (e) {
    interestStore.updateString('3_getListSheet() err2update', e.toString());
  }
  return response.data;
}
