import 'package:isar/isar.dart';
import 'package:sheetviewer/BL/lib/uti.dart';
import 'package:sheetviewer/DL/dlglobals.dart';
import 'package:sheetviewer/DL/models/log.dart';

import 'package:sheetviewer/DL/models/sheetview.dart';
import 'package:sheetviewer/DL/models/sheetviewconfig.dart';

import 'lib/blglobal.dart';

BL bl = BL();
late LogDb logDb;
late SheetsDb sheetsDb;
late SheetViewConfigDb sheetViewConfigDb;

class BL {
  BLuti blUti = BLuti();
  BlGlobal blGlobal = BlGlobal();

  Future init() async {
    await await isarDbInit();
    logParagraphStart('init');

    await blGlobal.init();
    await dlGlobals.init();
  }
}

Future isarDbInit() async {
  final isar = await Isar.open(
    schemas: [
      LogSchema,
      SheetViewSchema,
      SheetViewConfigSchema,
    ],
    //directory: dir.path,
    inspector: false, // if you want to enable the inspector for debug builds
  );

  logDb = LogDb(isar);
  logDb.clear();
  sheetsDb = SheetsDb(isar);

  sheetViewConfigDb = SheetViewConfigDb(isar);

  logi('isarDbInit()', 'init end', '', '');
}
