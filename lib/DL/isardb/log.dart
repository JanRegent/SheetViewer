import 'package:isar/isar.dart';

part 'log.g.dart'; // flutter pub run build_runner build

@Collection()
class Log {
  int id = Isar.autoIncrement;
  String aFunc = '';
  String aStep = '';
  String descr = '';
  String mess = '';

  Log();
}

class LogDb {
  final Isar isar;
  LogDb(this.isar);

  Future update(Log log) async {
    try {
      await isar.writeTxn(() async {
        log.id = await isar.logs.put(log); // insert
      });
      return 'OK';
    } catch (e) {
      // if (kDebugMode) print(e);
      // logi('--- LocalStore: ', '-----------------isar');
      // logi('updateSheetView(String ', sheetView.aQuerystringKey);
      // logi('updateSheetView(String ', e.toString());
      return '';
    }
  }

  Future clear() async {
    await isar.writeTxn(() async {
      await isar.logs.clear();
    });
  }
}
