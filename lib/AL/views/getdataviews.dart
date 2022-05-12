// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/views/gridview/_datagridpage.dart';
import 'package:sheetviewer/DL/isardb/sheetview.dart';
import 'package:sheetviewer/DL/getdata_models.dart';

/// The home page of the application which hosts the datagrid.
class GetDataViewsPage extends StatefulWidget {
  final String sheetName;
  final String fileId;
  final String action;

  // ignore: use_key_in_widget_constructors
  const GetDataViewsPage(this.sheetName, this.fileId, this.action);

  @override
  _GetDataViewsPageState createState() => _GetDataViewsPageState();
}

class _GetDataViewsPageState extends State<GetDataViewsPage> {
  @override
  void initState() {
    super.initState();
  }

  SheetView sheetView = SheetView()..aStatus = 'info:empty';

  Future<String> getData() async {
    sheetView = (await sheetViewGetData(
        widget.fileId, widget.sheetName, widget.action))!;

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
