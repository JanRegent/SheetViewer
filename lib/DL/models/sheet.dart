import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:sheetviewer/BL/lib/blglobal.dart';

part 'sheet.g.dart'; // flutter pub run build_runner build

@Collection()
class Sheet {
  int id = Isar.autoIncrement;
  String key = '';

  List<String> cols = [];
  List<String> rows = [];
}

class SheetsDb {
  final Isar isar;
  SheetsDb(this.isar);

  Future<int> keysCount(String key) async {
    final sheetExists = isar.sheets.where().filter().keyEqualTo(key);
    int count = await sheetExists.count();
    return count;
  }

  Future<Sheet?> readSheet(String key) async {
    final sheetExists = isar.sheets.where().filter().keyEqualTo(key);
    int count = await sheetExists.count();
    if (count == 0) return Sheet();
    Sheet? sheet = await sheetExists.findFirst();
    sheet?.key = key;
    return sheet;
  }

  Future updateSheets(String key, List<String> cols, List<dynamic> rows) async {
    int keyCount_ = await keysCount(key);
    if (keyCount_ > 0) {
      return 'OK';
    }
    Sheet sheet = Sheet()
      ..key = key
      ..cols = cols;
    for (var i = 0; i < rows.length; i++) {
      sheet.rows.add(jsonEncode(rows[i]));
    }
    try {
      await isar.writeTxn((isar) async {
        sheet.id = await isar.sheets.put(sheet); // insert
      });
      return 'OK';
    } catch (e) {
      if (kDebugMode) print(e);
      logi('--- LocalStore: ', '-----------------isar');
      logi('updateSheets(String ', key);
      logi('updateSheets(String ', e.toString());
      return '';
    }
  }
}