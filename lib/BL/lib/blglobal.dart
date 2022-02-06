// ignore_for_file: implementation_imports

import 'package:cross_file/cross_file.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';

GetStorage box = GetStorage();

class BlGlobal {
  String contentServiceUrl = '';
  String contentServiceUrlLastModified = '';
  late ValueNotifier<String> loadingMessage;

  Future init() async {
    box = GetStorage();
    box.write('bl.globals.querystring', '?');
    contentServiceUrl = await loadAssetString('contentServiceUrl');
    box.write('bl.globals.contentServiceUrl', contentServiceUrl);
    box.write('rowsSelectedIndex', 0);

    loadingMessage = ValueNotifier<String>('');
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
