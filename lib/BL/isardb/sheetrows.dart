import 'dart:async';
import 'dart:convert';

import 'package:sheetviewer/BL/lib/log.dart';

import '../../BL/bl.dart';

import 'package:isar/isar.dart';

part 'sheetrows.g.dart'; // flutter pub run build_runner build

@Collection()
class SheetRow {
  @Id()
  int id = Isar.autoIncrement;
  String aSheetName = '';
  int aRowNo = 2;
  String row = '';
  String zfileId = '';

  SheetRow();

  @override
  String toString() {
    return '''
  ----------------------------------------------------------------------shetView
  id $id
  RowNo_ $aRowNo
 
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
          ..aRowNo = int.tryParse(rows[i]['row_'])!
          ..row = jsonEncode(rows[i]); //map to String workarround of Isar

        await sheetRowsDb.update(sheetRow);
      }
    } catch (e) {
      logi('SheetRow.sheetRowsFromJson', jsonData.toString(), '', e.toString());
    }
  }
}

class SheetrowsDb {
  final Isar isar;
  SheetrowsDb(this.isar);

  Future clear() async {
    await isar.writeTxn(() async {
      await isar.sheetRows.clear();
    });
  }

  Future<List<String>> readCols(String fileId, String sheetName) async {
    SheetRow? testRow = await isar.sheetRows
        .filter()
        .zfileIdEqualTo(fileId)
        .and()
        .aSheetNameEqualTo(sheetName)
        .findFirst();
    Map row = jsonDecode(testRow!.row);
    List<String> cols = [];
    for (var key in row.keys) {
      cols.add(key);
    }
    return cols;
  }

  Future<int> rowsCount(String fileId, String sheetName) async {
    List<SheetRow?> rows = await isar.sheetRows
        .filter()
        .zfileIdEqualTo(fileId)
        .and()
        .aSheetNameEqualTo(sheetName)
        .findAll();
    logi('rowsCount', sheetName, rows.length.toString(), '');
    return rows.length;
  }

  Future<List<SheetRow?>> readRowsAllSheets() async {
    List<SheetRow?> rows = await isar.sheetRows.where().findAll();
    return rows;
  }

  Future<List<SheetRow?>> readRowsSheet(String fileId, String sheetName) async {
    List<SheetRow?> testRows = await isar.sheetRows
        .filter()
        .zfileIdEqualTo(fileId)
        .and()
        .aSheetNameEqualTo(sheetName)
        .findAll();
    testRows.removeAt(0); //cols row
    return testRows;
  }

  Future<List<SheetRow?>> readRowsContains(
      String fileId, String sheetName, String word) async {
    List<SheetRow?> testRows = await isar.sheetRows
        .filter()
        .zfileIdEqualTo(fileId)
        .and()
        .aSheetNameEqualTo(sheetName)
        .and()
        .rowContains(word, caseSensitive: false)
        .findAll();
    return testRows;
  }

  Future<SheetRow?> readRowNo(
      String fileId, String sheetName, int aRowNo) async {
    SheetRow? row = await isar.sheetRows
        .filter()
        .zfileIdEqualTo(fileId)
        .and()
        .aSheetNameEqualTo(sheetName)
        .and()
        .aRowNoEqualTo(aRowNo)
        .findFirst();
    return row;
  }

  Future<bool> rowExists(SheetRow sheetRow) async {
    SheetRow? testRow = await isar.sheetRows
        .filter()
        .zfileIdEqualTo(sheetRow.zfileId)
        .and()
        .aSheetNameEqualTo(sheetRow.aSheetName)
        .and()
        .aRowNoEqualTo(sheetRow.aRowNo)
        .findFirst();
    try {
      // ignore: unnecessary_null_comparison
      if (testRow!.id != null) return true;
      return false;
    } catch (_) {
      return false;
    }
  }

  Future update(SheetRow sheetRow) async {
    SheetRow? testRow = await isar.sheetRows
        .filter()
        .zfileIdEqualTo(sheetRow.zfileId)
        .and()
        .aSheetNameEqualTo(sheetRow.aSheetName)
        .and()
        .aRowNoEqualTo(sheetRow.aRowNo)
        .findFirst();
    try {
      // ignore: unnecessary_null_comparison
      if (testRow!.id != null) return;
      await isar.writeTxn(() async {
        await isar.sheetRows.put(sheetRow);
      });
    } catch (_) {
      await isar.writeTxn(() async {
        await isar.sheetRows.put(sheetRow);
      });
    }
  }

  Future updateAll(List<SheetRow> sheetRows) async {
    await isar.writeTxn(() async {
      await isar.sheetRows.putAll(sheetRows);
    });
  }

  //----------------------------------------------------------------batch

  Future sheetRowsSave(List<List<dynamic>> rawRows, String fileId,
      String sheetName, bool putAll, List<String> cols) async {
    List<SheetRow> sheetRows = [];
    for (var rowIx = 0; rowIx < rawRows.length; rowIx++) {
      filelistContr.fetshingRows.value =
          sheetName + ': ' + rowIx.toString() + '/' + rawRows.length.toString();
      Map row = {}; //excel 1 cols, 2.. data
      for (var colIx = 0; colIx < cols.length; colIx++) {
        try {
          row[cols[colIx]] = rawRows[rowIx][colIx];
        } catch (_) {
          row[cols[colIx]] = '';
        }
      }
      SheetRow sheetRow = SheetRow()
        ..aSheetName = sheetName
        ..zfileId = fileId
        ..aRowNo = (rowIx + 1) //excel start at 1
        ..row = jsonEncode(row);
      String key = row.keys.first.toString();
      if (row[key].toString().trim().isNotEmpty) {
        if (putAll) {
          //>1000 rows
          sheetRows.add(sheetRow); //empty rows //workarround
        } else {
          await sheetRowsDb.update(sheetRow);
        }
      }
    }
    if (putAll) await sheetRowsDb.updateAll(sheetRows);
  }
}
