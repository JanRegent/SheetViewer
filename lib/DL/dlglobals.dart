import 'package:flutter/services.dart';

import 'package:sheetviewer/BL/bl.dart';

import 'package:sheetviewer/DL/loader/fire_reader.dart';

DlGlobals dlGlobals = DlGlobals();

class DlGlobals {
  String baseUrl = '';
  String kredenc = '';
  Future init() async {
    baseUrl = await getBaseUrlAtFire();
    await appHome.updateString('DL-contentServiceUrl', baseUrl);

    kredenc = await getKredencAtFire();
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
