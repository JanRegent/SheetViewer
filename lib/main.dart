import 'package:flutter/material.dart';
import 'package:sheetviewer/DL/loader/loader.dart';

import 'AL/__home/filelistgrid.dart';
//import 'maintest.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getContentServiceUrl();

  runApp(const FilelistGridApp());
  //runApp(const CounterApp());
}
