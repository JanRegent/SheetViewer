import 'package:isar/isar.dart';

part 'sheetviewconfig.g.dart'; // flutter pub run build_runner build

@Collection()
class SheetViewConfig {
  int id = Isar.autoIncrement;
  String aQuerystringKey = '';
  String aStatus = '';

  String colsHeader = '';
  String getRowsLast = '';
  String getRowsFirst = '';
  String getRowsFrom = '';
  String getRowsTo = '';

  List<String> selects1 = [];

  String byValueColumns = '';

  @Ignore()
  Map fileListSheetRow = {};
  @Ignore()
  String fileId = '';
  @Ignore()
  String sheetName = '';

  SheetViewConfig();

  @override
  String toString() {
    return '''
  ----------------------------------------------------------------------shetView
  id $id
  aQuerystringKey $aQuerystringKey
  aStatus         $aStatus

  colsHeader      $colsHeader
  getRowsFirst    $getRowsFirst
  getRowsLast     $getRowsLast

  fileListSheetRow 
                  $fileListSheetRow
    ''';
  }
}

class SheetViewConfigDb {
  final Isar isar;
  SheetViewConfigDb(this.isar);

  Future init() async {}

  Future<int?> getId_(String aQuerystringKey) async {
    try {
      final int? id = await isar.sheetViewConfigs
          .filter()
          .aQuerystringKeyEqualTo(aQuerystringKey)
          .idProperty()
          .findFirst();
      return id;
    } catch (e) {
      return null;
    }
  }

  Future<SheetViewConfig?> readSheet(String aQuerystringKey) async {
    int? id = await getId_(aQuerystringKey);
    if (id == null) {
      return SheetViewConfig()
        ..aStatus = 'warn: not exists: new created'
        ..aQuerystringKey = aQuerystringKey;
    }
    SheetViewConfig? sheetViewConfig = await isar.sheetViewConfigs.get(id);
    return sheetViewConfig;
  }
}
