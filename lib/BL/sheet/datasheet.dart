import 'sheet_config.dart';

class DataSheet {
  List<String> cols = [];
  List<String> headerCols = [];

  List<dynamic> rows = [];

  SheetConfig config = SheetConfig();

  //temp
  String sheetTitle = '';
  Map rawDataSheet = {};

  DataSheet();

  factory DataSheet.fromJson(Map jsonData) {
    try {
      List<String> cols = List<String>.from(jsonData["cols"]);

      DataSheet anySheet = DataSheet()
        ..cols = cols
        ..rows = jsonData["rows"];

      anySheet.headerCols = jsonData["headerCols"] ?? cols;
      anySheet.rawDataSheet = jsonData;

      return anySheet;
    } catch (e) {
      return DataSheet();
    }
  }

  @override
  String toString() {
    return ''' 
    ------------------------------------------datasheet
    cols:            $cols

    row1:            ${printMap(rows[0])} 
    
    rowN:            ${printMap(rows[rows.length - 1])} 
    
    ''';
  }

  String printMap(Map row) {
    String str = '';
    for (var entry in row.entries) {
      str += '\n ${entry.key}:  ${entry.value}';
    }
    return str;
  }
}
