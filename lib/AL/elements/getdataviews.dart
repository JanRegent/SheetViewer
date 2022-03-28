// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/views/gridview/_datagridpage.dart';
import 'package:sheetviewer/DL/models/sheetview.dart';
import 'package:sheetviewer/DL/getdata_models.dart';
import 'package:sheetviewer/DL/models/sheetviewconfig.dart';

/// The home page of the application which hosts the datagrid.
class GetDataPage extends StatefulWidget {
  final String action;
  final SheetViewConfig sheetViewConfig;

  // ignore: use_key_in_widget_constructors
  const GetDataPage(this.action, this.sheetViewConfig);

  @override
  _GetDataPageState createState() => _GetDataPageState();
}

class _GetDataPageState extends State<GetDataPage> {
  @override
  void initState() {
    super.initState();
  }

  SheetView sheetView = SheetView()..aStatus = 'info:empty';

  String searchWord = ''; // 'ship';
  Future<String> getData() async {
    sheetView = (await sheetViewGetData(
        widget.sheetViewConfig.fileId,
        widget.sheetViewConfig.sheetName,
        widget.action,
        widget.sheetViewConfig))!;

    return 'OK';
  }

  IconButton jsonViewer() {
    return IconButton(
        onPressed: () async {
          //bl.dataSheet4debug = actionSheet;
          // await Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) =>
          //             JsonViewerPage(bl.dataSheet4debug.rawDataSheet)));
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
              return DatagridPage(sheetView,
                  widget.sheetViewConfig.fileListSheetRow['fileTitle']);
            }
        }
      },
    ));
  }
}
