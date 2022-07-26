import 'dart:convert';

import 'package:clipboard/clipboard.dart';
import 'package:isar/isar.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:sheetviewer/AL/views/plutogrid/viewhelper/filters.dart';
import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/BL/isardb/viewconfig.dart';
import 'package:sheetviewer/BL/lib/log.dart';

class ViewHelper {
  ViewHelper();
  String fileId = '';
  String sheetName = '';
  ViewConfig viewConfig = ViewConfig();
  List<PlutoColumn> plutoCols = [];
  late PlutoGridStateManager gridAStateManager;

  @Ignore()
  int currentRowNoOnSelect = 2; //first data row in sheet
  @Ignore()
  bool detailMode = false;

  //---------------------------------------------------------------------header
  List<String> getColsHeader() {
    List<String> colsHeader = [];
    for (var index = 0; index < plutoCols.length; index++) {
      if (colsHeader.contains(plutoCols[index].title)) continue;
      if (plutoCols[index].hide) continue;
      colsHeader.add(plutoCols[index].title);
    }
    return colsHeader;
  }

  //---------------------------------------------------------------------filters
  final List<PlutoRow> filterRows = [];

  List<String> getFilteredList() {
    List<String> filtersList = [];
    for (var index = 0; index < plutoCols.length; index++) {
      String value =
          filteredColumnGetValue(gridAStateManager, plutoCols[index].title);
      if (value.isEmpty) continue;
      Map expr = {};
      expr['columnName'] = plutoCols[index].title;
      expr['operator'] = 'contains';
      expr['value'] = value;
      filtersList.add(jsonEncode(expr));
    }
    return filtersList;
  }

  //---------------------------------------------------------------------freze
  List<String> freezeToListString() {
    List<dynamic> freezeListDynamic = freezeToListDynamic();
    List<String> freezeListString = [];
    for (var element in freezeListDynamic) {
      freezeListString.add(jsonEncode(element));
    }
    return freezeListString;
  }

  List<dynamic> freezeToListDynamic() {
    List<dynamic> freezeToList = [];
    for (var index = 0; index < plutoCols.length; index++) {
      if (!plutoCols[index].frozen.isFrozen) continue;
      String freezeSide = 'start';
      if (plutoCols[index].frozen.isEnd) freezeSide = 'end';
      Map pair = {};
      pair['columnName'] = plutoCols[index].title;
      pair['side'] = freezeSide;
      freezeToList.add(pair);
    }
    return freezeToList;
  }

  PlutoColumnFrozen setFreeze(String columnName) {
    try {
      for (var i = 0; i < viewConfig.freezeTo.length; i++) {
        Map freezeMap = jsonDecode(viewConfig.freezeTo[i]);
        if (freezeMap['columnName'] != columnName) continue;
        if (freezeMap['side'] == 'start') {
          return PlutoColumnFrozen.start;
        } else {
          return PlutoColumnFrozen.end;
        }
      }
    } catch (e) {
      return PlutoColumnFrozen.none;
    }
    return PlutoColumnFrozen.none;
  }

  //------------------------------------------------------------------sort/order
  String getSort() {
    Map sortPar = {};
    for (var index = 0; index < plutoCols.length; index++) {
      if (plutoCols[index].sort.isNone) continue;
      String direct = '';
      try {
        direct =
            plutoCols[index].sort.toString().replaceAll('PlutoColumnSort.', '');
      } catch (e) {
        direct = '';
      }
      if (direct.isEmpty) continue;

      sortPar['columnName'] = plutoCols[index].title;
      sortPar['direction'] = direct;
      break;
    }
    if (sortPar.isEmpty) return '';
    return jsonEncode(sortPar);
  }

  PlutoColumnSort setSort(String columnName) {
    try {
      Map sortMap = jsonDecode(viewConfig.sort);
      if (sortMap['columnName'] != columnName) return PlutoColumnSort.none;
      if (sortMap['direction'] == 'ascending') {
        return PlutoColumnSort.ascending;
      } else {
        return PlutoColumnSort.descending;
      }
    } catch (e) {
      return PlutoColumnSort.none;
    }
  }

  //-------------------------------------------------------------------autoFit
  List<String> getAutoFitList() {
    List<String> autofitList = [];
    for (var index = 0; index < plutoCols.length; index++) {
      if (plutoCols[index].hide) continue;

      autofitList.add(plutoCols[index].title);
    }
    return autofitList;
  }

  //gridAStateManager.autoFitColumn(context, column).
  // for (var index = 0; index < plutoCols.length; index++) {
  //   if (plutoCols[index].title != 'Mise') continue;
  //   gridAStateManager.autoFitColumn(
  //       gridAStateManager.gridKey!.currentContext!, plutoCols[index]);
  //   wrow.add(Column(
  //     children: [
  //       ElevatedButton.icon(
  //           icon: const Icon(Icons.space_bar),
  //           label: Text(plutoCols[index].title),
  //           style: ButtonStyle(
  //               shape: MaterialStateProperty.all<RoundedRectangleBorder>(
  //                   RoundedRectangleBorder(
  //                       borderRadius: BorderRadius.circular(18.0),
  //                       side: const BorderSide(color: Colors.red)))),
  //           onPressed: () {}),
  //       SizedBox(width: 120, height: 60, child: Text(plutoCols[index].title))
  //     ],
  //   ));
  // }

  //---------------------------------------------------------------saveLoad
  Future viewConfigSave() async {
    viewConfig
      ..aSheetName = sheetName
      ..zfileId = fileId
      ..colsHeader = getColsHeader()
      ..colsFilter = getFilteredList()
      ..freezeTo = freezeToListString()
      ..sort = getSort();
    //..autoFit = getAutoFitList();

    await viewConfigsDb.update(viewConfig);
  }

  Future viewConfi2csv() async {
    String csv = 'configVer:22.08';
    csv += '\naSheetName,' + sheetName;
    csv += '\ncolsHeader,' + getColsHeader().join(',');
    List<String> filters = getFilteredList();
    if (filters.isNotEmpty) {
      for (var i = 0; i < filters.length; i++) {
        Map expr = jsonDecode(filters[i]);
        if (i == 0) csv += '\ncolsFilter,columnName, operator, value';
        csv += '\n..,' +
            expr['columnName'] +
            ',' +
            expr['operator'] +
            ',' +
            expr['value'];
      }
    }

    List<String> freezes = freezeToListString();
    if (filters.isNotEmpty) {
      for (var i = 0; i < freezes.length; i++) {
        Map expr = jsonDecode(freezes[i]);
        if (i == 0) csv += '\nfreezeTo,columnName, side';
        csv += '\n..,' + expr['columnName'] + ',' + expr['side'];
      }
    }
    String sort = getSort();
    if (sort.isNotEmpty) {
      Map sortMap = jsonDecode(sort);
      csv += '\nsort,' + sortMap['columnName'] + ',' + sortMap['direction'];
    }

    FlutterClipboard.copy(csv).then((value) => {});
  }

  Future load(String fileId_, String sheetName_) async {
    viewConfig = (await loadViewConfig(fileId_, sheetName_))!;
    logi('viewConfig', '', viewConfig.toString(), '');
    fileId = fileId_;
    sheetName = sheetName_;
    if (viewConfig.colsHeader.isEmpty) {
      List<String> cols =
          await sheetRowsDb.readCols(viewConfig.zfileId, viewConfig.aSheetName);
      viewConfig.colsHeader = cols;
    }
  }

  void setPage(PlutoPagination plutoPagination) {
    try {
      // ignore: unnecessary_null_comparison
      if (viewConfig.currentPage != null) {
        plutoPagination.stateManager
            .setPage(viewConfig.currentPage); //if pages > 1
      } else {
        plutoPagination.stateManager.setPage(1);
      }
    } catch (e) {
      plutoPagination.stateManager.setPage(1);
    }
  }

  Future<ViewConfig?> loadViewConfig(String fileId_, String sheetName_) async {
    ViewConfig? viewConfig = ViewConfig();
    try {
      viewConfig =
          (await viewConfigsDb.readViewConfigFirst(fileId_, sheetName_))!
            ..aSheetName = sheetName_
            ..zfileId = fileId_;
    } catch (e) {
      viewConfig = ViewConfig();
      viewConfig.zfileId = fileId_;
      viewConfig.aSheetName = sheetName_;
    }
    return viewConfig;
  }
}
