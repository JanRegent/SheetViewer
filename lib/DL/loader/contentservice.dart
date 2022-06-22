// ignore_for_file: prefer_adjacent_string_concatenation

import 'package:gsheets/gsheets.dart';
import 'package:sheetviewer/DL/dlglobals.dart';

/// Your google auth credentials //sheets2mob-223110@appspot.gserviceaccount.com
///
/// how to get credentials - https://medium.com/@a.marenkov/how-to-get-credentials-for-google-sheets-456b7e88c430
//
//serviceAccount credentials https://console.cloud.google.com/apis/credentials?project=sheets2mob-223110
/// Your spreadsheet id
///
/// It can be found in the link to your spreadsheet -
/// link looks like so https://docs.google.com/spreadsheets/d/YOUR_SPREADSHEET_ID/edit#gid=0
/// [YOUR_SPREADSHEET_ID] in the path is the id your need
const _spreadsheetId = '1soitqp8gukkQeITurQYhWC_gD-AgpOA5cxMPE00MI5A';

Future<String> gsheetTest() async {
  // init GSheets

  final gsheets = GSheets(dlGlobals.kredenc);
  // fetch spreadsheet by its id
  final ss = await gsheets.spreadsheet(_spreadsheetId);

  // get worksheet by its title
  var sheet = ss.worksheetByTitle('serviceConfig');
  // create worksheet if it does not exist yet
  sheet ??= await ss.addWorksheet('serviceConfig');

  // get cell at 'B2' as Cell object
  final cell = await sheet.cells.cell(column: 2, row: 1);
  // prints 'new'
  return cell.value;
}
