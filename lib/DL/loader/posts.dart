import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:sheetviewer/BL/bl.dart';

Future post1() async {
  var dio = Dio();
  dio.options.baseUrl = bl.blGlobal.contentServiceUrl;
  var formData = FormData.fromMap({
    'name': 'wendux',
    'age': 25,
    // 'file': await MultipartFile.fromFile('./text.txt', filename: 'upload.txt'),
    'files': [
      // await MultipartFile.fromFile('./text1.txt', filename: 'text1.txt'),
      // await MultipartFile.fromFile('./text2.txt', filename: 'text2.txt'),
    ]
  });
  var response = await dio.post('', data: formData);

  if (kDebugMode) {
    print(response.data);
  }
}
