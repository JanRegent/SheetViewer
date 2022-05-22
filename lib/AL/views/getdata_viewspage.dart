// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:sheetviewer/AL/elementsLib/alib.dart';
import 'package:sheetviewer/BL/bl.dart';

import 'package:sheetviewer/DL/getdata_models.dart';

import 'plutogrid/_plutogridpage.dart';
import 'plutogrid/cols.dart';
import 'plutogrid/drawer.dart';
import 'plutogrid/rows.dart';

/// The home page of the application which hosts the datagrid.
class GetDataViewsPage extends StatefulWidget {
  final String sheetName;
  final String fileId;
  final String action;
  final String fileTitle;
  final List<List<int>> getPlan;
  // ignore: use_key_in_widget_constructors
  const GetDataViewsPage(
      this.sheetName, this.fileId, this.action, this.fileTitle, this.getPlan);

  @override
  _GetDataViewsPageState createState() => _GetDataViewsPageState();
}

class _GetDataViewsPageState extends State<GetDataViewsPage> {
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
  Future<String> getData(BuildContext context) async {
    print(widget.getPlan);
    sheetViewDrawer =
        await sheetViewGetData(widget.fileId, widget.sheetName, widget.action);
    sheetViewDrawer.colsHeader = await interestStore2.readListStringSheet(
        widget.sheetName, widget.fileId, 'colsHeader', sheetViewDrawer.cols);
    counter++;

    cols.clear();
    if (cols.isEmpty) cols = await colsHeader(sheetViewDrawer.colsHeader);
    gridrows.clear();
    if (gridrows.isEmpty) gridrows = await gridRows(sheetViewDrawer, context);

    return 'OK';
  }

  ListTile appBarTile(BuildContext context) {
    return ListTile(
        leading: al.iconBack(context), title: Text(widget.fileTitle));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: plutoDrawer(context, setStateFunc),
        appBar: AppBar(title: appBarTile(context)),
        body: FutureBuilder(
          future: getData(context), // async work
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Column(
                  children: [
                    Text('Loading \n interest ' +
                        interestContr.interestName.value.toString() +
                        ' \n' +
                        interestContr.cardType +
                        '\n\n'),
                    const CircularProgressIndicator()
                  ],
                );

              default:
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return PlutogridPage(
                      widget.fileTitle, cols, gridrows, sheetViewDrawer);
                }
            }
          },
        ));
  }
}
