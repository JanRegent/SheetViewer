// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:sheetviewer/AL/elementsLib/alib.dart';
import 'package:sheetviewer/AL/views/plutogrid/colsmap.dart';
import 'package:sheetviewer/AL/views/plutogrid/rowsgridpage.dart';
import 'package:sheetviewer/AL/views/plutogrid/rowsmap.dart';

import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/DL/isardb/sheetrows.dart';

import 'package:sheetviewer/DL/isardb/sheetview.dart';

import 'plutogrid/drawer.dart';

/// The home page of the application which hosts the datagrid.
class GetDataViewsPage extends StatefulWidget {
  final String sheetName;
  final String fileId;
  final String action;
  final String fileTitle;
  final String getBatch;

  // ignore: use_key_in_widget_constructors
  GetDataViewsPage(
      this.sheetName, this.fileId, this.action, this.fileTitle, this.getBatch,
      {SheetView? sheetview}) {
    if (sheetview != null) {
      sheetViewFromSearch = true;
      sheetViewDrawer = sheetview;
    }
  }

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

  List<PlutoColumn> gridCols = [];
  List<PlutoRow> gridrows = [];
  List<SheetRow?> sheetRows = [];
  Future<String> getData(BuildContext context) async {
    // if (!sheetViewFromSearch) {
    //   sheetViewDrawer = (await sheetViewGetData(
    //       widget.fileId, widget.sheetName, widget.action, widget.getBatch))!;

    //   if (sheetViewDrawer.aStatus.startsWith('err')) {
    //     throw sheetViewDrawer.aStatus;
    //   }
    // }
    // sheetViewDrawer.colsHeader = await interestStore2.readListStringSheet(
    //     widget.sheetName, widget.fileId, 'colsHeader', sheetViewDrawer.cols);
    sheetRows = await sheetRowsDb.readRowsAll();
    List<String> cols = await sheetRowsDb.readCols();

    gridCols.clear();
    gridCols = await colsHeaderMap(cols);

    gridrows.clear();
    gridrows = await gridRowsMap(sheetRows, cols, context);

    return 'OK';
  }

  ListTile appBarTile(BuildContext context) {
    return ListTile(
        leading: al.iconBack(context),
        title: plutogridContr.multilineDetailLayuout.value.isNotEmpty
            ? Text(widget.fileTitle + ' column wiew')
            : Text(widget.fileTitle));
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
                    Obx(() => Text(interestContr.fetshingRows.value)),
                    const CircularProgressIndicator()
                  ],
                );

              default:
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return RowsgridPage(gridCols, gridrows, sheetRows);
                }
            }
          },
        ));
  }
}
