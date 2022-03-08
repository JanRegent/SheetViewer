import 'package:sheetviewer/BL/lib/uti.dart';
import 'package:sheetviewer/BL/datasheet/datasheet.dart';
import 'package:sheetviewer/DL/models/sheet_config.dart';
import 'package:sheetviewer/DL/models/sheet.dart';

import 'lib/blglobal.dart';

BL bl = BL();
late SheetsDb sheetsDb;
late SheetConfigDb sheetConfigDb;

class BL {
  BLuti blUti = BLuti();
  BlGlobal blGlobal = BlGlobal();

  Future init() async {
    await blGlobal.init();
  }

  DataSheet dataSheet4debug = DataSheet();
}
