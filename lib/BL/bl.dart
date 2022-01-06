import 'package:sheetviewer/BL/lib/uti.dart';

import 'lib/blglobal.dart';

BL bl = BL();

class BL {
  BLuti blUti = BLuti();
  BlGlobal blGlobal = BlGlobal();

  Future init() async {
    await blGlobal.init();
  }
}
