import 'package:isar/isar.dart';
import 'package:sheetviewer/AL/__home/interests/interests_controler.dart';
import 'package:sheetviewer/BL/lib/uti.dart';
import 'package:sheetviewer/DL/dlglobals.dart';
import 'package:sheetviewer/DL/isardb/log.dart';

import 'package:sheetviewer/DL/isardb/sheetview.dart';

import 'package:sheetviewer/DL/localstore/localstore.dart';

import 'buildversion.dart';
import 'lib/log.dart';

BL bl = BL();
late LogDb logDb;
late SheetsDb sheetsDb;

late LocalStore interestStore2; //init in interestController.interestNameSet
late LocalStore appHome = LocalStore('appHome: ');
InterestContr interestContr = InterestContr();

class BL {
  BLuti blUti = BLuti();
  BlGlobal blGlobal = BlGlobal();

  Future init() async {
    await appHome.init();
    await appHome.updateString('buildVersion', buildVersion);

    await await isarDbInit();
    logParagraphStart('init buildVersion: $buildVersion');

    await blGlobal.init();
    await dlGlobals.init();
  }
}

Future isarDbInit() async {
  final isar = await Isar.open(
    schemas: [
      LogSchema,
      SheetViewSchema,
    ],
    //directory: dir.path,
    inspector: false, // if you want to enable the inspector for debug builds
  );

  logDb = LogDb(isar);
  logDb.clear();
  sheetsDb = SheetsDb(isar);
}
