// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sheetviewer/DL/loader/loader.dart';

import 'AL/__home/tabslistpage.dart';
//import 'maintest.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getContentServiceUrl();
  await post1();
  runApp(const TabsListsPage());
  //runApp(const CounterApp());
}

Future post1() async {
  String url =
      'https://script.google.com/macros/s/AKfycbzueXhtAz9ovP0vldXPet_XtNOUNWoIXTdhnVFmHmRYLFnyHu9njRQqcazUdfqMo_LZ/exec';

  try {
    Dio dio = Dio();
    Response response = await dio.post(url,
        data: {
          "name": "jsmith",
          "age": "21",
          'pets': ['fido', 'fluffy']
        },
        options: Options(
          headers: {
            "content-Type": "application/json",
            "Access-Control-Allow-Origin": "*",
            "Access-Control-Allow-Headers": "*",
            "Access-Control-Allow-Methods": "POST,GET,DELETE,PUT,OPTIONS",
            "Access-Control-Allow-Credentials": "true",
            "user-agent":
                "Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Mobile Safari/537.36"
          },
        ));
    print("data coming");
    print(response);
  } on DioError catch (e) {
    print(e);
    //print(e.response);
    //   print(e.response.headers);
    //   print(e.response.request);
    // }
  }
}
