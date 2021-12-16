// ignore_for_file: file_names, prefer_const_constructors_in_immutables, unused_element, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:sheetviewer/BL/sheet/sheetConfig.dart';
import 'package:sheetviewer/DL/loader/loader.dart';

class ByValePage extends StatefulWidget {
  final String fileId;
  final String sheetName;
  ByValePage(this.fileId, this.sheetName);

  @override
  _ByValePageState createState() => _ByValePageState();
}

class _ByValePageState extends State<ByValePage> {
  SheetConfig sheetConfig = SheetConfig();

  Future<String> getConfig() async {
    sheetConfig = await getSheetConfig(widget.fileId, widget.sheetName);

    print(sheetConfig.toString());

    return 'ok';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Filter by value'),
          actions: [
            IconButton(
                icon: const Icon(
                  Icons.cut,
                  color: Colors.black,
                ),
                tooltip: 'Settings',
                onPressed: () async {
                  // await Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => TextParserPage()),
                  // );
                }),
          ],
        ),
        body: FutureBuilder<String>(
          future: getConfig(), // async work
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Column(
                  children: const [
                    Text('Loading....'),
                    CircularProgressIndicator()
                  ],
                );

              default:
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  //print(fileListSheet.rows);
                  return const Text('22');
                }
            }
          },
        ));
  }
}
