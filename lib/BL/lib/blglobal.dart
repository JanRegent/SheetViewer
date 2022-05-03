// ignore_for_file: implementation_imports

import 'package:cross_file/cross_file.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sheetviewer/BL/db/localdb.dart';
import 'package:sheetviewer/BL/db/localstore.dart';

GetStorage blGlobalsBox = GetStorage('blGlobalsBox');
GetStorage debugBox = GetStorage('debugBox');

late LocalStore interestStore;

void logi(String key, String value) {
  debugBox.write(key, value);
}

class BlGlobal {
  String contentServiceUrl = '';
  String contentServiceUrlLastModified = '';
  late ValueNotifier<String> loadingMessage;

  Future init() async {
    // blGlobalsStore = LocalStore('blGlobalsStore');
    // await blGlobalsStore.init();
    LocalDb localDb = LocalDb();
    contentServiceUrl = await loadAssetString('contentServiceUrl');
    localDb.update('contentServiceUrl', contentServiceUrl);
    localDb.update('rowsSelectedIndex', 0);

    interestStore = LocalStore('interest1');
    await interestStore.init();

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
