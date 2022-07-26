import 'package:isar/isar.dart';

part 'appconfigdb.g.dart'; // flutter pub run build_runner build

@Collection()
class AppConfig {
  @Id()
  int id = Isar.autoIncrement;
  String key = '';
  String value = '';

  AppConfig();
}

class AppConfigDb {
  final Isar isar;
  AppConfigDb(this.isar);

  String filelistFileId = '';
  String filelistSheetName = '';

  Future clear() async {
    await isar.writeTxn(() async {
      await isar.appConfigs.clear();
    });
  }

  Future<String> readByKey(String key) async {
    try {
      AppConfig? row =
          await isar.appConfigs.filter().keyEqualTo(key).findFirst();
      return row!.value;
    } catch (_) {
      return '';
    }
  }

  Future update(String key, String value) async {
    try {
      await isar.writeTxn(() async {
        await isar.appConfigs.put(AppConfig()
          ..key = key
          ..value = value); // insert
      });
      return 'OK';
    } catch (e) {
      // logi('--- LocalStore: ', '-----------------isar');
      // logi('updateSheetView(String ', sheetView.aQuerystringKey);
      // logi('updateSheetView(String ', e.toString());
      return '';
    }
  }
}
