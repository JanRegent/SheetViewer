// ignore_for_file: file_names

import 'dart:core';

import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';

import 'package:sheetviewer/AL/elements/getrows/getrows.dart';
import 'package:sheetviewer/AL/views/getdata_gridpage.dart';
import 'package:sheetviewer/BL/bl.dart';

Card searchByWordsCard(String cardType, BuildContext context,
    Map fileListSheetRow, int index, String word4search) {
  Widget wordSelect() {
    return IconButton(onPressed: () {}, icon: const Icon(Icons.wordpress));
  }

  Widget doSearch() {
    return IconButton(
        onPressed: () async {
          String fileId = bl.blUti.url2fileid(fileListSheetRow['fileUrl']);
          String sheetName = fileListSheetRow['sheetName'];

          await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GetDataViewsPage(
                    sheetName, fileId, 'search', 'search title'),
              ));
        },
        icon: const Icon(Icons.search));
  }

  List<Widget> getLements() {
    List<Widget> rowWigs = [];

    rowWigs.add(allRows(
        context,
        fileListSheetRow['sheetName'],
        bl.blUti.url2fileid(fileListSheetRow['fileUrl']),
        fileListSheetRow['fileTitle']));

    rowWigs.add(const Text('  '));
    rowWigs.add(wordSelect());
    rowWigs.add(const Text('  '));
    rowWigs.add(Text(word4search));
    rowWigs.add(const Text('  '));
    rowWigs.add(doSearch());
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
