import 'package:cross_file/cross_file.dart';

import 'package:flutter/services.dart';

class BlGlobal {
  String contentServiceUrl = '';
  String contentServiceUrlLastModified = '';

  Future init() async {
    contentServiceUrl = await loadAssetString('contentServiceUrl');
  }

  //-------------------------------------------------------------assets
  Future<String> loadAssetString(String varname) async {
    final file = XFile('config/$varname.txt');
    DateTime lm = await file.lastModified();
    contentServiceUrlLastModified = lm.toIso8601String();

    try {
      return await rootBundle.loadString('config/$varname.txt');
    } catch (_) {
      return '';
    }
  }
}
