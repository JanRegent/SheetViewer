import 'package:flutter/material.dart';
import 'package:sheetviewer/DL/loader/loader.dart';

import 'AL/__home/tabslistpage.dart';
//import 'maintest.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getContentServiceUrl();

  runApp(const TabsListsPage());
  //runApp(const CounterApp());
}
