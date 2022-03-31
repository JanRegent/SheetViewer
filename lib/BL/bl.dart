import 'package:sheetviewer/BL/lib/uti.dart';

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
  }
}
