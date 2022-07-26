import 'dart:async';
import 'dart:convert';

import 'package:isar/isar.dart';

part 'filelist.g.dart'; // flutter pub run build_runner build

@Collection()
class FileList {
  @Id()
  int id = Isar.autoIncrement;
  String aSheetName = '';
  String aRowNo = '';
  String row = '';
  String zfileId = '';
  String zfileIdConfig = '';
  String viewConfig = '';
  String viewConfigLocal = '';

  FileList();

  @override
  String toString() {
    return '''
  ----------------------------------------------------------------------shetView
  id $id
  rowNo_ $aRowNo
 
    $aSheetName
    $row

    $zfileId
    ''';
  }
}

class FileListDb {
  final Isar isar;
  FileListDb(this.isar);

  bool sync = false;

  Future<List<String>> readCols(String fileId, String sheetName) async {
    FileList? testRow = await isar.fileLists
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
    List<FileList?> testRows = await isar.fileLists
        .filter()
        .zfileIdEqualTo(fileId)
        .and()
        .aSheetNameEqualTo(sheetName)
        .findAll();
    return testRows.length;
  }

  Future<List<FileList?>> readRowsAllSheets() async {
    List<FileList?> rows = await isar.fileLists.where().findAll();
    return rows;
  }

  Future<List<FileList?>> readRowsSheet(String filelistSheetName) async {
    List<FileList?> testRows = await isar.fileLists
        .filter()
        .aSheetNameEqualTo(filelistSheetName)
        .findAll();
    return testRows;
  }

  Future<FileList?> readRowNo(String aRowNo) async {
    FileList? row =
        await isar.fileLists.filter().aRowNoEqualTo(aRowNo).findFirst();
    return row;
  }

  Future<bool> rowExists(FileList sheetRow) async {
    FileList? testRow = await isar.fileLists
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

  Future update(FileList sheetRow) async {
    if (!isar.isOpen) {
      return Future<void>(() {});
    }

    FileList? testRow = await isar.fileLists
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
    } catch (_) {
      await isar.writeTxn(() async {
        await isar.fileLists.put(sheetRow);
      });
    }
  }

  Future updateAll(List<FileList> sheetRows) async {
    if (!isar.isOpen) {
      return Future<void>(() {});
    }
    await isar.fileLists.putAll(sheetRows);
  }

  Future updateAllRaw(List<List<String>> sheetRows, String filelistFileId,
      String filelistSheetname) async {
    if (!isar.isOpen) {
      return Future<void>(() {});
    }

    await isar.writeTxn(() async {
      await isar.fileLists.clear();
    });

    List<String> cols = sheetRows[0];
    for (var rowIx = 0; rowIx < sheetRows.length; rowIx++) {
      if (sheetRows[rowIx].isEmpty) continue;
      if (sheetRows[rowIx][0].isEmpty) continue;
      Map row = {};
      try {
        for (var colIx = 0; colIx < cols.length; colIx++) {
          row[cols[colIx]] = sheetRows[rowIx][colIx];
        }
      } catch (_) {}
      FileList fileListRow = FileList()
        ..aSheetName = filelistSheetname
        ..zfileId = filelistFileId
        ..aRowNo = (rowIx + 1).toString() //excel start at 1
        ..row = jsonEncode(row);

      await isar.writeTxn(() async {
        await isar.fileLists.put(fileListRow);
      });
    }
  }
}
