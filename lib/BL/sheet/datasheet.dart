// ignore_for_file: avoid_print

class DataSheet {
  List<String> cols = [];
  List<dynamic> rows = [];
  List<String> columnsSelected = [];
  String sheetUrl = '';

  //temp
  String sheetTitle = '';

  DataSheet();

  factory DataSheet.fromJson(Map jsonData) {
    try {
      List<String> cols = List<String>.from(jsonData["cols"]);
      DataSheet anySheet = DataSheet()
        ..cols = cols
        ..columnsSelected = jsonData["columnsSelected"] != null
            ? List<String>.from(jsonData["columnsSelected"])
            : cols
        ..sheetUrl = jsonData["sheetUrl"]
        ..rows = jsonData["rows"];
      print(anySheet.sheetUrl);
      return anySheet;
    } catch (e) {
      //rint(e);
      return DataSheet();
    }
  }
}
