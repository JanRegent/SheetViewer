import 'package:flutter/material.dart';
import 'package:sheetviewer/BL/bl.dart';

import 'getrowsallbutton.dart';
import 'getrowsfirstbutton.dart';
import 'getrowslastbutton.dart';

Row getRowsRow(BuildContext context, Map fileListSheet, int index) {
  String fileId = bl.blUti.url2fileid(fileListSheet['rows'][index]['fileUrl']);
  return Row(
    children: [
      rowsCountDropDown(),
      const Text(' '),
      getRowsFirstButton(
          context,
          fileId,
          fileListSheet['rows'][index]['sheetName'],
          fileListSheet['rows'][index]['fileTitle']),
      const Text(' '),
      getRowsAllButton(
          context,
          fileId,
          fileListSheet['rows'][index]['sheetName'],
          fileListSheet['rows'][index]['fileTitle']),
      const Text(' '),
      getRowsLastButton(
          context,
          fileId,
          fileListSheet['rows'][index]['sheetName'],
          fileListSheet['rows'][index]['fileTitle']),
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
