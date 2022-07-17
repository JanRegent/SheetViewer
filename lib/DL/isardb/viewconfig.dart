import 'dart:async';

import 'package:isar/isar.dart';

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

  // Future<List<ViewConfig?>> readRowsSheet(
  //     String fileId, String sheetName) async {
  //   List<ViewConfig?> testRows = await isar.ViewConfigs.filter()
  //       .zfileIdEqualTo(fileId)
  //       .and()
  //       .aSheetNameEqualTo(sheetName)
  //       .findAll();
  //   return testRows;
  // }

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
    ViewConfig? testRow = await isar.viewConfigs
        .filter()
        .zfileIdEqualTo(viewConfig.zfileId)
        .and()
        .aSheetNameEqualTo(viewConfig.aSheetName)
        .findFirst();
    try {
      // ignore: unnecessary_null_comparison
      if (testRow!.id != null) {
        await isar.writeTxn(() async {
          await isar.viewConfigs.delete(testRow.id); // delete
        });
      }

      await isar.writeTxn(() async {
        await isar.viewConfigs.put(viewConfig);
      });
    } catch (_) {
      await isar.writeTxn(() async {
        await isar.viewConfigs.put(viewConfig);
      });
    }
  }

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
}
