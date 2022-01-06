import 'package:flutter/services.dart';

class BlGlobal {
  String contentServiceUrl = '';

  Future init() async {
    contentServiceUrl = await loadAssetString('contentServiceUrl');
  }

  //-------------------------------------------------------------assets
  Future<String> loadAssetString(String varname) async {
    try {
      return await rootBundle.loadString('config/$varname.txt');
    } catch (_) {
      return '';
    }
  }
}
