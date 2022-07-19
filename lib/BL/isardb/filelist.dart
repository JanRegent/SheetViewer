import 'dart:async';
import 'dart:convert';

import 'package:sheetviewer/BL/lib/log.dart';

import '../../BL/bl.dart';

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

  Future sheetRowsFromJson(Map jsonData) async {
    try {
      List<dynamic> rows = jsonData["rows"];
      String sheetName = jsonData["config"]["sheetName"] ?? '';
      String fileId = jsonData["config"]["fileId"] ?? '';

      for (var i = 0; i < rows.length; i++) {
        FileList filelistRow = FileList()
          ..aSheetName = sheetName
          ..zfileId = fileId
          ..aRowNo = rows[i]['row_'].toString()
          ..row = jsonEncode(rows[i]); //map to String workarround of Isar

        await filelistDb.update(filelistRow);
      }
    } catch (e) {
      logi('filelist.sheetRowsFromJson', jsonData.toString(), '', e.toString());
    }
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

  Future<List<FileList?>> readRowsSheet(String fileId, String sheetName) async {
    List<FileList?> testRows = await isar.fileLists
        .filter()
        .zfileIdEqualTo(fileId)
        .and()
        .aSheetNameEqualTo(sheetName)
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
}
