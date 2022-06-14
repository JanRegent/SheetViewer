import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../BL/bl.dart';

import 'package:isar/isar.dart';

part 'sheetrows.g.dart'; // flutter pub run build_runner build

@Collection()
class SheetRow {
  @Id()
  int id = Isar.autoIncrement;

  String aSheetName = '';
  String zfileId = '';
  String row_ = '';
  String row = '';

  SheetRow();

  @override
  String toString() {
    return '''
  ----------------------------------------------------------------------shetView
  id $id
  rov_ $row_
 
    $aSheetName
    $row

    $zfileId
    ''';
  }

  Future sheetRowsFromJson(Map jsonData) async {
    try {
      List<dynamic> rows = jsonData["rows"];
      String sheetName = jsonData["config"]["sheetName"] ?? '';
      String fileId = jsonData["config"]["fileId"] ?? '';

      for (var i = 0; i < rows.length; i++) {
        SheetRow sheetRow = SheetRow()
          ..aSheetName = sheetName
          ..zfileId = fileId
          ..row_ = rows[i]['row_'].toString()
          ..row = jsonEncode(rows[i]); //map to String workarround of Isar

        await sheetRowsDb.update(sheetRow);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future saveRow(SheetRow sheetRow) async {}
}

class SheetrowsDb {
  final Isar isar;
  SheetrowsDb(this.isar);

  bool sync = false;

  Future update(SheetRow sheetRow) async {
    if (!isar.isOpen) {
      return Future<void>(() {});
    }

    SheetRow? testRow = await isar.sheetRows
        .filter()
        .zfileIdEqualTo(sheetRow.zfileId)
        .and()
        .aSheetNameEqualTo(sheetRow.aSheetName)
        .and()
        .row_EqualTo(sheetRow.row_)
        .findFirst();
    try {
      // ignore: unnecessary_null_comparison
      if (testRow!.id != null) return;
    } catch (_) {
      if (sync) {
        isar.writeTxnSync<void>((isar) {
          isar.sheetRows.putSync(sheetRow);
        });
      } else {
        return isar.writeTxn((isar) async {
          await isar.sheetRows.put(sheetRow);
        });
      }
    }
  }
}
