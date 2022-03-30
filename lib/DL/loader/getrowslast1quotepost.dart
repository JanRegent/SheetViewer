import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:sheetviewer/BL/bl.dart';

Future getRowsLast1post(String fileId, String sheetName) async {
  if (fileId.toLowerCase().startsWith('https')) {
    fileId = bl.blUti.url2fileid(fileId);
  }
  var dio = Dio();
  dio.options.baseUrl = bl.blGlobal.contentServiceUrl;
  var formData = FormData.fromMap({
    'action': 'getRowsLast1',
    'fileId': fileId,
    'sheetName': sheetName,
  });
  var response = await dio.post('', data: formData);

  if (kDebugMode) {
    print(response.data);
  }
}
