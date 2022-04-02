// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/alayouts/byvalue/byvaluepage.dart';
import 'package:sheetviewer/AL/alayouts/lastgrid/lastgridpage.dart';
import 'package:sheetviewer/BL/actionSheet/getsheet.dart';
import 'package:sheetviewer/DL/getdata_models.dart';
import 'package:sheetviewer/DL/models/sheetviewconfig.dart';

class FileListPage extends StatefulWidget {
  final String layout;
  final Map selectedInterestRow;
  const FileListPage(this.layout, this.selectedInterestRow, {Key? key})
      : super(key: key);

  @override
  _FileListPageState createState() => _FileListPageState();
}

class _FileListPageState extends State<FileListPage> {
  @override
  void initState() {
    super.initState();
  }

  List<SheetViewConfig> sheetViewConfigs = [];

  late Map fileListSheet = {};
  Future<String> getData() async {
    fileListSheet = await getSheet(widget.selectedInterestRow['fileUrl'],
        widget.selectedInterestRow['sheetName']);

    sheetViewConfigs = await fileListSheet2sheetViewConfigs(
        fileListSheet, {'action': 'getRowsLast', 'rowsCount': '10'});

    return 'ok';
  }

  Widget fileListBuilder(String layout) {
    return FutureBuilder<String>(
      future: getData(), // async work
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Column(
              children: const [
                Text('Loading sheet config...'),
                Text(' '),
                Text(' '),
                CircularProgressIndicator()
              ],
            );

          default:
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              if (widget.layout == 'lastGrid') {
                return LastGridPage(widget.selectedInterestRow, fileListSheet,
                    sheetViewConfigs);
              } else {
                return ByvaluePage(widget.selectedInterestRow, fileListSheet,
                    sheetViewConfigs);
              }
            }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: fileListBuilder(widget.layout),
        ));
  }
}
