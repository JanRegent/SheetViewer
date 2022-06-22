import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';

import 'package:sheetviewer/DL/isardb/sheetview.dart';

import '../BL/bl.dart';

final dio = Dio(
  BaseOptions(
    baseUrl: '',
    sendTimeout: const Duration(seconds: 30).inMilliseconds,
    connectTimeout: const Duration(seconds: 30).inMilliseconds,
    receiveTimeout: const Duration(seconds: 30).inMilliseconds,
    //CORS
    // headers: {
    //   "Access-Control-Allow-Origin": "*",
    //   "Access-Control-Allow-Methods": "*",
    //   "Access-Control-Allow-Headers": "*",
    //   "Access-Control-Max-Age'": "3600",
    //   "Access-Control-Allow-Credentials":
    //       true, // Required for cookies, authorization headers with HTTPS
    // }
  ),
);

ChuckerDioInterceptor interceptor = ChuckerDioInterceptor();
String interceptorAdded = '';

Future<SheetView?> getSheetView(String queryStringKey,
    {required url, bool? getPlan}) async {
  if (interceptorAdded.isEmpty) {
    dio.interceptors.add(interceptor);
    interceptorAdded = 'added';
  }

  SheetView? sheetView;
  String responseErr = '';
  try {
    Response response = await dio.get(url);
    sheetView = SheetView.fromJson(response.data);

    //await SheetRow().sheetRowsFromJson(response.data);
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
  } catch (e) {
    return SheetView()
      ..aStatus = 'error! \n Future<SheetView?> getSheetView(: \n'
      ..aStatus += '\n err: ' + e.toString()
      ..aStatus += '\n\n Response DATA: ' + responseErr;
  }

  if (getPlan == null) {
    await sheetsDb.updateSheetsFromResponse(sheetView!, queryStringKey);
  }

  return sheetView;
}
