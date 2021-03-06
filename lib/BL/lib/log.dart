import 'package:flutter/foundation.dart';
import 'package:sheetviewer/BL/bl.dart';

import 'package:sheetviewer/BL/isardb/log.dart';

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
  late ValueNotifier<String> loadingMessage;

  Future init() async {
    loadingMessage = ValueNotifier<String>('');
  }
}
