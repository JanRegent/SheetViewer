import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:sheetviewer/AL/elementsLib/alib.dart';
import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/BL/lib/log.dart';
import 'package:sheetviewer/BL/isardb/sheetrows.dart';

Future getSheetRowsUpdates(
    List<dynamic> interestFilelist, BuildContext context) async {
  al.infoSnack(context, 'Updating new rest rows - start');
  List<Map> updateList = [];

  for (var i = 0; i < interestFilelist.length; i++) {
    try {
      String fileId = bl.blUti.url2fileid(interestFilelist[i]['fileUrl']);
      String sheetName = interestFilelist[i]['sheetName'];
      int rowsCount = await sheetRowsDb.rowsCount(fileId, sheetName);
      updateList.add(
          {'fileId': fileId, 'sheetName': sheetName, 'rowsCount': rowsCount});
    } catch (_) {
      continue;
    }
  }

  List<dynamic> sheetRows = [];
  try {
    var sheetRowsUpdatelist = await postUpdatedList(updateList);
    logi('gapps_sheetsviewbackkend.dart', 'getSheetRowsUpdates',
        'response.data', sheetRowsUpdatelist.toString());
    sheetRows = sheetRowsUpdatelist['sheetRows'];
  } catch (_) {}
  // ignore: unnecessary_null_comparison
  await updateRestSheetRows(sheetRows);
  al.infoSnack(context, 'Updating new rest rows done');
  return 'OK';
}

Future updateRestSheetRows(List<dynamic> restSheetRows) async {
  for (var i = 0; i < restSheetRows.length; i++) {
    Map row = restSheetRows[i]['row'];
    // ignore: unnecessary_null_comparison
    if (row == null) continue;

    SheetRow sheetRow = SheetRow()
      ..aSheetName = restSheetRows[i]['sheetName']
      ..aRowNo = int.tryParse(row['row_'].toString())!
      ..row = restSheetRows[i]['row'].toString()
      ..zfileId = restSheetRows[i]['fileId'];
    await sheetRowsDb.update(sheetRow);
  }
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
        'https://script.google.com/macros/s/AKfycbwY2YeeD6Ti3hWxjsg4bVj6TlQGodKQp3QEmCnkztwgRdqkLcB2YjU2M99_Xu2kRbYh/exec';
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
    logi('postUpdatedList', 'err', '', e.toString());
  }
  return {};
}
