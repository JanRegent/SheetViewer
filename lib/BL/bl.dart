import 'package:isar/isar.dart';
import 'package:sheetviewer/AL/__home/interests/interests_controler.dart';
import 'package:sheetviewer/BL/lib/uti.dart';
import 'package:sheetviewer/DL/dlglobals.dart';
import 'package:sheetviewer/DL/isardb/filelist.dart';

import 'package:sheetviewer/DL/isardb/log.dart';
import 'package:sheetviewer/DL/isardb/sheetrows.dart';

import 'package:sheetviewer/DL/localstore/localstorage.dart';

import 'appVersionInfo/appmode.dart';
import 'appVersionInfo/appversion.dart';
import 'appVersionInfo/buildversion.dart';
import 'lib/log.dart';

BL bl = BL();
late LogDb logDb;

late FileListDb filelistDb;
late SheetrowsDb sheetRowsDb;

late LocalStorage appHome = LocalStorage('appHome: ');
InterestContr interestContr = InterestContr();

class BL {
  BLuti blUti = BLuti();
  BlGlobal blGlobal = BlGlobal();

  Future init() async {
    await appHome.init();
    await appHome.updateMap('appVersionInfo', {
      'appVersion': appVersion,
      'appMode': appMode,
      'buildVersion': buildVersion
    });

    await await isarDbInit();
    logParagraphStart('init buildVersion: $buildVersion');

    await blGlobal.init();
    await dlGlobals.init();
  }
}

Future isarDbInit() async {
  //final isar = await Isar.open([LogSchema, SheetRowSchema, FileListSchema]);
  final isar = await Isar.open([LogSchema, SheetRowSchema, FileListSchema],
      name: 'SheetViewerDemo', relaxedDurability: true);
  //,inspector: kDebugMode
  //directory: dir.path,
  //inspector: false, // if you want to enable the inspector for debug builds
  //true => Unsupported operation: dart:isolate is not supported on dart4web
  //print(isar.name);

  logDb = LogDb(isar);
  logDb.clear();

  sheetRowsDb = SheetrowsDb(isar);
  filelistDb = FileListDb(isar);
}
