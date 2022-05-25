import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/BL/lib/log.dart';
import 'package:sheetviewer/DL/dlglobals.dart';
import 'package:sheetviewer/DL/get_sheetview.dart';

Future getSheetUrl(String sheetUrl, String sheetName) async {
  String queryString = '';
  // ignore: prefer_typing_uninitialized_variables
  late var response;

  queryString = 'sheetName=$sheetName&action=getSheet&sheetUrl=$sheetUrl';

  String urlQuery = dlGlobals.baseUrl + '?' + queryString;
  logi('getSheetUrl()', 'urlQuery: ', urlQuery, '');
  try {
    print(urlQuery);

    response = await dio.get(urlQuery);

    if (response.status == 200) {
      return response.data;
    }
    return {'status': response.status};
  } catch (e) {
    print(e);
    print('//////////////////////////');
    logi('getSheetUrl()', 'error ', urlQuery, e.toString());
    return {'error': e};
  }
}

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

Future getSheetPlan(String fileId, String sheetName) async {
  if (fileId.toLowerCase().startsWith('https')) {
    fileId = bl.blUti.url2fileid(fileId);
  }

  String queryString = '';
  // ignore: prefer_typing_uninitialized_variables
  late var response;

  queryString = 'sheetName=$sheetName&action=getSheetPlan&fileId=$fileId';

  String urlQuery = dlGlobals.baseUrl + '?' + queryString;
  logi('getSheetPlan()', 'urlQuery: ', urlQuery, '');
  try {
    response = await dio.get(urlQuery);

    return response.data;
  } catch (e) {
    logi('getSheetPlan()', 'error ', urlQuery, e.toString());
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
    logi('getrowslast1quote(', '', 'queryString', queryString);
    await appHome.updateMap('getrowslast1quote(', response.data);
  } catch (e) {
    logi('getrowslast1quote(', 'error', 'queryString: $queryString',
        e.toString());
  }

  return response.data;
}
