// ignore_for_file: file_names

import 'dart:core';

import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';

import 'package:sheetviewer/AL/elements/getrows/getrows.dart';
import 'package:sheetviewer/BL/bl.dart';

Card filelistCard(
    String cardType, BuildContext context, Map fileListSheetRow, int index) {
  List<Widget> getLements() {
    List<Widget> rowWigs = [];

    if (cardType == 'byRows') {
      rowWigs.add(allRowsButton(
          context,
          fileListSheetRow['sheetName'],
          bl.blUti.url2fileid(fileListSheetRow['fileUrl']),
          fileListSheetRow['fileTitle']));
      rowWigs.add(const Text('  '));
      rowWigs.add(firstButton(
          context,
          fileListSheetRow['sheetName'],
          bl.blUti.url2fileid(fileListSheetRow['fileUrl']),
          fileListSheetRow['fileTitle']));
      rowWigs.add(const Text('  '));
      rowWigs.add(lastButton(
          context,
          fileListSheetRow['sheetName'],
          bl.blUti.url2fileid(fileListSheetRow['fileUrl']),
          fileListSheetRow['fileTitle']));
    }
    if (cardType == 'lastRows') {
      rowWigs.add(lastRow(
          context,
          fileListSheetRow['sheetName'],
          bl.blUti.url2fileid(fileListSheetRow['fileUrl']),
          fileListSheetRow['fileTitle']));
    }

    if (cardType == 'firstRows') {
      rowWigs.add(firstRows(
          context,
          fileListSheetRow['sheetName'],
          bl.blUti.url2fileid(fileListSheetRow['fileUrl']),
          fileListSheetRow['fileTitle']));
    }
    if (cardType == 'allRows') {
      rowWigs.add(allRows(
          context,
          fileListSheetRow['sheetName'],
          bl.blUti.url2fileid(fileListSheetRow['fileUrl']),
          fileListSheetRow['fileTitle']));
    }
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
          await getrowsRefresh(
              fileListSheetRow['fileUrl'], fileListSheetRow['sheetName']);
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
