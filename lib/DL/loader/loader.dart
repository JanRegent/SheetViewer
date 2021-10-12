import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

late String contentServiceUrl;

Future getContentServiceUrl() async {
  contentServiceUrl = await loadAssetString('contentServiceUrl');
}

Future<String> getSheet() async {
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
  try {
    return await rootBundle.loadString('config/$varname.txt');
  } catch (_) {
    return '';
  }
}

Future<String> getFilelist() async {
  String contentServiceUrl = await loadAssetString('contentServiceUrl');

  String fileId = '1LZlPCCI0TwWutwquZbC8HogIhqNvxqz0AVR1wrgPlis';
  //await loadAssetString('fileId');

  String sheetName = 'fileListProHledace';
  // await loadAssetString('sheetName');
  try {
    var response = await Dio()
        .get(contentServiceUrl + '?filelistid=$fileId&sheetname=$sheetName');
    return response.data;
  } catch (e) {
    return '';
  }
}
