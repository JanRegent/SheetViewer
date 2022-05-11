import 'package:chucker_flutter_ui/chucker_flutter_ui.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:sheetviewer/AL/__home/interests/loadinginterestpage.dart';
import 'package:sheetviewer/AL/alayouts/_getdata_layout/home_help.dart';
import 'package:sheetviewer/AL/elements/getrows/cards/filelistcard_firstlast_all.dart';

import 'package:sheetviewer/DL/models/sheetviewconfig.dart';

// ignore: must_be_immutable
class LastListviewPage extends StatelessWidget {
  final Map interestRowCurrent;
  final List<dynamic> fileListSheet;
  final List<SheetViewConfig> sheetViewConfigs;
  LastListviewPage(
      this.interestRowCurrent, this.fileListSheet, this.sheetViewConfigs,
      {Key? key})
      : super(key: key);

  late String interestName = 'interest';

  Widget detailBody() {
    return Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color.fromARGB(255, 236, 240, 241),
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          shrinkWrap: true,
          itemCount: fileListSheet.length,
          itemBuilder: (context, index) {
            return filelistCardFirstLastAll(
                context, fileListSheet, index, sheetViewConfigs[index]);
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: ListTile(
            leading: loadingPageShow(
                fileListSheet, context, interestRowCurrent['interestName']),
            title: Text(interestName),
          ),
          backgroundColor: Colors.lightBlue,
          actions: [
            ElevatedButton(
              child: const Icon(Icons.help),
              onPressed: () => helpToastShow(
                  "Click ob V icon to open cards bb", ToastGravity.CENTER_LEFT),
            ),
            ChuckerFlutter.chuckerButton
          ],
        ),
        body: detailBody()

        //Center(child: filelistGrid()),
        );
  }
}
