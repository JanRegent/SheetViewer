// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:sheetviewer/AL/views/gridview/_datagridpage.dart';
import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/BL/sheet/filelistsheet.dart';
import 'package:sheetviewer/DL/loader/loader.dart';

import 'filelistviewmenu.dart';

ExpansionTileCard filelistCard(
    BuildContext context, FileListSheet fileListSheet, int index) {
  final GlobalKey<ExpansionTileCardState> cardA = GlobalKey();

  ElevatedButton last5(String fileId, int index) {
    Future showGrid() async {
      await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DatagridPage(
                fileId,
                fileListSheet.rows[index]['sheetName'],
                fileListSheet.rows[index]['fileTitle']),
          ));
    }

    return ElevatedButton(
        child: Icon(Icons.last_page),
        onPressed: () async {
          await showGrid();
        },
        onLongPress: () async {
          await getdatasheetRefresh(
              fileId, fileListSheet.rows[index]['sheetName']);
          await showGrid();
        });
  }

  return ExpansionTileCard(
    baseColor: Colors.cyan[50],
    expandedColor: Colors.red[50],
    key: cardA,
    leading: CircleAvatar(child: const Text('1')),
    title: Text(fileListSheet.rows[index]['fileTitle'],
        style: const TextStyle(fontSize: 20)),
    subtitle: const Text("FLUTTER DEVELOPMENT COMPANY"),
    children: <Widget>[
      const Divider(
        thickness: 1.0,
        height: 3.0,
      ),
      ListTile(
          tileColor: Colors.lightBlue[200],
          isThreeLine: true,
          leading: last5(
              bl.bLuti.url2fileid(fileListSheet.rows[index]['fileUrl']), index),
          subtitle: Text(fileListSheet.rows[index]['fileTitle'],
              style: const TextStyle(fontSize: 20)),
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
      Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: Text(
            "FlutterDevs specializes in creating cost-effective and efficient applications with our perfectly crafted,"
            " creative and leading-edge flutter app development solutions for customers all around the globe.",
            style:
                Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 16),
          ),
        ),
      ),
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
