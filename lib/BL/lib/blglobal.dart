// ignore_for_file: implementation_imports

import 'package:cross_file/cross_file.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/services.dart';

import 'package:sheetviewer/BL/db/localdb.dart';

late LocalDb localDb;

Map<String, dynamic> toMapStringDynamic(Map<dynamic, dynamic> resp) {
  Map<String, dynamic> map = {};
  for (String key in resp.keys) {
    map[key] = resp[key];
  }
  return map;
}

void logi(String key, String value) {
  //debugBox.write(key, value);
}

class BlGlobal {
  String contentServiceUrl = '';
  String contentServiceUrlLastModified = '';
  late ValueNotifier<String> loadingMessage;

  Future init() async {
    //await initiateCache();
    localDb = LocalDb();
    contentServiceUrl = await loadAssetString('contentServiceUrl');
    localDb.update('contentServiceUrl', contentServiceUrl);
    localDb.update('rowsSelectedIndex', 0);

    loadingMessage = ValueNotifier<String>('');
  }

  //-------------------------------------------------------------assets
  Future<String> loadAssetString(String varname) async {
    final file = XFile('config/$varname.txt');
    DateTime lm = await file.lastModified();
    contentServiceUrlLastModified = lm.toIso8601String();

    try {
      return await rootBundle.loadString('config/$varname.txt');
    } catch (_) {
      return '';
    }
  }
}
