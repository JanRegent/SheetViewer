part of '../BL/actionSheet/_actionsheet.dart';

Future<SheetView?> sheetViewGetData(
    String fileId, String sheetName, String action) async {
  Map queryMap = await ActionSheet().actionMapFind(fileId, sheetName, action);

  String queryString = queryStringBuild(fileId, sheetName, queryMap);

  SheetView? sheetView;
  try {
    sheetView = await sheetsDb.readSheet(queryString);
    if (sheetView!.aStatus.startsWith('warn: not exists')) {
      await updateSheetToCache(queryString);
      sheetView = await sheetsDb.readSheet(queryString);
    }
  } catch (e) {
    if (kDebugMode) {
      print('----------------------getActionSheet readSheet');
      print(e);
    }
  }
  try {
    SheetViewConfig? sheetViewConfig =
        await sheetViewConfigDb.readSheet(queryString);
    sheetView!.colsHeader = sheetViewConfig!.colsHeader.split('__|__');
    sheetView.sheetViewConfig = sheetViewConfig;
    return sheetView;
  } catch (e) {
    return (SheetView().aStatus = 'getActionSheet() readSheet ' + e.toString())
        as SheetView?;
  }
}

Future updateSheetToCache(String queryString) async {
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
    //List<String> cols = bl.blUti.toListString(response.data['cols']);
    //await sheetsDb.updateSheets(cacheKey, cols, response.data['rows']);
    await sheetsDb.updateSheetsFromResponse(response.data);
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
