import 'package:dio/dio.dart';
import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/BL/lib/blglobal.dart';

Future<Map> filelistGet(String fileId, String sheetName) async {
  try {
    String queryString =
        'sheetName=$sheetName&action=getfilelist&fileId=$fileId';

    Map map = await interestStore.readMap(queryString);
    if (map.isNotEmpty) {
      return map;
    }
    String urlQuery = bl.blGlobal.contentServiceUrl + '?' + queryString;
    var response = await Dio().get(urlQuery);
    interestStore.updateMap(queryString, response.data);

    return response.data;
  } catch (e) {
    interestStore.updateString('filelistGet() error response', e.toString());
    return {};
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
