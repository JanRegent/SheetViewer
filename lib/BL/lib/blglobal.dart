// ignore_for_file: implementation_imports

// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

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

void logi(String key, String value, {String? line2, String? line3}) {
  String log = key + '\n';
  log += '\n' + (line2 ?? '');
  log += '\n' + (line3 ?? '');
  log += '\n' + value;
  window.sessionStorage
      .putIfAbsent(DateTime.now().toIso8601String(), () => log);
}

void logStartLine(String key) {
  window.sessionStorage
      .putIfAbsent(DateTime.now().toIso8601String(), () => '//---$key---\\');
}

void logLine() {
  window.sessionStorage.putIfAbsent(
      DateTime.now().toIso8601String(), () => '\\-----------------//');
}

class BlGlobal {
  String contentServiceUrlLastModified = '';
  late ValueNotifier<String> loadingMessage;

  Future init() async {
    localDb = LocalDb();
    String dlContentServiceUrl = await loadAssetString('contentServiceUrl');
    localDb.update('DL-contentServiceUrl', dlContentServiceUrl);
    localDb.update('rowsSelectedIndex', 0);

    loadingMessage = ValueNotifier<String>('');

    logi('blGlobal()', 'init end');
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
