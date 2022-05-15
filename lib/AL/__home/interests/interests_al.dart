import 'package:animated_snack_bar/animated_snack_bar.dart';

import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/elementsLib/dropdown/customdropdown.dart';
import 'package:sheetviewer/AL/elementsLib/infodialogs/snack.dart';
import 'package:sheetviewer/AL/elementsLib/selectList/multiselect_chip.dart';
import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/BL/lib/blglobal.dart';

CustomDropdownMenu interestsDropdown(List<String> intererests,
    List<dynamic> interestList, BuildContext context) {
  void interestChanged(value) async {
    String selectedInterest = '';
    try {
      selectedInterest = value;

      appHome.updateMap('interestRowCurrent', interestList[0]);
      for (var i = 0; i < interestList.length; i++) {
        if (interestList[i]['interestName'] == selectedInterest) {
          appHome.updateMap('interestRowCurrent', interestList[i]);
          break;
        }
      }
    } catch (_) {
      infoSnack(context, 'interest is NOT ready: ' + selectedInterest,
          AnimatedSnackBarType.error);
    }
  }

  return CustomDropdownMenu(
      defaultValue: intererests[0],
      values: intererests,
      onItemSelected: interestChanged);
}

Future selectInterestManualy(BuildContext context) async {
  logParagraphStart('selectInterestManualy');
  String selectedIndex = await selectInterestDialog(context);
  int? index = int.tryParse(selectedIndex);

  infoSnack(
      context,
      'Loading interst:  ' + interestContr.interestRowCurrent['interestName'],
      AnimatedSnackBarType.info);

  await interestContr.interestSet(index!);

  await interestContr.filelistGetData(interestContr.interestRowCurrent);
}

Future<String> selectInterestDialog(BuildContext context) async {
  int selectedIndex = 0;

  String selectedInterst = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Select interest"),
          content: MultiSelectChip(
            interestContr.titles,
            onSelectionChanged: (selectedList) {
              selectedIndex = interestContr.titles.indexOf(selectedList[0]);
            },
            maxSelection: 2,
          ),
          actions: <Widget>[
            ElevatedButton(
                child: const Text("Select interest"),
                onPressed: () {
                  Navigator.of(context).pop(selectedIndex.toString());
                })
          ],
        );
      });

  return selectedInterst;
}
