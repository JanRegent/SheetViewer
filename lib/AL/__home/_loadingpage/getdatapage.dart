// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/pages/views/gridview/_datagridpage.dart';
import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/BL/datasheet/getdata_bl.dart';

import 'package:sheetviewer/uti/viewers/json_viewer.dart';

import '../../../../BL/datasheet/datasheet.dart';

/// The home page of the application which hosts the datagrid.
class GetDataPage extends StatefulWidget {
  final String fileId;
  final String sheetName;
  final String sheetTitle;
  final Map queryMap;
  // ignore: use_key_in_widget_constructors
  const GetDataPage(
    this.fileId,
    this.sheetName,
    this.sheetTitle,
    this.queryMap,
  );

  @override
  _GetDataPageState createState() => _GetDataPageState();
}

class _GetDataPageState extends State<GetDataPage> {
  @override
  void initState() {
    super.initState();
  }

  DataSheet dataSheet = DataSheet();
  String searchWord = ''; // 'ship';
  Future<String> getData() async {
    dataSheet =
        await getDataBL(widget.fileId, widget.sheetName, widget.queryMap);
    dataSheet.sheetTitle = widget.sheetTitle;
    dataSheet.fileId = widget.fileId;
    dataSheet.sheetName = widget.sheetName;
    dataSheet.queryMap = widget.queryMap;
    return 'OK';
  }

  IconButton jsonViewer() {
    return IconButton(
        onPressed: () async {
          bl.dataSheet4debug = dataSheet;
          await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      JsonViewerPage(bl.dataSheet4debug.rawDataSheet)));
        },
        icon: const Icon(Icons.view_agenda));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<String>(
      future: getData(), // async work
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
              //Navigator.pop(context, dataSheet);
              return DatagridPage(dataSheet);
            }
        }
      },
    ));
  }
}
