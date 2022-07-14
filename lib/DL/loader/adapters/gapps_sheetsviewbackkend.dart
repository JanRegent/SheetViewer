import 'package:dio/dio.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/BL/lib/log.dart';

Future getSheetRowsUpdates(List<dynamic> interestFilelist) async {
  List<Map> updatList = [];

  for (var i = 0; i < interestFilelist.length; i++) {
    String fileId = bl.blUti.url2fileid(interestFilelist[i]['fileUrl']);
    String sheetName = interestFilelist[i]['sheetName'];
    int rowsCount = await sheetRowsDb.rowsCount(fileId, sheetName);
    updatList.add(
        {'fileId': fileId, 'sheetName': sheetName, 'rowsCount': rowsCount});
  }
  var sheetRowsUpdatelist = await postUpdatedList(updatList);
  logi('gapps_sheetsviewbackkend.dart', 'getSheetRowsUpdates', 'response.data',
      sheetRowsUpdatelist.toString());
  List<dynamic> sheetRows = sheetRowsUpdatelist['sheetRows'];
  print(sheetRows);
  for (var i = 0; i < sheetRows.length; i++) {
    if (sheetRows[i]['row'] == null) continue;
    print('------------------------------');
    print(sheetRows[i].toString());
  }
  return 'OK';
}

Future postUpdatedList(List<Map> interestUpdatelist) async {
  Dio dio = Dio();
  dio.interceptors.add(PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
    compact: false,
  ));
//   dio.head('Access-Control-Allow-Origin', "*");
// add_header Access-Control-Allow-Methods "GET, HEAD";
  dio.options.connectTimeout = 3000;
  try {
    String baseUrl =
        'https://script.google.com/macros/s/AKfycbyq642E2098jCaLIFwVqF3mz6GyZeW8YLSdsQzRmf-Mcu8BUvbqA8rvDi6G7_5E5lZ6/exec';
    dio.options.baseUrl = baseUrl;
    dio.options.headers.addAll({
      'content-type': 'application/json',
      'Access-Control-Allow-Origin': '*',
      "Access-Control-Allow-Methods": "POST, OPTIONS, GET"
    });
    var formData = {
      'action': 'updateList',
      'updateList': interestUpdatelist,
    };
    var response = await dio.post('', data: formData);
    return response.data;
  } catch (e) {
    //rint(e);
  }
  return '';
}
