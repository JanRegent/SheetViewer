// ignore_for_file: implementation_imports

// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:sheetviewer/BL/bl.dart';

import 'package:sheetviewer/BL/db/localdb.dart';
import 'package:sheetviewer/DL/models/log.dart';

late LocalDb localDb;

Map<String, dynamic> toMapStringDynamic(Map<dynamic, dynamic> resp) {
  Map<String, dynamic> map = {};
  for (String key in resp.keys) {
    map[key] = resp[key];
  }
  return map;
}

void logi(String functionName, String step, description, String message) {
  Log log = Log()
    ..aFunc = functionName
    ..aStep = step
    ..descr = description
    ..mess = message;

  logDb.update(log);
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

    localDb.update('rowsSelectedIndex', 0);

    loadingMessage = ValueNotifier<String>('');

    logi('blGlobal()', 'init end', '', '');
  }
}
