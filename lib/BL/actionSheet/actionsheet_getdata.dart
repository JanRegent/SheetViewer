part of '_actionsheet.dart';

Future<ActionSheet> getActionSheet(
    String fileId, String sheetName, String action) async {
  Map queryMap = await ActionSheet().getRowsMapFind(fileId, sheetName, action);

  String queryString = queryStringBuild(fileId, sheetName, queryMap);

  String cacheKey = 'sheetName=$sheetName&action=$action&fileId=$fileId';

  try {
    Sheet? sheet = await sheetsDb.readSheet(cacheKey);
    if (sheet!.cacheKey.isNotEmpty) {
      return readSheetFromCache(cacheKey, fileId, sheetName, queryMap);
    }
  } catch (e) {
    if (kDebugMode) {
      print('----------------------getDataSheetBL readSheet');
      print(e);
    }
  }

  Dio dio = Dio();
  // ignore: prefer_typing_uninitialized_variables
  var response;
  try {
    String urlQuery =
        Uri.encodeFull(bl.blGlobal.contentServiceUrl + '?' + queryString);
    interestStore.updateString('getDataSheetBL() 1 urlQuery', urlQuery);

    response = await dio.get(urlQuery);

    interestStore.updateString(
        'getDataSheetBL() 2 status', response.statusCode.toString());
  } catch (e) {
    interestStore.updateString('getDataSheetBL() 2 request err', e.toString());
  }

  try {
    List<String> cols = bl.blUti.toListString(response.data['cols']);
    await sheetsDb.updateSheets(cacheKey, cols, response.data['rows']);
  } catch (e) {
    if (kDebugMode) {
      print('-------------------------------getDataSheetBL() updateSheets');
      print(e);
    }
  }
  try {
    return readSheetFromCache(cacheKey, fileId, sheetName, queryMap);
  } catch (e) {
    interestStore.updateString(
        'getDataSheetBL() DataSheet.fromJson err', e.toString());
    return ActionSheet();
  }
}

Future<ActionSheet> readSheetFromCache(
    String key, String fileId, String sheetName, Map queryMap) async {
  ActionSheet dataSheet = ActionSheet();
  Sheet? sheet = await sheetsDb.readSheet(key);
  dataSheet = ActionSheet.fromSheet(sheet!);
  dataSheet.fileId = fileId;
  dataSheet.sheetName = sheetName;
  dataSheet.queryMap = queryMap;
  return dataSheet;
}

String queryStringBuild(String fileId, String sheetName, Map getRowsPars) {
  String queryString = 'sheetName=$sheetName';
  for (var key in getRowsPars.keys) {
    queryString += '&$key=' + getRowsPars[key].toString();
  }
  queryString += '&fileId=' + fileId;
  return queryString;
}
