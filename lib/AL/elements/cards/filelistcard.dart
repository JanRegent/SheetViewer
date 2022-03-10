// ignore_for_file: file_names

import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/elements/bycond/filelistcard_bycond_select1.dart';
import 'package:sheetviewer/AL/elements/getrows/firstLast/_firstlastrow.dart';
import 'package:sheetviewer/AL/elements/getrows/firstLast/allrowsbutton.dart';
import 'package:sheetviewer/BL/bl.dart';

import 'package:sheetviewer/DL/models/sheet_config.dart';
import '../../../DL/models/sheet_config2.dart';
import '../../elements/byvalue/filelistcard_byvalue.dart';

Card filelistCard(
    BuildContext context, Function setStateFunc, Map fileListSheet, int index) {
  ExpansionTileCard expansionFilelistCard() {
    final GlobalKey<ExpansionTileCardState> cardA = GlobalKey();
    String fileId =
        bl.blUti.url2fileid(fileListSheet['rows'][index]['fileUrl']);
    createSheetConfigIfNotExists(
        fileId, fileListSheet['rows'][index]['sheetName']);

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
      title: Text(fileListSheet['rows'][index]['fileTitle'],
          style: const TextStyle(fontSize: 20, color: Colors.black)),
      subtitle: const Text("FLUTTER DEVELOPMENT COMPANY2",
          style: TextStyle(fontSize: 10, color: Colors.black)),
      children: <Widget>[
        firstLastRow(context, setStateFunc, fileListSheet, index),

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
                      builder: (context) => ByValuePage(
                          fileId, fileListSheet['rows'][index]['sheetName']),
                    ));
              },
            )),
        //-------------------------------------------------------------All/select1
        ListTile(
            tileColor: Colors.lightBlue[300],
            leading: allRowsButton(
                context,
                fileId,
                fileListSheet['rows'][index]['sheetName'],
                fileListSheet['rows'][index]['fileTitle']),
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
                    fileId, fileListSheet['rows'][index]['sheetName']);

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
