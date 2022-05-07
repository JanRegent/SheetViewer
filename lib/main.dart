import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/_dashboard/constaints.dart';

import 'package:sheetviewer/DL/models/zsheetconfig.dart';

import 'AL/_dashboard/pages/dashboard.dart';
import 'BL/bl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await bl.init();
  await logOn();
  //runApp(const GetDataInterestsApp());
  runApp(const DashboardApp());
}

class DashboardApp extends StatelessWidget {
  const DashboardApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SheestsViewer',
      theme: ThemeData(
          fontFamily: 'Nunito',
          primaryColor: primary,
          textTheme: const TextTheme().apply(bodyColor: textColor),
          backgroundColor: Colors.yellow),
      home: const Dashboard(),
      debugShowCheckedModeBanner: false,
    );
  }
}
