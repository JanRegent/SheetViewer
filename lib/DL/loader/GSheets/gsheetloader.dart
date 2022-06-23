// import 'package:sheets2mob/modules/loaders/dataAdapters/dateHelpers/dateCommon.dart';
// import 'package:sheets2mob/modules/loaders/dataAdapters/dateHelpers/gsheetDateHelper.dart';

// import 'package:string_validator/string_validator.dart';

// import 'package:gsheets/gsheets.dart';
// import 'package:sheets2mob/BL/Query/TextQueryJson.dart';
// import 'package:sheets2mob/BL/BL.dart';

// import 'package:sheets2mob/modules/Sheet/_SheetClass.dart';

// import 'gsheetConfigLoader.dart';

// Future gsheetAdapterLoader2(Sheet sheet) async {
//   await sheet.init();

//   String fileidSheetKey = sheet.filenameFileid + '__|__' + sheet.sheetname;
//   sheet.fileidSheetKey = fileidSheetKey;

//   await sheet.rowsBox.put(0, '${sheet.filenameFileid}__|__${sheet.sheetname}');

//   if (!isAscii(sheet.sheetname)) {
//     sheet.rowsBox.put(1, 'error: noASCII sheetname: ' + sheet.sheetname);
//     return 'error: noASCII sheetname ';
//   }

// // init GSheets
//   final gsheets = GSheets(_service_account_credentials);
//   Spreadsheet ss;
//   // fetch spreadsheet by its id
//   try {
//     ss = await gsheets.spreadsheet(sheet.filenameFileid);
//   } catch (e) {
//     sheet.rowsBox.put(1, 'error: ' + e.toString());
//     return e.toString();
//   }

//   if (sheet.rowsBox.length > 1) {
//     bl.appLog
//         .appendRow(['gsheetAdapterLoader2(', fileidSheetKey, ' OK-noUpdated']);
//     return;
//   }

//   String result = await rows2sheetBoxGsheet2(ss, fileidSheetKey, sheet);
//   await bl.appLog.appendRow(['gsheetAdapterLoader2(', fileidSheetKey, result]);
// }

// int getWorksheetIndex(Spreadsheet ss, String sheetName) {
//   for (var i = 0; i < ss.sheets.length; i++) {
//     Worksheet ws = ss.sheets[i];
//     if (sheetName.toLowerCase() == ws.title.toLowerCase()) return ws.index;
//   }
//   return -1;
// }

// Future<String> rows2sheetBoxGsheet2(
//     Spreadsheet ss, String fileidSheetKey, Sheet sheet) async {
//   // ignore: unnecessary_null_comparison
//   if (ss == null) {
//     sheet.rowsBox.put(1, 'error: ss is null');
//     return 'error: ss is null';
//   }

//   int wsIndex = getWorksheetIndex(ss, sheet.sheetname);
//   if (wsIndex == -1) {
//     sheet.rowsBox.put(1, 'Bad: sheetname not found:' + sheet.sheetname);
//     return 'Bad: sheetname not found';
//   }
//   //List<String> sheetsNames = ;
//   //rint(ss.sheets.toList());
//   var sheetOfss = ss.worksheetByIndex(wsIndex);
//   //todo frozen at Universe Sandbox Community Idea List
//   //rint(sheetOfss!.title);
//   //rint(sheetOfss.values.lastRow());
//   List<List<String>> rows = await sheetOfss!.values.allRows();
//   //rint(rows.length);
//   //------------------------------------------------------columns exists?
//   List<String> columns = [];
//   try {
//     if (sheet.columnRow != '') {
//       int columnRow = int.tryParse(sheet.columnRow)!;
//       columns = rows[columnRow - 1];
//     } else
//       columns = rows[0];
//   } catch (_) {
//     columns = [];
//     //Index out of range: no indices are valid
//   }
//   if (columns.length == 0) {
//     sheet.rowsBox.put(1, 'Error: columns.not found');
//     return 'Error: columns.not found';
//   }
//   int dateColumnIndex = -1;
//   GsheetDateHelper gsheetDateHelper = GsheetDateHelper(sheet);
//   if (sheet.dateColumn.isNotEmpty)
//     dateColumnIndex = getColIndexLowerCase(columns, sheet.dateColumn);

//   columns.insert(0, 'RowNo');
//   await sheet.rowsBox.clear();
//   await sheet.rowsBox.put(0, fileidSheetKey);
//   await sheet.rowsBox.put(1, columns.join('__|__'));

//   for (var rowIx = 1; rowIx < rows.length; rowIx++) {
//     if (dateColumnIndex > -1)
//       rows[rowIx][dateColumnIndex] =
//           gsheetDateHelper.convertDateColumnCell(rows[rowIx][dateColumnIndex]);
//     sheet.rowsBox.put(
//         rowIx + 1,
//         (rowIx + 1).toString() +
//             '__|__' +
//             rows[rowIx].join('__|__')); //RowNo starts at 2

//   }
//   await queriesLoad(ss, sheet);
//   return 'OK-rows${sheet.rowsBox.length}';
// }

// Future queriesLoadManually(Sheet sheet) async {
//   final gsheets = GSheets(_service_account_credentials);
//   Spreadsheet ss;
//   // fetch spreadsheet by its id
//   try {
//     ss = await gsheets.spreadsheet(sheet.filenameFileid);
//   } catch (e) {
//     return;
//   }
//   await queriesLoad(ss, sheet);
// }

// Future queriesLoad(Spreadsheet ss, Sheet sheet) async {
//   // ignore: unnecessary_null_comparison
//   if (ss == null) {
//     return '';
//   }
//   int wsIndex = getWorksheetIndex(ss, sheet.sheetname + '__config__');
//   if (wsIndex == -1) {
//     return '';
//   }
//   List<String> configSheetList = await gsheetLoadConfig(
//       ss, sheet.filenameFileid, sheet.sheetname + '__config__');

//   for (var i = 2; i < configSheetList.length; i++) {
//     if (configSheetList[i].contains('__end__')) break;
//     if (configSheetList[i].isEmpty) continue;

//     TextQuery textQuery = TextQuery.fromConfig(configSheetList[i])
//       ..fileidSheetKey = sheet.fileidSheetKey
//       ..sheetname = sheet.sheetname;
//     String queryKey =
//         '${textQuery.column}__|__${textQuery.operator}__|__${textQuery.value}';
//     queryKey = bl.uti.removeNonASCII(queryKey);
//     await sheet.queryStore.textQueryBox
//         .put(queryKey, textQuery.toJson().toString());
//   }
// }

// //--------------------------------------------------------------------------------
