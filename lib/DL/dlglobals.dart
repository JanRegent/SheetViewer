import 'package:flutter/services.dart';

import 'package:sheetviewer/BL/bl.dart';

import 'package:sheetviewer/DL/loader/fire_reader.dart';

DlGlobals dlGlobals = DlGlobals();

class DlGlobals {
  String baseUrl = '';
  Future init() async {
    //baseUrl = await contentServiceUrl();
    baseUrl = await getBaseUrlAtFire();
    //baseUrl = await loadAssetString('contentServiceUrl');
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
