import 'package:flutter/services.dart';
import 'package:sheetviewer/BL/lib/blglobal.dart';

DlGlobals dlGlobals = DlGlobals();

class DlGlobals {
  String baseUrl = '';
  Future init() async {
    String dlContentServiceUrl = await loadAssetString('contentServiceUrl');
    localDb.update('DL-contentServiceUrl', dlContentServiceUrl);
    baseUrl = await localDb.read('DL-contentServiceUrl', String);
    logi('dlGlobals.baseUrl', baseUrl, '', '');
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
