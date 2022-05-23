import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import 'package:sheetviewer/DL/isardb/sheetview.dart';

import '../BL/bl.dart';

final dio = Dio(
  BaseOptions(
    baseUrl: '',
    sendTimeout: const Duration(seconds: 30).inMilliseconds,
    connectTimeout: const Duration(seconds: 30).inMilliseconds,
    receiveTimeout: const Duration(seconds: 30).inMilliseconds,
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

  if (getPlan == null) {
    await sheetsDb.updateSheetsFromResponse(sheetView!, queryStringKey);
  }

  return sheetView;
}

///CORS
///flutter run -d chrome --web-renderer html
///flutter build web --web-renderer html
///
Future getBaseUrl() async {
  String url =
      'https://github.com/JanRegent/SheetViewer/blob/main/assets/config/contentServiceUrl.txt';

  var response = await http.get(Uri.parse(url));
  print(response.body);
  // try {
  //   Response response = await dio.get(url);
  //   print(response.data);
  // } on DioError catch (e) {
  //   print(e);
  //   // The request was made and the server responded with a status code
  //   // that falls out of the range of 2xx and is also not 304.
  //   SheetView sheetView = SheetView();
  //   if (e.response != null) {
  //     sheetView.aStatus = 'error!Dio \n STATUS: ${e.response?.statusCode} ';
  //     sheetView.aStatus += '\n DATA: ' + e.response?.data;
  //     sheetView.aStatus += '\n HEADERS: ${e.response?.headers}';
  //   } else {
  //     // Error due to setting up or sending the request
  //     sheetView.aStatus = 'error! Response is null \n' + e.message;
  //   }
  // }
}
