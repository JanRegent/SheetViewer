import 'package:get_storage/get_storage.dart';

import 'package:sheetviewer/BL/lib/blglobal.dart';

class LocalStore {
  final String localStoreName;

  LocalStore(this.localStoreName);

  late GetStorage _box;

  Future<String> init() async {
    try {
      _box = GetStorage(localStoreName);
      await _box.initStorage;
      return 'OK';
    } catch (e) {
      logi('LocalStore init - localStoreName: ', localStoreName);
      logi('readMap(String ', e.toString());
      return 'err';
    }
  }

  Future<Map> readMap(String key) async {
    try {
      return _box.read(key);
    } catch (_) {
      return {};
    }
  }

  Future<String> readString(String key) async {
    try {
      return _box.read(key);
    } catch (_) {
      return '';
    }
  }

  Future updateString(String key, String jsonString) async {
    try {
      _box.write(key, jsonString);
      return 'OK';
    } catch (e) {
      logi('--- LocalStore: ', localStoreName);
      logi('updateString(String ', key);
      logi('updateString(String ', e.toString());
      return '';
    }
  }

  Future updateMap(String key, Map map) async {
    try {
      _box.write(key, map);
      return 'OK';
    } catch (e) {
      logi('--- LocalStore: ', localStoreName);
      logi('updateMap(String ', key);
      logi('updateMap(String ', e.toString());
      return '';
    }
  }

  Future deleteStorage() async {
    try {
      _box.erase();
      return 'OK';
    } catch (e) {
      logi('--- LocalStore: ', localStoreName);
      logi('deleteStorage() ', e.toString());
      return '';
    }
  }
}
