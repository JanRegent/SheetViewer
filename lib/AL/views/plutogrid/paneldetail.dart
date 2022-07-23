import 'dart:convert';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheetviewer/AL/views/plutogrid/drawergrid.dart';
import 'package:sheetviewer/BL/isardb/sheetrows.dart';

double fontSize = 25;

RxString detailContent = ''.obs;
String detailColumnField = '';

//  RxMap rxRow = {}.obs;
RxList detailList = [].obs;
RxList getDetailList(List<SheetRow?> sheetRows) {
  if (currentRowNo > 2) currentRowNo = currentRowNo - 2; //-header,-array from 0
  SheetRow? sheetRow = sheetRows[currentRowNo];
  Map row = jsonDecode(sheetRow!.row);

  detailList.clear();
  for (var key in row.keys) {
    detailList.add([key, row[key]]);
  }
  return detailList;
}

Widget detailPanel(ScrollController _controller, Function setStateFunc) {
  List<Widget> colItems() {
    List<Widget> items = [];
    items.add(Row(
      children: [
        IconButton(
          tooltip: 'Close detail panel',
          icon: const Icon(Icons.close),
          onPressed: () {
            detailMode = false;
            setStateFunc();
          },
        ),
        IconButton(
          tooltip: 'Copy current cell',
          icon: const Icon(Icons.copy),
          onPressed: () {
            FlutterClipboard.copy(detailContent.value).then((value) => {
                  //rint('copied')
                });
          },
        ),
        IconButton(
            tooltip: 'Copy current row',
            icon: const Icon(Icons.copy_all),
            onPressed: () {})
      ],
    ));
    items.add(const Divider(height: 4));
    items.add(Obx(() => Text(
          detailContent.value,
          style: TextStyle(fontSize: fontSize),
        )));
    items.add(const Divider(color: Colors.blue));

    int key = 0;
    int value = 1;
    for (var i = 0; i < detailList.length; i++) {
      if (detailColumnField == detailList[i][key]) {
        continue;
      } //is at first position yet
      try {
        items.add(ListTile(
          leading: Obx(() => Text(detailList[i][key] + ': ')),
          title: Obx(() => Text(detailList[i][value].toString())),
        ));
        items.add(const Divider(color: Colors.blue));
      } catch (_) {}
    }
    return items;
  }

  return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.blueGrey[50],
      child: ListView(
        controller: _controller,
        children: colItems(),
      ));
}
