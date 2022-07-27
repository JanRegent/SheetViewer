import 'package:pluto_grid/pluto_grid.dart';
import 'package:sheetviewer/AL/views/plutogrid/cols.dart';
import 'package:sheetviewer/AL/views/plutogrid/drawergrid.dart';
import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/BL/isardb/sheetrows.dart';
import 'package:sheetviewer/BL/lib/log.dart';
import 'package:sheetviewer/DL/dlglobals.dart';

import 'plutogrid/viewhelper/viewhelper.dart';

Future showGridAutoview1() async {
  viewHelper = ViewHelper();
  await filelistContr.filelistLoad();

  viewHelper.fileId =
      bl.blUti.url2fileid(appConfigDb.autoview1filelistRow['fileUrl']);
  viewHelper.sheetName = appConfigDb.autoview1filelistRow['sheetName'];

  await getData4view(viewHelper.fileId, viewHelper.sheetName);
  // await Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => GridPage(sheetRows),
  //     ));
}

List<PlutoColumn> gridCols = [];
List<String> cols = [];
List<PlutoRow> gridrows = [];
List<SheetRow?> sheetRows = [];

Future<String> getData4view(String fileId, String sheetName) async {
  logParagraphStart('getData4view');
  await viewHelper.load(fileId, sheetName);
  //---------------------------------------------------------------------cols
  /// Columns must be provided at the beginning of a row synchronously.
  viewHelper.plutoCols.clear();
  viewHelper.plutoCols.addAll(await colsMap(viewHelper.viewConfig.colsHeader));
  //---------------------------------------------------------------------rows

  await rowsCountCheck(fileId, sheetName);

  if (filelistContr.searchWordInAllSheets.value.isEmpty) {
    sheetRows = await sheetRowsDb.readRowsSheet(fileId, sheetName);
  } else {
    sheetRows = await sheetRowsDb.readRowsContains(
        fileId, sheetName, filelistContr.searchWordInAllSheets.value);
  }
  rowsCount.value = sheetRows.length;
  //debugPrint(viewHelper.viewConfig.toString());
  //bug _FutureBuilderState<String>#a0df7): Unexpected null value
  //packages/pluto_grid/src/manager/pluto_grid_state_manager.dart 292:44
  return 'OK';
}

Future<String> rowsCountCheck(String fileId, String sheetName) async {
  logParagraphStart('getData4view.rowsCountCheck($fileId, $sheetName');
  int rowsCount = await sheetRowsDb.rowsCount(fileId, sheetName);
  if (rowsCount > 1) return 'ok';

  try {
    rowsCount = await dlGlobals.gSheetsAdapter
        .getSheetAllRowsOld(fileId, sheetName, true, 'sheetRowsDb');

    logi('rowsCountCheck', 'final', sheetName + 'from: $fileId',
        rowsCount.toString());
  } catch (e) {
    logi('rowsCountCheck', 'error', sheetName, e.toString());
  }
  return 'ok';
}
