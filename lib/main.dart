import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/_dashboard/constaints.dart';
import 'AL/_sidebar/sidebar.dart';
import 'package:sheetviewer/DL/models/zsheetconfig.dart';

import 'AL/_dashboard/interests/controlers_interests.dart';
import 'AL/_dashboard/_dashboard.dart';
import 'BL/bl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await bl.init();
  await logOn();
  await getDataInterests();
  //runApp(const GetDataInterestsApp());
  runApp(SidebarXExampleApp());
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
