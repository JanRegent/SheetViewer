import 'package:flutter/material.dart';
import 'package:sheetviewer/DL/loader/loader.dart';

//import 'AL/filelistgrid.dart';
import './counter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getContentServiceUrl();

  //runApp(const FilelistGridApp());
  runApp(const CounterApp());
}
