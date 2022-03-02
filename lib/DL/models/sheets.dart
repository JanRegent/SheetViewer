import 'package:isar/isar.dart';
import 'package:sheetviewer/BL/lib/blglobal.dart';

part 'sheets.g.dart'; // flutter pub run build_runner build

@Collection()
class Sheets {
  int id = Isar.autoIncrement;
  String key = '';

  List<String> cols = [];
  List<String> headerCols = [];

  List<String> rows = [];
}

class SheetsDb {
  final Isar isar;
  SheetsDb(this.isar);

  Future updateSheets(String key, List<String> cols, List<String> rows) async {
    Sheets sheets = Sheets()
      ..key = key
      ..cols = cols
      ..rows = rows;
    try {
      await isar.writeTxn((isar) async {
        sheets.id = await isar.sheetss.put(sheets); // insert
      });
      return 'OK';
    } catch (e) {
      logi('--- LocalStore: ', '-----------------isar');
      logi('updateSheets(String ', key);
      logi('updateSheets(String ', e.toString());
      return '';
    }
  }
}
