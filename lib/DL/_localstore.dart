import 'package:get_storage/get_storage.dart';
import 'package:sheetviewer/BL/bl.dart';

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
      return await _box.read(key);
    } catch (_) {
      return {};
    }
  }

  Future<List<String>> readList(String key) async {
    try {
      return bl.blUti.toListString(_box.read(key));
    } catch (e) {
      return [];
    }
  }

  Future<String> readString(String key) async {
    try {
      return await _box.read(key);
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

  Future updateList(String key, List<String> list) async {
    try {
      _box.write(key, list);
      return 'OK';
    } catch (e) {
      logi('--- LocalStore: ', localStoreName);
      logi('updateList(String ', key);
      logi('updateList(String ', e.toString());
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

  Future deleteKey(String key) async {
    await _box.remove(key);
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
