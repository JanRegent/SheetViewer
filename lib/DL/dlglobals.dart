// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/services.dart';

import 'package:sheetviewer/BL/bl.dart';

import 'package:sheetviewer/DL/loader/fire_reader.dart';
import 'package:sheetviewer/DL/loader/GSheets/getsheets_service.dart';

DlGlobals dlGlobals = DlGlobals();
final remoteConfig = FirebaseRemoteConfig.instance;

class DlGlobals {
  String baseUrl = '';

  String kredenc = '';
  GetSheetsService getSheetsService = GetSheetsService();
  String domain = '';
  Future init() async {
    await fireInit();
    baseUrl = await loadAssetString('baseUrl');
    await appHome.updateString('DL-contentServiceUrl', baseUrl);

    var url = window.location.href;
    domain = url
        .toString()
        .replaceAll('http://', '')
        .replaceAll('https://', '')
        .split('#')[0];

    if (domain.toString().contains('vercel.app')) {
      baseUrl = remoteConfig.getString('baseUrl');
      await appHome.updateString('DL-contentServiceUrl', baseUrl);
      kredenc = remoteConfig.getString('service_account');
    } else {
      kredenc = await loadAssetJson('service_account.json');
    }

    await getSheetsService.init();
  }
}

//-------------------------------------------------------------assets
Future<String> loadAssetString(String varname) async {
  try {
    return await rootBundle.loadString('config/$varname.txt');
  } catch (e) {
    return e.toString();
  }
}

Future<String> loadAssetJson(String varname) async {
  try {
    return await rootBundle.loadString('config/$varname');
  } catch (e) {
    return e.toString();
  }
}
