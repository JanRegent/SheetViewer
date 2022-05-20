// ignore_for_file: file_names

import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';

import 'package:sheetviewer/AL/elements/getrows/firstlast/firstrows.dart';

Card filelistCardFirstRows(
    BuildContext context, Map fileListSheetRow, int index) {
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
          // await getRowsLastDelete(
          //     fileId, fileListSheet['rows'][index]['sheetName']);
        },
      ),
      title: Text(fileListSheetRow['fileTitle'],
          style: const TextStyle(fontSize: 20, color: Colors.black)),
      subtitle: const Text("FLUTTER DEVELOPMENT COMPANY2",
          style: TextStyle(fontSize: 10, color: Colors.black)),
      children: <Widget>[
        firstRows(context, fileListSheetRow['sheetname'],
            fileListSheetRow['fileId'], fileListSheetRow['fileTitle']),
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
