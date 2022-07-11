import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:flutter/foundation.dart';

Future post1() async {
  Dio dio = Dio();
  dio.interceptors.add(PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
    compact: false,
  ));
  dio.options.connectTimeout = 3000;
  try {
    String baseUrl =
        'https://script.google.com/macros/s/AKfycbwXXDCY4yutcKBtH02VUBhfwEBj88LbuI0XxOi_0xl3umqTOJxIfrly8FrzpTIcgqjN/exec';
    dio.options.baseUrl = baseUrl;
    var formData = FormData.fromMap({
      "updateTables": [
        {"id": "1", "fld1": "<<[fld1]>>"},
        {"id": "2", "fld1": "<<[fld1]>>"}
      ]
    });
    var response = await dio.post('', data: formData);

    if (kDebugMode) {
      print(response.data);
    }
  } catch (e) {
    print(e);
  }
}
