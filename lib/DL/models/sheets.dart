import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:sheetviewer/BL/lib/blglobal.dart';

part 'sheets.g.dart'; // flutter pub run build_runner build

@Collection()
class Sheets {
  int id = Isar.autoIncrement;
  String key = '';

  List<String> cols = [];
  List<String> rows = [];
}

class SheetsDb {
  final Isar isar;
  SheetsDb(this.isar);

  Future<int> keyCount(String key) async {
    final sheetExists = isar.sheetss.where().filter().keyEqualTo(key);
    int count = await sheetExists.count();
    return count;
  }

  Future<Sheets?> readSheet(String key) async {
    final sheetExists = isar.sheetss.where().filter().keyEqualTo(key);
    int count = await sheetExists.count();
    if (count == 0) return Sheets();
    return await sheetExists.findFirst();
  }

  Future updateSheets(String key, List<String> cols, List<dynamic> rows) async {
    int keyCount_ = await keyCount(key);
    if (keyCount_ > 0) {
      return 'OK';
    }
    Sheets sheet = Sheets()
      ..key = key
      ..cols = cols;
    for (var i = 0; i < rows.length; i++) {
      //print(sheet.rows[i]['Mise']);
      sheet.rows.add(jsonEncode(rows[i]));
    }
    try {
      await isar.writeTxn((isar) async {
        sheet.id = await isar.sheetss.put(sheet); // insert
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
