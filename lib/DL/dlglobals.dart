import 'package:flutter/services.dart';

import 'package:sheetviewer/BL/bl.dart';

DlGlobals dlGlobals = DlGlobals();

class DlGlobals {
  String baseUrl = '';
  Future init() async {
    baseUrl = await loadAssetString('contentServiceUrl');
    await appHome.updateString('DL-contentServiceUrl', baseUrl);
  }
}

//-------------------------------------------------------------assets
Future<String> loadAssetString(String varname) async {
  //final file = XFile('config/$varname.txt');
  //DateTime lm = await file.lastModified();
  //contentServiceUrlLastModified = lm.toIso8601String();

  try {
    return await rootBundle.loadString('config/$varname.txt');
  } catch (_) {
    return '';
  }
}
