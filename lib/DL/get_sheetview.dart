import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';
import 'package:sheetviewer/DL/models/sheetview.dart';

import '../BL/bl.dart';

final dio = Dio(
  BaseOptions(
    baseUrl: bl.blGlobal.contentServiceUrl,
    sendTimeout: const Duration(seconds: 30).inMilliseconds,
    connectTimeout: const Duration(seconds: 30).inMilliseconds,
    receiveTimeout: const Duration(seconds: 30).inMilliseconds,
  ),
);
ChuckerDioInterceptor interceptor = ChuckerDioInterceptor();
String interceptorAdded = '';

Future<SheetView?> getSheetView(String queryStringKey, {required url}) async {
  if (interceptorAdded.isEmpty) {
    dio.interceptors.add(interceptor);
    interceptorAdded = 'added';
  }

  SheetView? sheetView;
  try {
    Response response = await dio.get(url);
    sheetView = SheetView.fromJson(response.data);
  } on DioError catch (e) {
    // The request was made and the server responded with a status code
    // that falls out of the range of 2xx and is also not 304.
    SheetView sheetView = SheetView();
    if (e.response != null) {
      sheetView.aStatus = 'error!Dio \n STATUS: ${e.response?.statusCode} ';
      sheetView.aStatus += '\n DATA: ' + e.response?.data;
      sheetView.aStatus += '\n HEADERS: ${e.response?.headers}';
    } else {
      // Error due to setting up or sending the request
      sheetView.aStatus = 'error! Response is null \n' + e.message;
    }
  }
  await sheetsDb.updateSheetsFromResponse(sheetView!, queryStringKey);
  return sheetView;
}
