// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/views/gridview/_datagridpage.dart';
import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/DL/isardb/sheetview.dart';
import 'package:sheetviewer/DL/getdata_models.dart';

/// The home page of the application which hosts the datagrid.
class GetDataDatagridPage extends StatefulWidget {
  final String sheetName;
  final String fileId;
  final String action;

  // ignore: use_key_in_widget_constructors
  const GetDataDatagridPage(this.sheetName, this.fileId, this.action);

  @override
  _GetDataDatagridPageState createState() => _GetDataDatagridPageState();
}

class _GetDataDatagridPageState extends State<GetDataDatagridPage> {
  @override
  void initState() {
    super.initState();
  }

  SheetView sheetView = SheetView()..aStatus = 'info:empty';

  Future<String> getData() async {
    sheetView =
        await sheetViewGetData(widget.fileId, widget.sheetName, widget.action);
    String cols = await interestStore2.readVar(widget.sheetName, widget.fileId,
        'colsHeader', sheetView.cols.join('__|__'));
    print(cols);
    sheetView.colsHeader = cols.split('__|__');
    return 'OK';
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
              return DatagridPage(sheetView, 'fileTitle');
            }
        }
      },
    ));
  }
}
