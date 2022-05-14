import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/__home/interests/_interests/select_interest_dialog.dart';
import 'package:sheetviewer/AL/elementsLib/infodialogs/snack.dart';
import 'package:sheetviewer/BL/actionSheet/getsheet.dart';
import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/BL/lib/blglobal.dart';

import '../interests_controlers.dart';

Future interestsLoad() async {
  logParagraphStart('interestsLoad');

  try {
    interestList = await appHome.readListDynamic('interestList', []);
  } catch (e) {
    if (interestList.isNotEmpty) {
      logi('interestsLoad()', 'appHome.readListDynamic( interestList', 'error',
          e.toString());
    }
  }
  if (interestList.isEmpty) {
    interestList = await getSheetInterests();
    await appHome.updateListDynamic('interestList', interestList);
  }
  interestSet(0);

  interestTitlesGet();
}

Future getSheetInterests() async {
  Map responseData = {};
  try {
    responseData = await getSheet(
        'https://docs.google.com/spreadsheets/d/1hvRQ69fal9ySZIXoKW4ElJwEJQO1p5eNpM82txhw6Uo/edit#gid=1211959017',
        'interestList');
  } catch (e) {
    logi('getSheetInterests', '1e request getSheet', 'error', e.toString());
  }
  interestList = [];
  try {
    if (responseData.isNotEmpty) {
      interestList = responseData['rows'];
    }
  } catch (e) {
    logi('getSheetInterests', '2e update interests', 'error', e.toString());
  }
  return interestList;
}

void interestTitlesGet() {
  for (var i = 0; i < interestList.length; i++) {
    String interestName = interestList[i]['interestName'];
    if (interestTitles.contains(interestName)) continue;
    interestTitles.add(interestName);
  }
}

Future interestSet(int interestIndex) async {
  interestRowCurrent = interestList[interestIndex];

  logParagraphStart('interestSet');
  logi('interestSet(', '', 'interestName', interestRowCurrent['interestName']);

  await interestController.interestNameSet(interestRowCurrent['interestName']);

  appHome.updateMap('interestRowCurrent', interestRowCurrent);

  await interestFilelistGetData(interestRowCurrent);
}

Future selectInterestManualy(BuildContext context) async {
  logParagraphStart('selectInterestManualy');
  String selectedIndex = await selectInterestDialog(context);
  int? index = int.tryParse(selectedIndex);

  infoSnack(context, 'Loading interst:  ' + interestRowCurrent['interestName'],
      AnimatedSnackBarType.info);

  await interestSet(index!);

  await interestFilelistGetData(interestRowCurrent);
}
