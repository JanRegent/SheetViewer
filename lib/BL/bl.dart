import 'package:isar/isar.dart';
import 'package:sheetviewer/BL/lib/uti.dart';
import 'package:sheetviewer/DL/get_sheetview.dart';

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
    await blGlobal.init();
    await isarDbInit();
  }
}

Future isarDbInit() async {
  await dioInit();
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
}
