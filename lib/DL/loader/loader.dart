import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

Future<String> getSheet() async {
  String contentServiceUrl = await loadAssetString('contentServiceUrl');
  String fileId = await loadAssetString('fileId');
  String sheetName = await loadAssetString('sheetName');

  try {
    var response = await Dio()
        .get(contentServiceUrl + '?fileid=$fileId&sheetname=$sheetName');
    return response.data;
  } catch (e) {
    return '';
  }
}

Future<String> loadAssetString(String varname) async {
  return await rootBundle.loadString('config/$varname.txt');
}
