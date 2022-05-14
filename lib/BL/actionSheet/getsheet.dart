import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/BL/lib/blglobal.dart';
import 'package:sheetviewer/DL/dlglobals.dart';
import 'package:sheetviewer/DL/get_sheetview.dart';

Future getSheet(String fileId, String sheetName) async {
  if (fileId.toLowerCase().startsWith('https')) {
    fileId = bl.blUti.url2fileid(fileId);
  }

  String queryString = '';
  // ignore: prefer_typing_uninitialized_variables
  late var response;

  queryString = 'sheetName=$sheetName&action=getSheet&fileId=$fileId';

  String urlQuery = dlGlobals.baseUrl + '?' + queryString;
  logi('getSheet()', 'urlQuery: ', urlQuery, '');
  try {
    response = await dio.get(urlQuery);

    return response.data;
  } catch (e) {
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
    logi('getrowslast1quote', '', 'queryString', queryString);
  } catch (e) {
    logi('getrowslast1quote', 'error', 'queryString: $queryString',
        e.toString());
  }
  return response.data;
}
