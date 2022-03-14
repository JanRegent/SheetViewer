part of '_actionsheet.dart';

Future<ActionSheet> getActionSheet(
    String fileId, String sheetName, String action) async {
  Map queryMap = await ActionSheet().actionMapFind(fileId, sheetName, action);

  String queryString = queryStringBuild(fileId, sheetName, queryMap);

  String cacheKey = 'sheetName=$sheetName&action=$action&fileId=$fileId';

  try {
    Sheet? sheet = await sheetsDb.readSheet(cacheKey);
    if (sheet!.cacheKey.isEmpty) {
      await updateSheetToCache(queryString, cacheKey);
    }
  } catch (e) {
    if (kDebugMode) {
      print('----------------------getActionSheet readSheet');
      print(e);
    }
  }

  try {
    return readSheetFromCache(cacheKey, fileId, sheetName, queryMap);
  } catch (e) {
    interestStore.updateString('getActionSheet() readSheet', e.toString());
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

Future updateSheetToCache(String queryString, String cacheKey) async {
  Dio dio = Dio();
  // ignore: prefer_typing_uninitialized_variables
  var response;
  try {
    String urlQuery =
        Uri.encodeFull(bl.blGlobal.contentServiceUrl + '?' + queryString);
    interestStore.updateString('updateSheetToCache() 1 urlQuery', urlQuery);

    response = await dio.get(urlQuery);

    interestStore.updateString(
        'updateSheetToCache() 2 status', response.statusCode.toString());
  } catch (e) {
    interestStore.updateString(
        'updateSheetToCache() 2 request err', e.toString());
  }

  try {
    List<String> cols = bl.blUti.toListString(response.data['cols']);
    await sheetsDb.updateSheets(cacheKey, cols, response.data['rows']);
  } catch (e) {
    if (kDebugMode) {
      print('-------------------------------updateSheetToCache() updateSheets');
      print(e);
    }
  }
}

String queryStringBuild(String fileId, String sheetName, Map getRowsPars) {
  String queryString = 'sheetName=$sheetName';
  for (var key in getRowsPars.keys) {
    queryString += '&$key=' + getRowsPars[key].toString();
  }
  queryString += '&fileId=' + fileId;
  return queryString;
}
