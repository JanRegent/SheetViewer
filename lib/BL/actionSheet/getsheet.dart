import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/BL/lib/blglobal.dart';
import 'package:sheetviewer/DL/dlglobals.dart';
import 'package:sheetviewer/DL/get_sheetview.dart';

Future getSheet(String fileId, String sheetName) async {
  if (fileId.toLowerCase().startsWith('https')) {
    fileId = bl.blUti.url2fileid(fileId);
  }
  logi('getSheet()', 'fileId: ' + fileId, '', '');

  String queryString = '';
  // ignore: prefer_typing_uninitialized_variables
  late var response;

  logi('getSheet()', 'baseUrl: ' + dlGlobals.baseUrl, '', '');
  queryString = 'sheetName=$sheetName&action=getSheet&fileId=$fileId';

  logi('getSheet()', 'queryString: ' + queryString, '', '');
  String urlQuery = dlGlobals.baseUrl + '?' + queryString;
  logi('getSheet()', 'urlQuery: ', urlQuery, '');
  try {
    response = await dio.get(urlQuery);
    return response.data;
  } catch (e) {
    localDb.update('getSheet error', '1 response\n' + e.toString());
    logi('getSheet()', 'error ', urlQuery, e.toString());
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
    String urlQuery = dlGlobals.baseUrl + '?' + queryString;
    response = await dio.get(urlQuery);
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
