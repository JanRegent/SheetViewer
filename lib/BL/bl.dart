import 'package:sheetviewer/BL/lib/uti.dart';

BL bl = BL();

class BL {
  BLuti bLuti = BLuti();

  List<String> toListString(List<dynamic> items) {
    List<String> list = [];
    for (var item in items) {
      list.add(item.toString());
    }
    return list;
  }
}
