import 'package:flutter/services.dart';

import 'package:sheetviewer/BL/bl.dart';

import 'package:sheetviewer/DL/loader/fire_reader.dart';
import 'package:sheetviewer/DL/loader/GSheets/getsheets_service.dart';

DlGlobals dlGlobals = DlGlobals();

class DlGlobals {
  String baseUrl = '';
  String kredenc = '';
  GetSheetsService getSheetsService = GetSheetsService();
  Future init() async {
    baseUrl = await getBaseUrlAtFire();
    await appHome.updateString('DL-contentServiceUrl', baseUrl);

    //kredenc = await getKredencAtFire();
    kredenc = await loadAssetJson('service_account.json');
    await getSheetsService.init();

    // await dlGlobals.getSheetsService
    //     .getAllRows('1cq0G8ulZLLZgdvwZ_f6Io1a3hupneDqQnaBPSzR39lA', 'elonX');
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
