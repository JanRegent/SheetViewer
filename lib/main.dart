import 'package:flutter/material.dart';
import 'package:sheetviewer/DL/loader/loader.dart';

import 'AL/__home/filelistviewPage.dart';
//import 'maintest.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getContentServiceUrl();

  runApp(const FilelistviewApp());
  //runApp(const CounterApp());
}
