// ignore_for_file: file_names

import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/alayouts/byvalue/byvaluecard_byvalue.dart';
import 'package:sheetviewer/AL/elements/bycond/filelistcard_bycond_select1.dart';
import 'package:sheetviewer/AL/elements/getrows/firstLast/_firstlastrow.dart';

import 'package:sheetviewer/DL/models/zsheetconfig.dart';
import 'package:sheetviewer/DL/models/sheetviewconfig.dart';

Card filelistCard(BuildContext context, Map fileListSheetRow, int index,
    SheetViewConfig sheetViewConfig) {
  ExpansionTileCard expansionFilelistCard() {
    final GlobalKey<ExpansionTileCardState> cardA = GlobalKey();

    createSheetConfigIfNotExists(
        sheetViewConfig.fileId, fileListSheetRow['sheetName']);

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
        firstLastRow(context, index, sheetViewConfig),

        //-------------------------------------------------------------last/byValues

        ListTile(
            tileColor: Colors.lightBlue[200],
            title: Row(
              children: [
                const Text('by value: ', style: TextStyle(fontSize: 20)),
                ElevatedButton(
                    onPressed: () {},
                    child: const Text('col2', style: TextStyle(fontSize: 20))),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.chevron_right),
              onPressed: () async {
                await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ByValuePage(sheetViewConfig.fileId,
                          fileListSheetRow['sheetName']),
                    ));
              },
            )),
        //-------------------------------------------------------------All/select1
        ListTile(
            tileColor: Colors.lightBlue[300],
            title: Row(
              children: [
                const Text('by cond: ', style: TextStyle(fontSize: 20)),
                ElevatedButton(
                    onPressed: () async {},
                    child:
                        const Text('filter', style: TextStyle(fontSize: 20))),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.chevron_right),
              onPressed: () async {
                SheetConfig sheetConfig = await getSheetConfig(
                    sheetViewConfig.fileId, fileListSheetRow['sheetName']);

                await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ByCondSelect1(sheetConfig),
                    ));
              },
            )),
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
