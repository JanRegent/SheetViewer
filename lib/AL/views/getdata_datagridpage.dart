// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/DL/isardb/sheetview.dart';
import 'package:sheetviewer/DL/getdata_models.dart';

import 'plutogrid/_plutogridpage.dart';
import 'plutogrid/cols.dart';
import 'plutogrid/rows.dart';

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
  List<PlutoColumn> cols = [];
  List<PlutoRow> gridrows = [];
  Future<String> getData() async {
    sheetView =
        await sheetViewGetData(widget.fileId, widget.sheetName, widget.action);
    // sheetView.colsHeader = await interestStore2.readListStringSheet(
    //     widget.sheetName, widget.fileId, 'colsHeader', sheetView.cols);

    cols = await colsHeader(sheetView);
    gridrows = await gridRows(sheetView);
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
              return PlutogridPage(sheetView, 'fileTitle', cols, gridrows);
              //return DatagridPage(sheetView, 'fileTitle');
            }
        }
      },
    ));
  }
}
