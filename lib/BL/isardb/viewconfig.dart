import 'dart:async';
import 'dart:convert';

import 'package:isar/isar.dart';
import 'package:sheetviewer/BL/bl.dart';

part 'viewconfig.g.dart'; // flutter pub run build_runner build

@Collection()
class ViewConfig {
  @Id()
  int id = Isar.autoIncrement;
  String aSheetName = '';
  List<String> colsHeader = [];
  List<String> colsFilter = [];
  List<String> freezeTo = [];
  String sort = '';
  List<String> autoFit = [];
  String zfileId = '';
  String zfileIdConfig = '';
  String zSheetNameConfig = '';
  int currentPage = 1;

  ViewConfig();

  @override
  String toString() {
    return '''
  ----------------------------------------------------------------------shetView
  id $id
    
 
    sheetName $aSheetName

    colsHeader\n  $colsHeader

    colsFilter\n  $colsFilter
    
    freezeTo\n  $freezeTo
    
    sort\n  $sort
    
    autoFit\n  $autoFit

    currentPage $currentPage  
    
    fileId $zfileId
    ''';
  }

  // ignore: non_constant_identifier_names
  Future ViewConfigsFromJson(Map jsonData) async {
    // try {
    //   String sheetName = jsonData["sheetName"] ?? '';
    //   String fileId = jsonData["fileId"] ?? '';

    //   for (var i = 0; i < rows.length; i++) {
    //     ViewConfig ViewConfig = ViewConfig()
    //       ..aSheetName = sheetName
    //       ..zfileId = fileId
    //       ..colsFilter =
    // freezeTo\n  $freezeTo
    // sort\n  $sort
    // autoFit\n  $autoFit
    //       ..aRowNo = int.tryParse(rows[i]['row_'])!
    //       ..row = jsonEncode(rows[i]); //map to String workarround of Isar

    //     await ViewConfigsDb.update(ViewConfig);
    //   }
    // } catch (e) {
    //   logi('ViewConfig.ViewConfigsFromJson', jsonData.toString(), '',
    //       e.toString());
    // }
    return {};
  }
}

class ViewConfigsDb {
  final Isar isar;
  ViewConfigsDb(this.isar);

  // Future<List<String>> readCols(String fileId, String sheetName) async {
  //   ViewConfig? testRow = await isar.ViewConfigs.filter()
  //       .zfileIdEqualTo(fileId)
  //       .and()
  //       .aSheetNameEqualTo(sheetName)
  //       .findFirst();
  //   Map row = jsonDecode(testRow!.row);
  //   List<String> cols = [];
  //   for (var key in row.keys) {
  //     cols.add(key);
  //   }
  //   return cols;
  // }

  // Future<int> rowsCount(String fileId, String sheetName) async {
  //   List<ViewConfig?> rows = await isar.ViewConfigs.filter()
  //       .zfileIdEqualTo(fileId)
  //       .and()
  //       .aSheetNameEqualTo(sheetName)
  //       .findAll();
  //   logi('rowsCount', sheetName, rows.length.toString(), '');
  //   return rows.length;
  // }

  // Future<List<ViewConfig?>> readRowsAllSheets() async {
  //   List<ViewConfig?> rows = await isar.ViewConfigs.where().findAll();
  //   return rows;
  // }

  Future<List<ViewConfig?>> readViewConfigs(
      String fileId, String sheetName) async {
    List<ViewConfig?> testRows = await isar.viewConfigs
        .filter()
        .zfileIdEqualTo(fileId)
        .and()
        .aSheetNameEqualTo(sheetName)
        .findAll();
    return testRows;
  }

  Future<ViewConfig?> readViewConfigFirst(
      String fileId, String sheetName) async {
    final ids = await isar.viewConfigs
        .filter()
        .zfileIdEqualTo(fileId)
        .and()
        .aSheetNameEqualTo(sheetName)
        .idProperty()
        .findAll();
    ViewConfig? viewConfig = await isar.viewConfigs.get(ids.first);
    return viewConfig;
  }
  // Future<ViewConfig?> readRowNo(int aRowNo) async {
  //   ViewConfig? row =
  //       await isar.ViewConfigs.filter().aRowNoEqualTo(aRowNo).findFirst();
  //   return row;
  // }

  // Future<bool> rowExists(ViewConfig ViewConfig) async {
  //   ViewConfig? testRow = await isar.ViewConfigs.filter()
  //       .zfileIdEqualTo(ViewConfig.zfileId)
  //       .and()
  //       .aSheetNameEqualTo(ViewConfig.aSheetName)
  //       .and()
  //       .aRowNoEqualTo(ViewConfig.aRowNo)
  //       .findFirst();
  //   try {
  //     // ignore: unnecessary_null_comparison
  //     if (testRow!.id != null) return true;
  //     return false;
  //   } catch (_) {
  //     return false;
  //   }
  // }

  Future update(ViewConfig viewConfig) async {
    await isar.writeTxn(() async {
      final oldRowsIds = await isar.viewConfigs
          .filter()
          .zfileIdEqualTo(viewConfig.zfileId)
          .and()
          .aSheetNameEqualTo(viewConfig.aSheetName)
          .idProperty()
          .findAll();

      isar.viewConfigs.deleteAll(oldRowsIds);
    });
    await isar.writeTxn(() async {
      await isar.viewConfigs.put(viewConfig);
    });
  }

  Future fromCsv(
      List<List<dynamic>> rawRows, String fileId, String sheetName) async {
    ViewConfig viewConfig = ViewConfig()
      ..aSheetName = sheetName
      ..zfileId = fileId;

    List<String> removeFirst(List<String> list) {
      List<String> listString = [];
      for (int i = 1; i < list.length; i++) {
        if (list[i].isEmpty) continue;
        listString.add(list[i]);
      }
      return listString;
    }

    void getColsFilter(int rowIx) {
      List<String> rowHead = removeFirst(bl.blUti.toListString(rawRows[rowIx]));
      if (rowHead[0] != 'columnName') return;
      if (rowHead[1] != 'operator') return;
      if (rowHead[2] != 'value') return;
      while (true) {
        List<String> row = bl.blUti.toListString(rawRows[rowIx + 1]);
        if (row[0] != '..') return;
        Map filter = {};
        filter['columnName'] = row[1];
        filter['operator'] = row[2];
        filter['value'] = row[3];
        viewConfig.colsFilter.add(jsonEncode(filter));
        rowIx += 1;
      }
    }

    void getFreezeTo(int rowIx) {
      List<String> rowHead = removeFirst(bl.blUti.toListString(rawRows[rowIx]));
      if (rowHead[0] != 'columnName') return;
      if (rowHead[1] != 'side') return;
      while (true) {
        List<String> row = bl.blUti.toListString(rawRows[rowIx + 1]);
        if (row[0] != '..') return;
        Map filter = {};
        filter['columnName'] = row[1];
        filter['side'] = row[2];
        viewConfig.freezeTo.add(jsonEncode(filter));
        rowIx += 1;
      }
    }

    for (int rowIx = 0; rowIx < rawRows.length; rowIx++) {
      try {
        List<String> row = bl.blUti.toListString(rawRows[rowIx]);
        if (row[0].isEmpty) continue;
        switch (row[0]) {
          case 'colsHeader':
            viewConfig.colsHeader = removeFirst(row);
            break;
          case 'colsFilter':
            getColsFilter(rowIx);
            break;
          case 'freezeTo':
            getFreezeTo(rowIx);
            break;
          case 'sort':
            Map sort = {};
            sort['columnName'] = row[1];
            sort['direction'] = row[2];
            viewConfig.sort = jsonEncode(sort);
            break;
        }
      } catch (_) {}
    }
    //print(viewConfig);
    await update(viewConfig);
  }
}

 // Future updateAll(List<ViewConfig> ViewConfigs) async {

  // Future updateAll(List<ViewConfig> ViewConfigs) async {
  //   await isar.writeTxn(() async {
  //     await isar.ViewConfigs.putAll(ViewConfigs);
  //   });
  // }

  // //----------------------------------------------------------------batch

  // Future ViewConfigsSave(List<List<dynamic>> rawRows, String fileId,
  //     String sheetName, bool putAll, List<String> cols) async {
  //   List<ViewConfig> ViewConfigs = [];
  //   for (var rowIx = 0; rowIx < rawRows.length; rowIx++) {
  //     interestContr.fetshingRows.value =
  //         sheetName + ': ' + rowIx.toString() + '/' + rawRows.length.toString();
  //     Map row = {}; //excel 1 cols, 2.. data
  //     for (var colIx = 0; colIx < cols.length; colIx++) {
  //       try {
  //         row[cols[colIx]] = rawRows[rowIx][colIx];
  //       } catch (_) {
  //         row[cols[colIx]] = '';
  //       }
  //     }
  //     ViewConfig ViewConfig = ViewConfig()
  //       ..aSheetName = sheetName
  //       ..zfileId = fileId
  //       ..aRowNo = (rowIx + 1) //excel start at 1
  //       ..row = jsonEncode(row);
  //     String key = row.keys.first.toString();
  //     if (row[key].toString().trim().isNotEmpty) {
  //       if (putAll) {
  //         //>1000 rows
  //         ViewConfigs.add(ViewConfig); //empty rows //workarround
  //       } else {
  //         await ViewConfigsDb.update(ViewConfig);
  //       }
  //     }
  //   }
  //   if (putAll) await ViewConfigsDb.updateAll(ViewConfigs);
  // }

