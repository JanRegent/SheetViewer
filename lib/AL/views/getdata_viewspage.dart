// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:sheetviewer/AL/elementsLib/alib.dart';

import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/BL/lib/log.dart';
import 'package:sheetviewer/DL/dlglobals.dart';
import 'package:sheetviewer/DL/isardb/sheetrows.dart';

import 'plutogrid/_asyncgrid.dart';
import 'plutogrid/drawer.dart';

/// The home page of the application which hosts the datagrid.
class GetDataViewsPage extends StatefulWidget {
  final String sheetName;
  final String fileId;
  final String action;
  final String fileTitle;

  // ignore: use_key_in_widget_constructors
  const GetDataViewsPage(
      this.sheetName, this.fileId, this.action, this.fileTitle);

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
  List<String> cols = [];
  List<PlutoRow> gridrows = [];
  List<SheetRow?> sheetRows = [];
  Future<String> getData4view(BuildContext context) async {
    await rowsCountCheck(widget.fileId, widget.sheetName);
    sheetRows =
        await sheetRowsDb.readRowsSheet(widget.fileId, widget.sheetName);
    cols = await sheetRowsDb.readCols(widget.fileId, widget.sheetName);

    rowsCount.value = sheetRows.length;

    //bug _FutureBuilderState<String>#a0df7): Unexpected null value
    //packages/pluto_grid/src/manager/pluto_grid_state_manager.dart 292:44
    return 'OK';
  }

  Future<String> rowsCountCheck(String fileId, String sheetName) async {
    int rowsCount = await sheetRowsDb.rowsCount(fileId, sheetName);
    logi('getData4view', 'rowsCount', sheetName, rowsCount.toString());
    if (rowsCount > 1) return 'ok';

    try {
      logi('getData4view', 'getSheetAllRows', sheetName, '--------');

      await dlGlobals.getSheetsService
          .getSheetAllRows(fileId, sheetName, true, 'sheetRowsDb');
    } catch (e) {
      logi('getData4view', 'getSheetAllRows', sheetName, e.toString());
    }
    return 'ok';
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
        drawer:
            plutoDrawer(context, setStateFunc, widget.fileId, widget.sheetName),
        appBar: AppBar(title: appBarTile(context)),
        body: FutureBuilder(
          future: getData4view(context), // async work
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
                    const Text(' '),
                    const CircularProgressIndicator()
                  ],
                );

              default:
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return AsyncGrid(cols, sheetRows);
                }
            }
          },
        ));
  }
}
