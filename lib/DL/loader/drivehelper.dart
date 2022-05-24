// ignore_for_file: file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:drive_helper/drive_helper.dart';

import 'package:sheetviewer/AL/elementsLib/alib.dart';
import 'package:sheetviewer/BL/bl.dart';

// ignore: must_be_immutable
class DrivePage extends StatelessWidget {
  DrivePage({Key? key}) : super(key: key);
  DriveHelper driveHelper = DriveHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: al.iconBack(context),
        title: ListTile(
          leading: al.helpIcon(context),
          title: Text(interestContr.interestName.value),
        ),
        backgroundColor: Colors.lightBlue,
      ),
      body: FutureBuilder(
        future: driveHelper.signInAndInit([DriveScopes.read]),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Column(
                children: const [
                  Text('Loading sheet config...'),
                  Text(' '),
                  Text(' '),
                  CircularProgressIndicator()
                ],
              );

            default:
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return Text(driveHelper.name!);
              }
          }
        },
      ),
    );
  }
}
