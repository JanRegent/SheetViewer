import 'sheet_config.dart';

class DataSheet {
  List<String> cols = [];
  List<dynamic> rows = [];
  SheetConfig config = SheetConfig();

  //temp
  String sheetTitle = '';
  Map rawDataSheet = {};

  DataSheet();

  factory DataSheet.fromJson(Map jsonData) {
    SheetConfig config_ = SheetConfig.fromJson(jsonData['config']);
    print(config_.toString());
    try {
      List<String> cols = List<String>.from(jsonData["cols"]);
      if (config_.columnsSelected.isEmpty) config_.columnsSelected = cols;

      DataSheet anySheet = DataSheet()
        ..config = config_
        ..cols = cols
        ..rows = jsonData["rows"];

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
