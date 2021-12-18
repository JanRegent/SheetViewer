// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/BL/sheet/filelistsheet.dart';

import 'filelistcard_bl.dart';
import 'filelistcard_bycond_select1.dart';
import 'filelistcard_byvalue.dart';

ExpansionTileCard expansionFilelistCard(
    BuildContext context, FileListSheet fileListSheet, int index) {
  final GlobalKey<ExpansionTileCardState> cardA = GlobalKey();
  String fileId = bl.bLuti.url2fileid(fileListSheet.rows[index]['fileUrl']);
  return ExpansionTileCard(
    baseColor: Colors.cyan[50],
    expandedColor: Colors.red[50],
    key: cardA,
    title: Text(fileListSheet.rows[index]['fileTitle'],
        style: const TextStyle(fontSize: 20, color: Colors.black)),
    subtitle: const Text("FLUTTER DEVELOPMENT COMPANY",
        style: TextStyle(fontSize: 10, color: Colors.black)),
    children: <Widget>[
      //-------------------------------------------------------------last/byValues

      ListTile(
          tileColor: Colors.lightBlue[200],
          leading: last5(
              context,
              bl.bLuti.url2fileid(fileListSheet.rows[index]['fileUrl']),
              fileListSheet.rows[index]['sheetName'],
              fileListSheet.rows[index]['fileTitle']),
          title: Row(
            children: [
              Text('by value: ', style: TextStyle(fontSize: 20)),
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
                        fileId, fileListSheet.rows[index]['sheetName']),
                  ));
            },
          )),
      //-------------------------------------------------------------All/select1
      ListTile(
          tileColor: Colors.lightBlue[300],
          leading: showAll(
              context,
              fileId,
              fileListSheet.rows[index]['sheetName'],
              fileListSheet.rows[index]['fileTitle']),
          title: Row(
            children: [
              Text('by cond: ', style: TextStyle(fontSize: 20)),
              ElevatedButton(
                  onPressed: () async {},
                  child: const Text('filter', style: TextStyle(fontSize: 20))),
            ],
          ),
          trailing: IconButton(
            icon: const Icon(Icons.chevron_right),
            onPressed: () async {
              await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ByCondSelect1(
                        fileId, fileListSheet.rows[index]['sheetName']),
                  ));
            },
          )),
    ],
  );
}
