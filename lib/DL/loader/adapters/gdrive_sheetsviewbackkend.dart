import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

Future rowcountListPost(Map interestUpdatelist, Map interestMap) async {
  Dio dio = Dio();
  dio.interceptors.add(PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
    compact: false,
  ));
//   dio.head('Access-Control-Allow-Origin', "*");
// add_header Access-Control-Allow-Methods "GET, HEAD";
  dio.options.connectTimeout = 3000;
  try {
    String baseUrl =
        'https://script.google.com/macros/s/AKfycbx1teKKwdeLSeqn1UhUKmMtoIaLb8j1y4kxWzPiJ5fjWlH8ICReV1FRjn_XT5krgrG0/exec';
    dio.options.baseUrl = baseUrl;
    dio.options.headers.addAll({
      'content-type': 'application/json',
      'Access-Control-Allow-Origin': '*',
      "Access-Control-Allow-Methods": "POST, OPTIONS, GET"
    });
    var formData = {
      'updateList': interestUpdatelist,
      'interestFilelistFileId': interestMap['interestFilelistFileId'],
      'interestFilelistSheetName': interestMap['interestFilelistSheetName']
    };
    var response = await dio.post('', data: formData);
    return response.data;
  } catch (e) {
    //rint(e);
  }
  return '';
}
