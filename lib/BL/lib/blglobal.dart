import 'package:flutter/foundation.dart';
import 'package:sheetviewer/BL/bl.dart';

import 'package:sheetviewer/BL/db/localdb.dart';
import 'package:sheetviewer/DL/isardb/log.dart';

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

void logParagraphStart(String key) {
  Log log = Log()..aFunc = '//------------------$key-------------start\\';
  logDb.update(log);
}

void logParagraphEnd(String key) {
  Log log = Log()..aFunc = '\\------------------$key---------------end//';
  logDb.update(log);
}

void logLine() {
  Log log = Log()..aFunc = '||-----------------||';
  logDb.update(log);
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
