import 'package:flutter/material.dart';
import 'package:sheetviewer/BL/appVersionInfo/appmode.dart';
import 'package:sheetviewer/BL/appVersionInfo/appversion.dart';
import 'package:sheetviewer/BL/appVersionInfo/buildversion.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("About"),
        ),
        body: Column(
          children: const [
            Text('appVersion:   ' + appVersion),
            Text('appMode:      ' + appMode),
            Text('buildVersion: ' + buildVersion)
          ],
        ));
  }
}
