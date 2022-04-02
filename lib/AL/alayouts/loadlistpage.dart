import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/alayouts/loadinginterestpage.dart';

import 'package:sheetviewer/AL/elementsLib/infodialogs/snack.dart';

import 'package:sheetviewer/BL/bl.dart';

import 'dart:async';

import 'package:sheetviewer/DL/getdata_models.dart';
import 'package:sheetviewer/DL/models/sheetviewconfig.dart';

IconButton loadingPageShow(
    Map selectedInterestRow, BuildContext context, String interestName) {
  return IconButton(
      onPressed: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  LoadingInterestPage(selectedInterestRow, interestName)),
        );
      },
      icon: const Icon(Icons.refresh));
}

String loadListSheetName = 'space';
Map loadListFileListSheet = {};
IconButton loadList(Map fileListSheet, BuildContext context) {
  return IconButton(
      onPressed: () async {
        await loadListByActions(loadListFileListSheet, context);
      },
      icon: const Icon(Icons.refresh));
}

List<String> actions = ['getRowsFirst', 'getRowsLast'];

Future loadListByActions(Map fileListSheet, BuildContext context) async {
  for (var index = 0; index < fileListSheet['rows'].length; index++) {
    infoSnack(context, 'Loading ' + fileListSheet['rows'][index]['fileTitle'],
        AnimatedSnackBarType.info);
    String fileId =
        bl.blUti.url2fileid(fileListSheet['rows'][index]['fileUrl']);
    String sheetName = fileListSheet['rows'][index]['sheetName'];
    for (var action in actions) {
      await sheetViewGetData(fileId, sheetName, action, SheetViewConfig());
    }
  }
  infoSnack(context, 'Done', AnimatedSnackBarType.info);
}
