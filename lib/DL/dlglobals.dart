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
  try {
    return await rootBundle.loadString('config/$varname.txt');
  } catch (e) {
    return e.toString();
  }
}
