import '../bl.dart';

class FileListSheet {
  List<String> cols = [];
  List<dynamic> rows = [];
  String filelistTitle = '';

  FileListSheet();

  factory FileListSheet.fromJson(Map jsonData) {
    if (jsonData.isEmpty) return FileListSheet();
    try {
      FileListSheet anySheet = FileListSheet();
      anySheet.cols = bl.blUti.toListString(jsonData["cols"]);
      anySheet.rows = jsonData["rows"];
      return anySheet;
    } catch (e) {
      //rint(e);
      return FileListSheet();
    }
  }

  @override
  String toString() {
    return '''
      --------------------------FileListSheet
                                $filelistTitle
      cols:
      $cols
      
      rows:
      $rows

    ''';
  }
}

class TabsListSheet {
  List<dynamic> cols = [];
  List<dynamic> rows = [];
  String tabslistTitle = '';

  TabsListSheet();

  factory TabsListSheet.fromJson(Map jsonData) {
    if (jsonData.isEmpty) return TabsListSheet();
    TabsListSheet anySheet = TabsListSheet()
      ..cols = jsonData["cols"]
      ..rows = jsonData["rows"];
    return anySheet;
  }
}
