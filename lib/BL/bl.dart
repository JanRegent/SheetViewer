// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:isar/isar.dart';
import 'package:sheetviewer/BL/lib/uti.dart';
import 'package:sheetviewer/DL/dlglobals.dart';

import 'package:sheetviewer/DL/models/zsheetconfig.dart';
import 'package:sheetviewer/DL/models/sheetview.dart';
import 'package:sheetviewer/DL/models/sheetviewconfig.dart';

import 'lib/blglobal.dart';

BL bl = BL();
late SheetsDb sheetsDb;
late SheetViewConfigDb sheetViewConfigDb;
late SheetConfigDb sheetConfigDb;

class BL {
  BLuti blUti = BLuti();
  BlGlobal blGlobal = BlGlobal();

  Future init() async {
    window.sessionStorage.clear();
    logStartLine('init');

    await blGlobal.init();
    await dlGlobals.init();
    await await isarDbInit();

    logLine();
  }
}

Future isarDbInit() async {
  final isar = await Isar.open(
    schemas: [SheetViewSchema, SheetViewConfigSchema, SheetConfigSchema],
    //directory: dir.path,
    inspector: false, // if you want to enable the inspector for debug builds
  );

  sheetsDb = SheetsDb(isar);
  await sheetsDb.init();
  sheetViewConfigDb = SheetViewConfigDb(isar);
  sheetConfigDb = SheetConfigDb(isar);
  await sheetConfigDb.init();

  logi('isarDbInit()', 'init end');
}
