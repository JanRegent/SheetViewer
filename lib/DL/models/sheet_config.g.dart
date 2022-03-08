// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sheet_config.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast

extension GetSheetConfigCollection on Isar {
  IsarCollection<SheetConfig> get sheetConfigs {
    return getCollection('SheetConfig');
  }
}

final SheetConfigSchema = CollectionSchema(
  name: 'SheetConfig',
  schema:
      '{"name":"SheetConfig","idName":"id","properties":[{"name":"byValueColumns","type":"StringList"},{"name":"fileId","type":"String"},{"name":"getRows","type":"StringList"},{"name":"headerCols","type":"StringList"},{"name":"selects1","type":"StringList"},{"name":"sheetIdentStr","type":"StringList"},{"name":"sheetKey","type":"String"},{"name":"sheetName","type":"String"}],"indexes":[],"links":[]}',
  nativeAdapter: const _SheetConfigNativeAdapter(),
  webAdapter: const _SheetConfigWebAdapter(),
  idName: 'id',
  propertyIds: {
    'byValueColumns': 0,
    'fileId': 1,
    'getRows': 2,
    'headerCols': 3,
    'selects1': 4,
    'sheetIdentStr': 5,
    'sheetKey': 6,
    'sheetName': 7
  },
  listProperties: {
    'byValueColumns',
    'getRows',
    'headerCols',
    'selects1',
    'sheetIdentStr'
  },
  indexIds: {},
  indexTypes: {},
  linkIds: {},
  backlinkIds: {},
  linkedCollections: [],
  getId: (obj) {
    if (obj.id == Isar.autoIncrement) {
      return null;
    } else {
      return obj.id;
    }
  },
  setId: (obj, id) => obj.id = id,
  getLinks: (obj) => [],
  version: 2,
);

class _SheetConfigWebAdapter extends IsarWebTypeAdapter<SheetConfig> {
  const _SheetConfigWebAdapter();

  @override
  Object serialize(IsarCollection<SheetConfig> collection, SheetConfig object) {
    final jsObj = IsarNative.newJsObject();
    IsarNative.jsObjectSet(jsObj, 'byValueColumns', object.byValueColumns);
    IsarNative.jsObjectSet(jsObj, 'fileId', object.fileId);
    IsarNative.jsObjectSet(jsObj, 'getRows', object.getRows);
    IsarNative.jsObjectSet(jsObj, 'headerCols', object.headerCols);
    IsarNative.jsObjectSet(jsObj, 'id', object.id);
    IsarNative.jsObjectSet(jsObj, 'selects1', object.selects1);
    IsarNative.jsObjectSet(jsObj, 'sheetIdentStr', object.sheetIdentStr);
    IsarNative.jsObjectSet(jsObj, 'sheetKey', object.sheetKey);
    IsarNative.jsObjectSet(jsObj, 'sheetName', object.sheetName);
    return jsObj;
  }

  @override
  SheetConfig deserialize(
      IsarCollection<SheetConfig> collection, dynamic jsObj) {
    final object = SheetConfig();
    object.byValueColumns =
        (IsarNative.jsObjectGet(jsObj, 'byValueColumns') as List?)
                ?.map((e) => e ?? '')
                .toList()
                .cast<String>() ??
            [];
    object.fileId = IsarNative.jsObjectGet(jsObj, 'fileId') ?? '';
    object.getRows = (IsarNative.jsObjectGet(jsObj, 'getRows') as List?)
            ?.map((e) => e ?? '')
            .toList()
            .cast<String>() ??
        [];
    object.headerCols = (IsarNative.jsObjectGet(jsObj, 'headerCols') as List?)
            ?.map((e) => e ?? '')
            .toList()
            .cast<String>() ??
        [];
    object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
    object.selects1 = (IsarNative.jsObjectGet(jsObj, 'selects1') as List?)
            ?.map((e) => e ?? '')
            .toList()
            .cast<String>() ??
        [];
    object.sheetIdentStr =
        (IsarNative.jsObjectGet(jsObj, 'sheetIdentStr') as List?)
                ?.map((e) => e ?? '')
                .toList()
                .cast<String>() ??
            [];
    object.sheetKey = IsarNative.jsObjectGet(jsObj, 'sheetKey') ?? '';
    object.sheetName = IsarNative.jsObjectGet(jsObj, 'sheetName') ?? '';
    return object;
  }

  @override
  P deserializeProperty<P>(Object jsObj, String propertyName) {
    switch (propertyName) {
      case 'byValueColumns':
        return ((IsarNative.jsObjectGet(jsObj, 'byValueColumns') as List?)
                ?.map((e) => e ?? '')
                .toList()
                .cast<String>() ??
            []) as P;
      case 'fileId':
        return (IsarNative.jsObjectGet(jsObj, 'fileId') ?? '') as P;
      case 'getRows':
        return ((IsarNative.jsObjectGet(jsObj, 'getRows') as List?)
                ?.map((e) => e ?? '')
                .toList()
                .cast<String>() ??
            []) as P;
      case 'headerCols':
        return ((IsarNative.jsObjectGet(jsObj, 'headerCols') as List?)
                ?.map((e) => e ?? '')
                .toList()
                .cast<String>() ??
            []) as P;
      case 'id':
        return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
            as P;
      case 'selects1':
        return ((IsarNative.jsObjectGet(jsObj, 'selects1') as List?)
                ?.map((e) => e ?? '')
                .toList()
                .cast<String>() ??
            []) as P;
      case 'sheetIdentStr':
        return ((IsarNative.jsObjectGet(jsObj, 'sheetIdentStr') as List?)
                ?.map((e) => e ?? '')
                .toList()
                .cast<String>() ??
            []) as P;
      case 'sheetKey':
        return (IsarNative.jsObjectGet(jsObj, 'sheetKey') ?? '') as P;
      case 'sheetName':
        return (IsarNative.jsObjectGet(jsObj, 'sheetName') ?? '') as P;
      default:
        throw 'Illegal propertyName';
    }
  }

  @override
  void attachLinks(Isar isar, int id, SheetConfig object) {}
}

class _SheetConfigNativeAdapter extends IsarNativeTypeAdapter<SheetConfig> {
  const _SheetConfigNativeAdapter();

  @override
  void serialize(
      IsarCollection<SheetConfig> collection,
      IsarRawObject rawObj,
      SheetConfig object,
      int staticSize,
      List<int> offsets,
      AdapterAlloc alloc) {
    var dynamicSize = 0;
    final value0 = object.byValueColumns;
    dynamicSize += (value0.length) * 8;
    final bytesList0 = <IsarUint8List>[];
    for (var str in value0) {
      final bytes = IsarBinaryWriter.utf8Encoder.convert(str);
      bytesList0.add(bytes);
      dynamicSize += bytes.length as int;
    }
    final _byValueColumns = bytesList0;
    final value1 = object.fileId;
    final _fileId = IsarBinaryWriter.utf8Encoder.convert(value1);
    dynamicSize += (_fileId.length) as int;
    final value2 = object.getRows;
    dynamicSize += (value2.length) * 8;
    final bytesList2 = <IsarUint8List>[];
    for (var str in value2) {
      final bytes = IsarBinaryWriter.utf8Encoder.convert(str);
      bytesList2.add(bytes);
      dynamicSize += bytes.length as int;
    }
    final _getRows = bytesList2;
    final value3 = object.headerCols;
    dynamicSize += (value3.length) * 8;
    final bytesList3 = <IsarUint8List>[];
    for (var str in value3) {
      final bytes = IsarBinaryWriter.utf8Encoder.convert(str);
      bytesList3.add(bytes);
      dynamicSize += bytes.length as int;
    }
    final _headerCols = bytesList3;
    final value4 = object.selects1;
    dynamicSize += (value4.length) * 8;
    final bytesList4 = <IsarUint8List>[];
    for (var str in value4) {
      final bytes = IsarBinaryWriter.utf8Encoder.convert(str);
      bytesList4.add(bytes);
      dynamicSize += bytes.length as int;
    }
    final _selects1 = bytesList4;
    final value5 = object.sheetIdentStr;
    dynamicSize += (value5.length) * 8;
    final bytesList5 = <IsarUint8List>[];
    for (var str in value5) {
      final bytes = IsarBinaryWriter.utf8Encoder.convert(str);
      bytesList5.add(bytes);
      dynamicSize += bytes.length as int;
    }
    final _sheetIdentStr = bytesList5;
    final value6 = object.sheetKey;
    final _sheetKey = IsarBinaryWriter.utf8Encoder.convert(value6);
    dynamicSize += (_sheetKey.length) as int;
    final value7 = object.sheetName;
    final _sheetName = IsarBinaryWriter.utf8Encoder.convert(value7);
    dynamicSize += (_sheetName.length) as int;
    final size = staticSize + dynamicSize;

    rawObj.buffer = alloc(size);
    rawObj.buffer_length = size;
    final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
    final writer = IsarBinaryWriter(buffer, staticSize);
    writer.writeStringList(offsets[0], _byValueColumns);
    writer.writeBytes(offsets[1], _fileId);
    writer.writeStringList(offsets[2], _getRows);
    writer.writeStringList(offsets[3], _headerCols);
    writer.writeStringList(offsets[4], _selects1);
    writer.writeStringList(offsets[5], _sheetIdentStr);
    writer.writeBytes(offsets[6], _sheetKey);
    writer.writeBytes(offsets[7], _sheetName);
  }

  @override
  SheetConfig deserialize(IsarCollection<SheetConfig> collection, int id,
      IsarBinaryReader reader, List<int> offsets) {
    final object = SheetConfig();
    object.byValueColumns = reader.readStringList(offsets[0]) ?? [];
    object.fileId = reader.readString(offsets[1]);
    object.getRows = reader.readStringList(offsets[2]) ?? [];
    object.headerCols = reader.readStringList(offsets[3]) ?? [];
    object.id = id;
    object.selects1 = reader.readStringList(offsets[4]) ?? [];
    object.sheetIdentStr = reader.readStringList(offsets[5]) ?? [];
    object.sheetKey = reader.readString(offsets[6]);
    object.sheetName = reader.readString(offsets[7]);
    return object;
  }

  @override
  P deserializeProperty<P>(
      int id, IsarBinaryReader reader, int propertyIndex, int offset) {
    switch (propertyIndex) {
      case -1:
        return id as P;
      case 0:
        return (reader.readStringList(offset) ?? []) as P;
      case 1:
        return (reader.readString(offset)) as P;
      case 2:
        return (reader.readStringList(offset) ?? []) as P;
      case 3:
        return (reader.readStringList(offset) ?? []) as P;
      case 4:
        return (reader.readStringList(offset) ?? []) as P;
      case 5:
        return (reader.readStringList(offset) ?? []) as P;
      case 6:
        return (reader.readString(offset)) as P;
      case 7:
        return (reader.readString(offset)) as P;
      default:
        throw 'Illegal propertyIndex';
    }
  }

  @override
  void attachLinks(Isar isar, int id, SheetConfig object) {}
}

extension SheetConfigQueryWhereSort
    on QueryBuilder<SheetConfig, SheetConfig, QWhere> {
  QueryBuilder<SheetConfig, SheetConfig, QAfterWhere> anyId() {
    return addWhereClauseInternal(const WhereClause(indexName: null));
  }
}

extension SheetConfigQueryWhere
    on QueryBuilder<SheetConfig, SheetConfig, QWhereClause> {
  QueryBuilder<SheetConfig, SheetConfig, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: true,
      upper: [id],
      includeUpper: true,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterWhereClause> idNotEqualTo(
      int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: null,
        upper: [id],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: null,
        lower: [id],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: null,
        lower: [id],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: null,
        upper: [id],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterWhereClause> idGreaterThan(
    int id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: include,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterWhereClause> idLessThan(
    int id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      upper: [id],
      includeUpper: include,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [lowerId],
      includeLower: includeLower,
      upper: [upperId],
      includeUpper: includeUpper,
    ));
  }
}

extension SheetConfigQueryFilter
    on QueryBuilder<SheetConfig, SheetConfig, QFilterCondition> {
  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      byValueColumnsAnyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'byValueColumns',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      byValueColumnsAnyGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'byValueColumns',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      byValueColumnsAnyLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'byValueColumns',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      byValueColumnsAnyBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'byValueColumns',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      byValueColumnsAnyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'byValueColumns',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      byValueColumnsAnyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'byValueColumns',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      byValueColumnsAnyContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'byValueColumns',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      byValueColumnsAnyMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'byValueColumns',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition> fileIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'fileId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      fileIdGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'fileId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition> fileIdLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'fileId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition> fileIdBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'fileId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      fileIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'fileId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition> fileIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'fileId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition> fileIdContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'fileId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition> fileIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'fileId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      getRowsAnyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'getRows',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      getRowsAnyGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'getRows',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      getRowsAnyLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'getRows',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      getRowsAnyBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'getRows',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      getRowsAnyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'getRows',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      getRowsAnyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'getRows',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      getRowsAnyContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'getRows',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      getRowsAnyMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'getRows',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      headerColsAnyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'headerCols',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      headerColsAnyGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'headerCols',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      headerColsAnyLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'headerCols',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      headerColsAnyBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'headerCols',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      headerColsAnyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'headerCols',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      headerColsAnyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'headerCols',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      headerColsAnyContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'headerCols',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      headerColsAnyMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'headerCols',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition> idEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition> idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      selects1AnyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'selects1',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      selects1AnyGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'selects1',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      selects1AnyLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'selects1',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      selects1AnyBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'selects1',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      selects1AnyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'selects1',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      selects1AnyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'selects1',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      selects1AnyContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'selects1',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      selects1AnyMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'selects1',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      sheetIdentStrAnyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'sheetIdentStr',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      sheetIdentStrAnyGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'sheetIdentStr',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      sheetIdentStrAnyLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'sheetIdentStr',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      sheetIdentStrAnyBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'sheetIdentStr',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      sheetIdentStrAnyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'sheetIdentStr',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      sheetIdentStrAnyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'sheetIdentStr',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      sheetIdentStrAnyContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'sheetIdentStr',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      sheetIdentStrAnyMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'sheetIdentStr',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition> sheetKeyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'sheetKey',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      sheetKeyGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'sheetKey',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      sheetKeyLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'sheetKey',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition> sheetKeyBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'sheetKey',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      sheetKeyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'sheetKey',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      sheetKeyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'sheetKey',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      sheetKeyContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'sheetKey',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition> sheetKeyMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'sheetKey',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      sheetNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'sheetName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      sheetNameGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'sheetName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      sheetNameLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'sheetName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      sheetNameBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'sheetName',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      sheetNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'sheetName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      sheetNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'sheetName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      sheetNameContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'sheetName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      sheetNameMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'sheetName',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension SheetConfigQueryLinks
    on QueryBuilder<SheetConfig, SheetConfig, QFilterCondition> {}

extension SheetConfigQueryWhereSortBy
    on QueryBuilder<SheetConfig, SheetConfig, QSortBy> {
  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy> sortByFileId() {
    return addSortByInternal('fileId', Sort.asc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy> sortByFileIdDesc() {
    return addSortByInternal('fileId', Sort.desc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy> sortBySheetKey() {
    return addSortByInternal('sheetKey', Sort.asc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy> sortBySheetKeyDesc() {
    return addSortByInternal('sheetKey', Sort.desc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy> sortBySheetName() {
    return addSortByInternal('sheetName', Sort.asc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy> sortBySheetNameDesc() {
    return addSortByInternal('sheetName', Sort.desc);
  }
}

extension SheetConfigQueryWhereSortThenBy
    on QueryBuilder<SheetConfig, SheetConfig, QSortThenBy> {
  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy> thenByFileId() {
    return addSortByInternal('fileId', Sort.asc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy> thenByFileIdDesc() {
    return addSortByInternal('fileId', Sort.desc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy> thenBySheetKey() {
    return addSortByInternal('sheetKey', Sort.asc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy> thenBySheetKeyDesc() {
    return addSortByInternal('sheetKey', Sort.desc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy> thenBySheetName() {
    return addSortByInternal('sheetName', Sort.asc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy> thenBySheetNameDesc() {
    return addSortByInternal('sheetName', Sort.desc);
  }
}

extension SheetConfigQueryWhereDistinct
    on QueryBuilder<SheetConfig, SheetConfig, QDistinct> {
  QueryBuilder<SheetConfig, SheetConfig, QDistinct> distinctByFileId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('fileId', caseSensitive: caseSensitive);
  }

  QueryBuilder<SheetConfig, SheetConfig, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<SheetConfig, SheetConfig, QDistinct> distinctBySheetKey(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('sheetKey', caseSensitive: caseSensitive);
  }

  QueryBuilder<SheetConfig, SheetConfig, QDistinct> distinctBySheetName(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('sheetName', caseSensitive: caseSensitive);
  }
}

extension SheetConfigQueryProperty
    on QueryBuilder<SheetConfig, SheetConfig, QQueryProperty> {
  QueryBuilder<SheetConfig, List<String>, QQueryOperations>
      byValueColumnsProperty() {
    return addPropertyNameInternal('byValueColumns');
  }

  QueryBuilder<SheetConfig, String, QQueryOperations> fileIdProperty() {
    return addPropertyNameInternal('fileId');
  }

  QueryBuilder<SheetConfig, List<String>, QQueryOperations> getRowsProperty() {
    return addPropertyNameInternal('getRows');
  }

  QueryBuilder<SheetConfig, List<String>, QQueryOperations>
      headerColsProperty() {
    return addPropertyNameInternal('headerCols');
  }

  QueryBuilder<SheetConfig, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<SheetConfig, List<String>, QQueryOperations> selects1Property() {
    return addPropertyNameInternal('selects1');
  }

  QueryBuilder<SheetConfig, List<String>, QQueryOperations>
      sheetIdentStrProperty() {
    return addPropertyNameInternal('sheetIdentStr');
  }

  QueryBuilder<SheetConfig, String, QQueryOperations> sheetKeyProperty() {
    return addPropertyNameInternal('sheetKey');
  }

  QueryBuilder<SheetConfig, String, QQueryOperations> sheetNameProperty() {
    return addPropertyNameInternal('sheetName');
  }
}
