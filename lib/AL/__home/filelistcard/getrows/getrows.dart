import 'package:flutter/material.dart';
import 'package:sheetviewer/BL/bl.dart';

import 'getrowsallbutton.dart';
import 'getrowsfirstbutton.dart';
import 'getrowslastbutton.dart';

Row getRowsRow(BuildContext context, Map fileListSheet, int index) {
  return Row(
    children: [
      //getDropdownItems(),
      getRowsFirstButton(
          context,
          bl.blUti.url2fileid(fileListSheet['rows'][index]['fileUrl']),
          fileListSheet['rows'][index]['sheetName'],
          fileListSheet['rows'][index]['fileTitle']),
      const Text(' '),
      getRowsAllButton(
          context,
          bl.blUti.url2fileid(fileListSheet['rows'][index]['fileUrl']),
          fileListSheet['rows'][index]['sheetName'],
          fileListSheet['rows'][index]['fileTitle']),
      const Text(' '),
      getRowsLastButton(
          context,
          bl.blUti.url2fileid(fileListSheet['rows'][index]['fileUrl']),
          fileListSheet['rows'][index]['sheetName'],
          fileListSheet['rows'][index]['fileTitle'])
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
