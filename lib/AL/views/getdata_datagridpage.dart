// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:sheetviewer/BL/bl.dart';

import 'package:sheetviewer/DL/getdata_models.dart';

import 'plutogrid/_plutogridpage.dart';
import 'plutogrid/cols.dart';
import 'plutogrid/drawer.dart';
import 'plutogrid/rows.dart';

/// The home page of the application which hosts the datagrid.
class GetDataDatagridPage extends StatefulWidget {
  final String sheetName;
  final String fileId;
  final String action;
  final String fileTitle;

  // ignore: use_key_in_widget_constructors
  const GetDataDatagridPage(
      this.sheetName, this.fileId, this.action, this.fileTitle);

  @override
  _GetDataDatagridPageState createState() => _GetDataDatagridPageState();
}

class _GetDataDatagridPageState extends State<GetDataDatagridPage> {
  @override
  void initState() {
    super.initState();
  }

  void setStateFunc() {
    setState(() {});
  }

  int counter = 0;
  //sheetViewDrawer.aStatus =; 'info:empty';
  List<PlutoColumn> cols = [];
  List<PlutoRow> gridrows = [];
  Future<String> getData() async {
    sheetViewDrawer =
        await sheetViewGetData(widget.fileId, widget.sheetName, widget.action);
    sheetViewDrawer.colsHeader = await interestStore2.readListStringSheet(
        widget.sheetName, widget.fileId, 'colsHeader', sheetViewDrawer.cols);
    counter++;

    cols.clear();
    if (cols.isEmpty) cols = await colsHeader(sheetViewDrawer.colsHeader);
    gridrows.clear();
    if (gridrows.isEmpty) gridrows = await gridRows(sheetViewDrawer);

    return 'OK';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: plutoDrawer(context, setStateFunc),
        appBar: AppBar(title: Text(widget.fileTitle)),
        body: FutureBuilder(
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
                  return PlutogridPage(widget.fileTitle, cols, gridrows);
                  //return DatagridPage(sheetView, 'fileTitle');
                }
            }
          },
        ));
  }
}
