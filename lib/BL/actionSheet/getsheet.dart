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
    String urlQuery =
        await localDb.read('DL-contentServiceUrl', String) + '?' + queryString;
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

  queryString = 'sheetName=$sheetName&action=getrowslast1quote&fileId=$fileId';

  try {
    String urlQuery =
        await localDb.read('DL-contentServiceUrl', String) + '?' + queryString;
    response = await Dio().get(urlQuery);
  } catch (e) {
    return {};
  }

  try {
    localDb.update(queryString, response.data['rows']);
  } catch (e) {
    localDb.update(queryString + 'error', e.toString());
  }
  return response.data;
}
