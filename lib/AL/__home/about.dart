import 'package:flutter/material.dart';
import 'package:sheetviewer/BL/appVersionInfo/appmode.dart';
import 'package:sheetviewer/BL/appVersionInfo/appversion.dart';
import 'package:sheetviewer/BL/appVersionInfo/buildversion.dart';
import 'package:sheetviewer/DL/dlglobals.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("About"),
        ),
        body: Column(
          children: [
            const Text('appVersion:   ' + appVersion),
            const Text('appMode:      ' + appMode),
            const Text('buildVersion: ' + buildVersion),
            Text('at domain: ' + dlGlobals.domain)
          ],
        ));
  }
}
