import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/elementsLib/selectList/multiselect_chip.dart';

import '../interests_controlers.dart';

Future<String> selectInterestDialog(BuildContext context) async {
  int selectedIndex = 0;
  String selectedInterst = await showDialog(
      context: context,
      builder: (BuildContext context) {
        //Here we will build the content of the dialog
        return AlertDialog(
          title: const Text("Select interest"),
          content: MultiSelectChip(
            interestTitles,
            onSelectionChanged: (selectedList) {
              selectedIndex = interestTitles.indexOf(selectedList[0]);
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
