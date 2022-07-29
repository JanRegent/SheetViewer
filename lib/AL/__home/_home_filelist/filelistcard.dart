// ignore_for_file: file_names

import 'dart:core';

import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sheetviewer/AL/views/getdata_gridpage.dart';
import 'package:sheetviewer/AL/views/plutogrid/drawergrid.dart';
import 'package:sheetviewer/AL/views/plutogrid/viewhelper/viewhelper.dart';
import 'package:sheetviewer/BL/bl.dart';

Card filelistCard(BuildContext context, Map fileListSheetRow, int index) {
  List<Widget> getLements() {
    List<Widget> rowWigs = [];

    rowWigs.add(allRowsButton(
        context,
        fileListSheetRow['sheetName'],
        bl.blUti.url2fileid(fileListSheetRow['fileUrl']),
        fileListSheetRow['fileTitle']));
    rowWigs.add(const Text('  '));

    return rowWigs;
  }

  ExpansionTileCard expansionFilelistCard() {
    final GlobalKey<ExpansionTileCardState> cardA = GlobalKey();
    return ExpansionTileCard(
      baseColor: Colors.cyan[50],
      expandedColor: Colors.red[50],
      key: cardA,
      initiallyExpanded: index == 0 ? true : false,
      leading: IconButton(
        icon: const Icon(Icons.refresh),
        tooltip: 'Clear for refresh',
        onPressed: () async {
          String fileId = bl.blUti.url2fileid(fileListSheetRow['fileUrl']);
          sheetRowsDb.delete(fileId, fileListSheetRow['sheetName']);
        },
      ),
      title: Text(fileListSheetRow['fileTitle'],
          style: const TextStyle(fontSize: 20, color: Colors.black)),
      subtitle: const Text("FLUTTER DEVELOPMENT COMPANY2",
          style: TextStyle(fontSize: 10, color: Colors.black)),
      children: [
        const Text('     '),
        Row(
          children: getLements(),
        )
      ],
    );
  }

  return Card(
    shape: RoundedRectangleBorder(
      side: BorderSide.merge(
          const BorderSide(
              width: 1.5, color: Colors.lightBlue, style: BorderStyle.solid),
          const BorderSide(
              width: 1.5, color: Colors.lightBlue, style: BorderStyle.solid)),
      borderRadius: BorderRadius.circular(20),
    ),
    color: Colors.white,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [expansionFilelistCard()],
    ),
  );
}

Future showGrid(BuildContext context, String sheetName, String fileId,
    String fileTitle) async {
  viewHelper = ViewHelper();
  await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            GetDataViewsPage(sheetName, fileId, fileTitle, false),
      ));
}

//-------------------------------------------------------------------------all
RxString allRowsButtonlAllRowsLabel = ''.obs;

ElevatedButton allRowsButton(
    BuildContext context, String sheetName, String fileId, String fileTitle) {
  allRowsButtonlAllRowsLabel.value = 'all rows';
  if (filelistContr.searchWordInAllSheets.value.isNotEmpty) {
    allRowsButtonlAllRowsLabel.value = 'all filtered';
  }
  return ElevatedButton.icon(
      label: Obx(() => Text(allRowsButtonlAllRowsLabel.value)),
      icon: const Icon(
        Icons.table_rows_outlined,
        color: Colors.black,
      ),
      onPressed: () async {
        await showGrid(context, sheetName, fileId, fileTitle);
      });
}
