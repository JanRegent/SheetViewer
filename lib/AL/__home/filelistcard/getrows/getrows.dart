import 'package:flutter/material.dart';
import 'package:sheetviewer/BL/bl.dart';

import 'getrowsallbutton.dart';
import 'getrowsfirstbutton.dart';
import 'getrowslastbutton.dart';

Row getRowsRow(
    BuildContext context, Function setStateFunc, Map fileListSheet, int index) {
  String fileId = bl.blUti.url2fileid(fileListSheet['rows'][index]['fileUrl']);
  String sheetName = fileListSheet['rows'][index]['sheetName'];
  String fileTitle = fileListSheet['rows'][index]['fileTitle'];
  return Row(
    children: [
      rowsCountDropDown(),
      const Text(' '),
      getRowsFirstButton(context, fileId, sheetName, fileTitle),
      const Text(' '),
      getRowsAllButton(context, fileId, sheetName, fileTitle),
      const Text(' '),
      getRowsLastButton(context, fileId, sheetName, fileTitle),
      const Text(' '),
      getRowsLastCount(
        context,
        setStateFunc,
        fileId,
        sheetName,
      )
    ],
  );
}

List<DropdownMenuItem<String>> getDropdownItems() {
  List<DropdownMenuItem<String>> dropDownItems = [];
  List<String> currenciesList = ['10', '20', '30'];
  for (String currency in currenciesList) {
    var newDropdown = DropdownMenuItem(
      child: Text(currency),
      value: currency,
    );

    dropDownItems.add(newDropdown);
  }
  return dropDownItems;
}

String selectedNum = '10';
DropdownButton rowsCountDropDown() {
  return DropdownButton<String>(
      hint: const Text("Select num"),
      value: selectedNum,
      onChanged: (value) {
        // setState(() {
        //   selectedUser = Value;
        // });
      },
      items: getDropdownItems());
}
