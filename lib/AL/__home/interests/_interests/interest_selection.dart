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
    interestList = await appHome.readListDynamic('', '', 'interestList', []);
  } catch (e) {
    if (interestList.isNotEmpty) {
      logi('interestsLoad()', 'appHome.readListDynamic( interestList', 'error',
          e.toString());
    }
  }
  if (interestList.isEmpty) {
    await getSheetInterests();
    interestList = await appHome.readListDynamic('', '', 'interestList', []);
  }

  interestTitlesGet();

  interestSet(0);
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

  try {
    if (responseData.isNotEmpty) {
      appHome.updateListDynamic('', '', 'interestList', responseData['rows']);
    } else {
      appHome.updateListDynamic('', '', 'interestList', [
        '{"row_":2,"interestName":"space","fileUrl":"https://docs.google.com/spreadsheets/d/1hvRQ69fal9ySZIXoKW4ElJwEJQO1p5eNpM82txhw6Uo/edit#gid=1211959017","sheetName":"spaceList"}'
      ]);
    }
  } catch (e) {
    logi('getSheetInterests', '2e update interests', 'error', e.toString());
  }
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

  await interestController.interestNameSet(interestRowCurrent['interestName']);

  appHome.updateMap('', '', 'interestRowCurrent', interestRowCurrent);

  await getDataFilelistSheet(interestRowCurrent);
}

Future selectInterestManualy(BuildContext context) async {
  logParagraphStart('selectInterestManualy');
  String selectedIndex = await selectInterestDialog(context);
  int? index = int.tryParse(selectedIndex);

  infoSnack(context, 'Loading interst:  ' + interestRowCurrent['interestName'],
      AnimatedSnackBarType.info);

  await interestSet(index!);

  await getDataFilelistSheet(interestRowCurrent);
}
