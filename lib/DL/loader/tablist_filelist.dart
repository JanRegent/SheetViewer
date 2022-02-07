import 'package:dio/dio.dart';
import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/BL/sheet/filelistsheet.dart';

import 'local_crud.dart';

Future<FileListSheet> getFilelist(String fileId, String sheetName) async {
  try {
    String key = 'fileId=$fileId&sheetName=$sheetName';

    //String jsonString = await readString(key);
    //if (jsonString.isNotEmpty) return jsonString;
    String urlQuery =
        bl.blGlobal.contentServiceUrl + '?action=getfilelist&' + key;
    var response = await Dio().get(urlQuery);
    FileListSheet fileListSheet = FileListSheet.fromJson(response.data);
    //updateString(key, response.data);

    return fileListSheet;
  } catch (e) {
    return FileListSheet();
  }
}

Future<String> getTabsList() async {
  String fileId = '1LZlPCCI0TwWutwquZbC8HogIhqNvxqz0AVR1wrgPlis';
  //await loadAssetString('fileId');

  String sheetName = 'tabsList';
  // await loadAssetString('sheetName');
  try {
    String key = 'fileId=$fileId&sheetName=$sheetName';

    String jsonString = await readString(key);
    if (jsonString != 'null') return jsonString;
    String urlQuery =
        bl.blGlobal.contentServiceUrl + '?action=gettabslist&' + key;
    var response = await Dio().get(urlQuery);
    String resp = response.data.toString().replaceFirst('cols:', '"cols":');

    resp = resp.replaceFirst('rows: [', '"rows": [');
    updateString(key, resp);
    return resp;
  } catch (e) {
    return '';
  }
}
