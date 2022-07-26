// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:sheetviewer/AL/elementsLib/alib.dart';
import 'package:sheetviewer/AL/views/plutogrid/cols.dart';

import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/BL/lib/log.dart';
import 'package:sheetviewer/DL/dlglobals.dart';
import 'package:sheetviewer/BL/isardb/sheetrows.dart';

import 'plutogrid/_gridpage.dart';
import 'plutogrid/drawergrid.dart';

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
    logParagraphStart('getData4view');
    logi('fileId sheetName ', widget.fileId, widget.sheetName, '');
    await viewHelper.load(widget.fileId, widget.sheetName);

    //---------------------------------------------------------------------cols
    /// Columns must be provided at the beginning of a row synchronously.
    viewHelper.plutoCols.clear();
    viewHelper.plutoCols
        .addAll(await colsMap(viewHelper.viewConfig.colsHeader));
    logi('viewHelper.plutoCols.length ', viewHelper.plutoCols.length.toString(),
        '', '');
    //---------------------------------------------------------------------rows

    await rowsCountCheck(widget.fileId, widget.sheetName);

    if (filelistContr.searchWordInAllSheets.value.isEmpty) {
      sheetRows =
          await sheetRowsDb.readRowsSheet(widget.fileId, widget.sheetName);
    } else {
      sheetRows = await sheetRowsDb.readRowsContains(widget.fileId,
          widget.sheetName, filelistContr.searchWordInAllSheets.value);
    }
    rowsCount.value = sheetRows.length;
    logi('rowsCount.value ', rowsCount.value.toString(), '',
        '=sheetRows.length');
    debugPrint('sheetRows.length ' + sheetRows.length.toString());
    //debugPrint(viewHelper.viewConfig.toString());
    //bug _FutureBuilderState<String>#a0df7): Unexpected null value
    //packages/pluto_grid/src/manager/pluto_grid_state_manager.dart 292:44
    return 'OK';
  }

  Future<String> rowsCountCheck(String fileId, String sheetName) async {
    logParagraphStart('getData4view.rowsCountCheck($fileId, $sheetName');
    int rowsCount = await sheetRowsDb.rowsCount(fileId, sheetName);
    logi('getData4view', 'rowsCountCheck0', sheetName + 'from: $fileId',
        'rowsCount: ' + rowsCount.toString());
    if (rowsCount > 1) return 'ok';

    try {
      rowsCount = await dlGlobals.gSheetsAdapter
          .getSheetAllRowsOld(fileId, sheetName, true, 'sheetRowsDb');

      logi('rowsCountCheck', 'final', sheetName + 'from: $fileId', '');
    } catch (e) {
      logi('rowsCountCheck', 'error', sheetName, e.toString());
    }
    return 'ok';
  }

  ListTile appBarTile(BuildContext context) {
    return ListTile(
        leading: al.iconBack(context), title: Text(widget.fileTitle));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: drawerGrid(
            context, setStateFunc, widget.fileId, widget.sheetName, cols),
        appBar: AppBar(title: appBarTile(context)),
        body: FutureBuilder(
          future: getData4view(context), // async work
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Column(
                  children: [
                    Text('Loading \n ' +
                        widget.sheetName +
                        ' \n from: ' +
                        widget.fileId +
                        '\n\n'),
                    Obx(() => Text(filelistContr.fetshingRows.value)),
                    const Text(' '),
                    const CircularProgressIndicator()
                  ],
                );

              default:
                if (snapshot.hasError) {
                  return Text('GetDataViewsPage Error: ${snapshot.error}');
                } else {
                  if (sheetRows.isNotEmpty) return GridPage(sheetRows);
                  if (filelistContr.searchWordInAllSheets.value.isEmpty) {
                    return Text('Sheet ${widget.sheetName} is empty');
                  }
                  return Text(
                      'Sheet ${widget.sheetName} filter result is empty\n filter is: \n rows contains ${filelistContr.searchWordInAllSheets.value}');
                }
            }
          },
        ));
  }
}
