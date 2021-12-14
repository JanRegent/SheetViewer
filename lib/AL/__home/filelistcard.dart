// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/BL/sheet/filelistsheet.dart';

import 'filelistcard2.dart';
import 'filelistviewmenu.dart';

ExpansionTileCard filelistCard(
    BuildContext context, FileListSheet fileListSheet, int index) {
  final GlobalKey<ExpansionTileCardState> cardA = GlobalKey();

  return ExpansionTileCard(
    baseColor: Colors.cyan[50],
    expandedColor: Colors.red[50],
    key: cardA,
    title: Text(fileListSheet.rows[index]['fileTitle'],
        style: const TextStyle(fontSize: 20)),
    subtitle: const Text("FLUTTER DEVELOPMENT COMPANY"),
    children: <Widget>[
      //-------------------------------------------------------------last/byValues
      ListTile(
          tileColor: Colors.lightBlue[200],
          isThreeLine: true,
          leading: last5(
              context,
              bl.bLuti.url2fileid(fileListSheet.rows[index]['fileUrl']),
              fileListSheet.rows[index]['sheetName'],
              fileListSheet.rows[index]['fileTitle']),
          subtitle: Text('', style: const TextStyle(fontSize: 20)),
          title: Row(
            children: [
              ElevatedButton(
                  onPressed: () {},
                  child: const Text('col1', style: TextStyle(fontSize: 20))),
              ElevatedButton(
                  onPressed: () {},
                  child: const Text('col2', style: TextStyle(fontSize: 20))),
            ],
          ),
          trailing: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () async {
              await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FilelistDialogPage(title: 'by values'),
                  ));
            },
          )),
      //-------------------------------------------------------------All/selects
      ListTile(
          tileColor: Colors.lightBlue[100],
          isThreeLine: true,
          leading: showAll(
              context,
              bl.bLuti.url2fileid(fileListSheet.rows[index]['fileUrl']),
              fileListSheet.rows[index]['sheetName'],
              fileListSheet.rows[index]['fileTitle']),
          subtitle: Text('', style: const TextStyle(fontSize: 20)),
          title: Row(
            children: [
              ElevatedButton(
                  onPressed: () {},
                  child: const Text('all', style: TextStyle(fontSize: 20))),
              ElevatedButton(
                  onPressed: () {},
                  child: const Text('filter', style: TextStyle(fontSize: 20))),
            ],
          ),
          trailing: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () async {
              await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FilelistDialogPage(title: 'xxc'),
                  ));
            },
          )),
      ButtonBar(
        alignment: MainAxisAlignment.spaceAround,
        buttonHeight: 52.0,
        buttonMinWidth: 90.0,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              cardA.currentState?.expand();
            },
            child: Column(
              children: const <Widget>[
                Icon(Icons.arrow_downward),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.0),
                ),
                Text('Open'),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              cardA.currentState?.collapse();
            },
            child: Column(
              children: const <Widget>[
                Icon(Icons.arrow_upward),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.0),
                ),
                Text('Close'),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Column(
              children: const <Widget>[
                Icon(Icons.swap_vert),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.0),
                ),
                Text('Toggle'),
              ],
            ),
          ),
        ],
      ),
    ],
  );
}
