import 'dart:convert';

import 'package:isar/isar.dart';
import 'package:sheetviewer/BL/filelist/filelist_controler.dart';
import 'package:sheetviewer/BL/appConfig/appconfigdb.dart';
import 'package:sheetviewer/BL/lib/uti.dart';
import 'package:sheetviewer/DL/dlglobals.dart';
import 'package:sheetviewer/BL/isardb/filelist.dart';

import 'package:sheetviewer/BL/isardb/log.dart';
import 'package:sheetviewer/BL/isardb/sheetrows.dart';
import 'package:sheetviewer/BL/isardb/viewconfig.dart';

import '../BL/isardb/viewconfig.dart';
import 'appConfig/appconfig.dart';
import 'appConfig/appmode.dart';
import 'appConfig/appversion.dart';
import 'appConfig/buildversion.dart';
import 'lib/log.dart';

BL bl = BL();
late LogDb logDb;
late AppConfigDb appConfigDb;
late FileListDb filelistDb;
late SheetrowsDb sheetRowsDb;
late ViewConfigsDb viewConfigsDb;

FilelistContr filelistContr = FilelistContr();

class BL {
  BLuti blUti = BLuti();
  BlGlobal blGlobal = BlGlobal();

  Future init() async {
    await await isarDbInit();
    logParagraphStart('init buildVersion: $buildVersion');

    await blGlobal.init();

    await appConfigDb.update(
        'appVersionInfo',
        jsonEncode({
          'appVersion': appVersion,
          'appMode': appMode,
          'buildVersion': buildVersion
        }));

    await dlGlobals.init();

    await appConfigLoad();
  }
}

Future isarDbInit() async {
  //final isar = await Isar.open([LogSchema, SheetRowSchema, FileListSchema]);
  final isar = await Isar.open([
    AppConfigSchema,
    LogSchema,
    SheetRowSchema,
    FileListSchema,
    ViewConfigSchema
  ], name: 'SheetViewerDemo', relaxedDurability: true);
  //,inspector: kDebugMode
  //directory: dir.path,
  //inspector: false, // if you want to enable the inspector for debug builds
  //true => Unsupported operation: dart:isolate is not supported on dart4web
  //print(isar.name);

  logDb = LogDb(isar);
  await logDb.clear();

  appConfigDb = AppConfigDb(isar);
  await appConfigDb.clear();
  sheetRowsDb = SheetrowsDb(isar);
  filelistDb = FileListDb(isar);
  viewConfigsDb = ViewConfigsDb(isar);
}
