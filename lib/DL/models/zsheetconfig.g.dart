// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zsheetconfig.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetSheetConfigCollection on Isar {
  IsarCollection<SheetConfig> get sheetConfigs => getCollection();
}

const SheetConfigSchema = CollectionSchema(
  name: 'SheetConfig',
  schema:
      '{"name":"SheetConfig","idName":"id","properties":[{"name":"byValueColumns","type":"String"},{"name":"copyrightUrl","type":"String"},{"name":"createdBy","type":"String"},{"name":"fileId","type":"String"},{"name":"fileIdConfig","type":"String"},{"name":"fileUrl","type":"String"},{"name":"getRows","type":"String"},{"name":"headerCols","type":"String"},{"name":"headers","type":"String"},{"name":"selects1","type":"String"},{"name":"sheetName","type":"String"},{"name":"sheetNameConfig","type":"String"},{"name":"sheetNameFileIdKey","type":"String"}],"indexes":[{"name":"sheetNameFileIdKey","unique":true,"properties":[{"name":"sheetNameFileIdKey","type":"Hash","caseSensitive":true}]}],"links":[]}',
  idName: 'id',
  propertyIds: {
    'byValueColumns': 0,
    'copyrightUrl': 1,
    'createdBy': 2,
    'fileId': 3,
    'fileIdConfig': 4,
    'fileUrl': 5,
    'getRows': 6,
    'headerCols': 7,
    'headers': 8,
    'selects1': 9,
    'sheetName': 10,
    'sheetNameConfig': 11,
    'sheetNameFileIdKey': 12
  },
  listProperties: {},
  indexIds: {'sheetNameFileIdKey': 0},
  indexValueTypes: {
    'sheetNameFileIdKey': [
      IndexValueType.stringHash,
    ]
  },
  linkIds: {},
  backlinkLinkNames: {},
  getId: _sheetConfigGetId,
  setId: _sheetConfigSetId,
  getLinks: _sheetConfigGetLinks,
  attachLinks: _sheetConfigAttachLinks,
  serializeNative: _sheetConfigSerializeNative,
  deserializeNative: _sheetConfigDeserializeNative,
  deserializePropNative: _sheetConfigDeserializePropNative,
  serializeWeb: _sheetConfigSerializeWeb,
  deserializeWeb: _sheetConfigDeserializeWeb,
  deserializePropWeb: _sheetConfigDeserializePropWeb,
  version: 3,
);

int? _sheetConfigGetId(SheetConfig object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _sheetConfigSetId(SheetConfig object, int id) {
  object.id = id;
}

List<IsarLinkBase> _sheetConfigGetLinks(SheetConfig object) {
  return [];
}

void _sheetConfigSerializeNative(
    IsarCollection<SheetConfig> collection,
    IsarRawObject rawObj,
    SheetConfig object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.byValueColumns;
  final _byValueColumns = IsarBinaryWriter.utf8Encoder.convert(value0);
  dynamicSize += (_byValueColumns.length) as int;
  final value1 = object.copyrightUrl;
  final _copyrightUrl = IsarBinaryWriter.utf8Encoder.convert(value1);
  dynamicSize += (_copyrightUrl.length) as int;
  final value2 = object.createdBy;
  final _createdBy = IsarBinaryWriter.utf8Encoder.convert(value2);
  dynamicSize += (_createdBy.length) as int;
  final value3 = object.fileId;
  final _fileId = IsarBinaryWriter.utf8Encoder.convert(value3);
  dynamicSize += (_fileId.length) as int;
  final value4 = object.fileIdConfig;
  final _fileIdConfig = IsarBinaryWriter.utf8Encoder.convert(value4);
  dynamicSize += (_fileIdConfig.length) as int;
  final value5 = object.fileUrl;
  final _fileUrl = IsarBinaryWriter.utf8Encoder.convert(value5);
  dynamicSize += (_fileUrl.length) as int;
  final value6 = object.getRows;
  final _getRows = IsarBinaryWriter.utf8Encoder.convert(value6);
  dynamicSize += (_getRows.length) as int;
  final value7 = object.headerCols;
  final _headerCols = IsarBinaryWriter.utf8Encoder.convert(value7);
  dynamicSize += (_headerCols.length) as int;
  final value8 = object.headers;
  final _headers = IsarBinaryWriter.utf8Encoder.convert(value8);
  dynamicSize += (_headers.length) as int;
  final value9 = object.selects1;
  final _selects1 = IsarBinaryWriter.utf8Encoder.convert(value9);
  dynamicSize += (_selects1.length) as int;
  final value10 = object.sheetName;
  final _sheetName = IsarBinaryWriter.utf8Encoder.convert(value10);
  dynamicSize += (_sheetName.length) as int;
  final value11 = object.sheetNameConfig;
  final _sheetNameConfig = IsarBinaryWriter.utf8Encoder.convert(value11);
  dynamicSize += (_sheetNameConfig.length) as int;
  final value12 = object.sheetNameFileIdKey;
  final _sheetNameFileIdKey = IsarBinaryWriter.utf8Encoder.convert(value12);
  dynamicSize += (_sheetNameFileIdKey.length) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _byValueColumns);
  writer.writeBytes(offsets[1], _copyrightUrl);
  writer.writeBytes(offsets[2], _createdBy);
  writer.writeBytes(offsets[3], _fileId);
  writer.writeBytes(offsets[4], _fileIdConfig);
  writer.writeBytes(offsets[5], _fileUrl);
  writer.writeBytes(offsets[6], _getRows);
  writer.writeBytes(offsets[7], _headerCols);
  writer.writeBytes(offsets[8], _headers);
  writer.writeBytes(offsets[9], _selects1);
  writer.writeBytes(offsets[10], _sheetName);
  writer.writeBytes(offsets[11], _sheetNameConfig);
  writer.writeBytes(offsets[12], _sheetNameFileIdKey);
}

SheetConfig _sheetConfigDeserializeNative(
    IsarCollection<SheetConfig> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = SheetConfig();
  object.byValueColumns = reader.readString(offsets[0]);
  object.copyrightUrl = reader.readString(offsets[1]);
  object.createdBy = reader.readString(offsets[2]);
  object.fileId = reader.readString(offsets[3]);
  object.fileIdConfig = reader.readString(offsets[4]);
  object.fileUrl = reader.readString(offsets[5]);
  object.getRows = reader.readString(offsets[6]);
  object.headerCols = reader.readString(offsets[7]);
  object.headers = reader.readString(offsets[8]);
  object.id = id;
  object.selects1 = reader.readString(offsets[9]);
  object.sheetName = reader.readString(offsets[10]);
  object.sheetNameConfig = reader.readString(offsets[11]);
  object.sheetNameFileIdKey = reader.readString(offsets[12]);
  return object;
}

P _sheetConfigDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _sheetConfigSerializeWeb(
    IsarCollection<SheetConfig> collection, SheetConfig object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'byValueColumns', object.byValueColumns);
  IsarNative.jsObjectSet(jsObj, 'copyrightUrl', object.copyrightUrl);
  IsarNative.jsObjectSet(jsObj, 'createdBy', object.createdBy);
  IsarNative.jsObjectSet(jsObj, 'fileId', object.fileId);
  IsarNative.jsObjectSet(jsObj, 'fileIdConfig', object.fileIdConfig);
  IsarNative.jsObjectSet(jsObj, 'fileUrl', object.fileUrl);
  IsarNative.jsObjectSet(jsObj, 'getRows', object.getRows);
  IsarNative.jsObjectSet(jsObj, 'headerCols', object.headerCols);
  IsarNative.jsObjectSet(jsObj, 'headers', object.headers);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'selects1', object.selects1);
  IsarNative.jsObjectSet(jsObj, 'sheetName', object.sheetName);
  IsarNative.jsObjectSet(jsObj, 'sheetNameConfig', object.sheetNameConfig);
  IsarNative.jsObjectSet(
      jsObj, 'sheetNameFileIdKey', object.sheetNameFileIdKey);
  return jsObj;
}

SheetConfig _sheetConfigDeserializeWeb(
    IsarCollection<SheetConfig> collection, dynamic jsObj) {
  final object = SheetConfig();
  object.byValueColumns = IsarNative.jsObjectGet(jsObj, 'byValueColumns') ?? '';
  object.copyrightUrl = IsarNative.jsObjectGet(jsObj, 'copyrightUrl') ?? '';
  object.createdBy = IsarNative.jsObjectGet(jsObj, 'createdBy') ?? '';
  object.fileId = IsarNative.jsObjectGet(jsObj, 'fileId') ?? '';
  object.fileIdConfig = IsarNative.jsObjectGet(jsObj, 'fileIdConfig') ?? '';
  object.fileUrl = IsarNative.jsObjectGet(jsObj, 'fileUrl') ?? '';
  object.getRows = IsarNative.jsObjectGet(jsObj, 'getRows') ?? '';
  object.headerCols = IsarNative.jsObjectGet(jsObj, 'headerCols') ?? '';
  object.headers = IsarNative.jsObjectGet(jsObj, 'headers') ?? '';
  object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
  object.selects1 = IsarNative.jsObjectGet(jsObj, 'selects1') ?? '';
  object.sheetName = IsarNative.jsObjectGet(jsObj, 'sheetName') ?? '';
  object.sheetNameConfig =
      IsarNative.jsObjectGet(jsObj, 'sheetNameConfig') ?? '';
  object.sheetNameFileIdKey =
      IsarNative.jsObjectGet(jsObj, 'sheetNameFileIdKey') ?? '';
  return object;
}

P _sheetConfigDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'byValueColumns':
      return (IsarNative.jsObjectGet(jsObj, 'byValueColumns') ?? '') as P;
    case 'copyrightUrl':
      return (IsarNative.jsObjectGet(jsObj, 'copyrightUrl') ?? '') as P;
    case 'createdBy':
      return (IsarNative.jsObjectGet(jsObj, 'createdBy') ?? '') as P;
    case 'fileId':
      return (IsarNative.jsObjectGet(jsObj, 'fileId') ?? '') as P;
    case 'fileIdConfig':
      return (IsarNative.jsObjectGet(jsObj, 'fileIdConfig') ?? '') as P;
    case 'fileUrl':
      return (IsarNative.jsObjectGet(jsObj, 'fileUrl') ?? '') as P;
    case 'getRows':
      return (IsarNative.jsObjectGet(jsObj, 'getRows') ?? '') as P;
    case 'headerCols':
      return (IsarNative.jsObjectGet(jsObj, 'headerCols') ?? '') as P;
    case 'headers':
      return (IsarNative.jsObjectGet(jsObj, 'headers') ?? '') as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'selects1':
      return (IsarNative.jsObjectGet(jsObj, 'selects1') ?? '') as P;
    case 'sheetName':
      return (IsarNative.jsObjectGet(jsObj, 'sheetName') ?? '') as P;
    case 'sheetNameConfig':
      return (IsarNative.jsObjectGet(jsObj, 'sheetNameConfig') ?? '') as P;
    case 'sheetNameFileIdKey':
      return (IsarNative.jsObjectGet(jsObj, 'sheetNameFileIdKey') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _sheetConfigAttachLinks(IsarCollection col, int id, SheetConfig object) {}

extension SheetConfigByIndex on IsarCollection<SheetConfig> {
  Future<SheetConfig?> getBySheetNameFileIdKey(String sheetNameFileIdKey) {
    return getByIndex('sheetNameFileIdKey', [sheetNameFileIdKey]);
  }

  SheetConfig? getBySheetNameFileIdKeySync(String sheetNameFileIdKey) {
    return getByIndexSync('sheetNameFileIdKey', [sheetNameFileIdKey]);
  }

  Future<bool> deleteBySheetNameFileIdKey(String sheetNameFileIdKey) {
    return deleteByIndex('sheetNameFileIdKey', [sheetNameFileIdKey]);
  }

  bool deleteBySheetNameFileIdKeySync(String sheetNameFileIdKey) {
    return deleteByIndexSync('sheetNameFileIdKey', [sheetNameFileIdKey]);
  }

  Future<List<SheetConfig?>> getAllBySheetNameFileIdKey(
      List<String> sheetNameFileIdKeyValues) {
    final values = sheetNameFileIdKeyValues.map((e) => [e]).toList();
    return getAllByIndex('sheetNameFileIdKey', values);
  }

  List<SheetConfig?> getAllBySheetNameFileIdKeySync(
      List<String> sheetNameFileIdKeyValues) {
    final values = sheetNameFileIdKeyValues.map((e) => [e]).toList();
    return getAllByIndexSync('sheetNameFileIdKey', values);
  }

  Future<int> deleteAllBySheetNameFileIdKey(
      List<String> sheetNameFileIdKeyValues) {
    final values = sheetNameFileIdKeyValues.map((e) => [e]).toList();
    return deleteAllByIndex('sheetNameFileIdKey', values);
  }

  int deleteAllBySheetNameFileIdKeySync(List<String> sheetNameFileIdKeyValues) {
    final values = sheetNameFileIdKeyValues.map((e) => [e]).toList();
    return deleteAllByIndexSync('sheetNameFileIdKey', values);
  }
}

extension SheetConfigQueryWhereSort
    on QueryBuilder<SheetConfig, SheetConfig, QWhere> {
  QueryBuilder<SheetConfig, SheetConfig, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterWhere> anySheetNameFileIdKey() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'sheetNameFileIdKey'));
  }
}

extension SheetConfigQueryWhere
    on QueryBuilder<SheetConfig, SheetConfig, QWhereClause> {
  QueryBuilder<SheetConfig, SheetConfig, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterWhereClause> idNotEqualTo(
      int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      );
    }
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterWhereClause> idGreaterThan(
      int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerId,
      includeLower: includeLower,
      upper: upperId,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterWhereClause>
      sheetNameFileIdKeyEqualTo(String sheetNameFileIdKey) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'sheetNameFileIdKey',
      value: [sheetNameFileIdKey],
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterWhereClause>
      sheetNameFileIdKeyNotEqualTo(String sheetNameFileIdKey) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'sheetNameFileIdKey',
        upper: [sheetNameFileIdKey],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'sheetNameFileIdKey',
        lower: [sheetNameFileIdKey],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'sheetNameFileIdKey',
        lower: [sheetNameFileIdKey],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'sheetNameFileIdKey',
        upper: [sheetNameFileIdKey],
        includeUpper: false,
      ));
    }
  }
}

extension SheetConfigQueryFilter
    on QueryBuilder<SheetConfig, SheetConfig, QFilterCondition> {
  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      byValueColumnsEqualTo(
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
      byValueColumnsGreaterThan(
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
      byValueColumnsLessThan(
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
      byValueColumnsBetween(
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
      byValueColumnsStartsWith(
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
      byValueColumnsEndsWith(
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
      byValueColumnsContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'byValueColumns',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      byValueColumnsMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'byValueColumns',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      copyrightUrlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'copyrightUrl',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      copyrightUrlGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'copyrightUrl',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      copyrightUrlLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'copyrightUrl',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      copyrightUrlBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'copyrightUrl',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      copyrightUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'copyrightUrl',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      copyrightUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'copyrightUrl',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      copyrightUrlContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'copyrightUrl',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      copyrightUrlMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'copyrightUrl',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      createdByEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'createdBy',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      createdByGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'createdBy',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      createdByLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'createdBy',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      createdByBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'createdBy',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      createdByStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'createdBy',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      createdByEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'createdBy',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      createdByContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'createdBy',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      createdByMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'createdBy',
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
      fileIdConfigEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'fileIdConfig',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      fileIdConfigGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'fileIdConfig',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      fileIdConfigLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'fileIdConfig',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      fileIdConfigBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'fileIdConfig',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      fileIdConfigStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'fileIdConfig',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      fileIdConfigEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'fileIdConfig',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      fileIdConfigContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'fileIdConfig',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      fileIdConfigMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'fileIdConfig',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition> fileUrlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'fileUrl',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      fileUrlGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'fileUrl',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition> fileUrlLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'fileUrl',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition> fileUrlBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'fileUrl',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      fileUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'fileUrl',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition> fileUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'fileUrl',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition> fileUrlContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'fileUrl',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition> fileUrlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'fileUrl',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition> getRowsEqualTo(
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
      getRowsGreaterThan(
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

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition> getRowsLessThan(
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

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition> getRowsBetween(
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
      getRowsStartsWith(
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

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition> getRowsEndsWith(
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

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition> getRowsContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'getRows',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition> getRowsMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'getRows',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      headerColsEqualTo(
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
      headerColsGreaterThan(
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
      headerColsLessThan(
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
      headerColsBetween(
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
      headerColsStartsWith(
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
      headerColsEndsWith(
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
      headerColsContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'headerCols',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      headerColsMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'headerCols',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition> headersEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'headers',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      headersGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'headers',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition> headersLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'headers',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition> headersBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'headers',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      headersStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'headers',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition> headersEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'headers',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition> headersContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'headers',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition> headersMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'headers',
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

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition> selects1EqualTo(
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
      selects1GreaterThan(
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
      selects1LessThan(
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

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition> selects1Between(
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
      selects1StartsWith(
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
      selects1EndsWith(
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
      selects1Contains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'selects1',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition> selects1Matches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'selects1',
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

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      sheetNameConfigEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'sheetNameConfig',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      sheetNameConfigGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'sheetNameConfig',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      sheetNameConfigLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'sheetNameConfig',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      sheetNameConfigBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'sheetNameConfig',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      sheetNameConfigStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'sheetNameConfig',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      sheetNameConfigEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'sheetNameConfig',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      sheetNameConfigContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'sheetNameConfig',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      sheetNameConfigMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'sheetNameConfig',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      sheetNameFileIdKeyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'sheetNameFileIdKey',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      sheetNameFileIdKeyGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'sheetNameFileIdKey',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      sheetNameFileIdKeyLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'sheetNameFileIdKey',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      sheetNameFileIdKeyBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'sheetNameFileIdKey',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      sheetNameFileIdKeyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'sheetNameFileIdKey',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      sheetNameFileIdKeyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'sheetNameFileIdKey',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      sheetNameFileIdKeyContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'sheetNameFileIdKey',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterFilterCondition>
      sheetNameFileIdKeyMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'sheetNameFileIdKey',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension SheetConfigQueryLinks
    on QueryBuilder<SheetConfig, SheetConfig, QFilterCondition> {}

extension SheetConfigQueryWhereSortBy
    on QueryBuilder<SheetConfig, SheetConfig, QSortBy> {
  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy> sortByByValueColumns() {
    return addSortByInternal('byValueColumns', Sort.asc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy>
      sortByByValueColumnsDesc() {
    return addSortByInternal('byValueColumns', Sort.desc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy> sortByCopyrightUrl() {
    return addSortByInternal('copyrightUrl', Sort.asc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy>
      sortByCopyrightUrlDesc() {
    return addSortByInternal('copyrightUrl', Sort.desc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy> sortByCreatedBy() {
    return addSortByInternal('createdBy', Sort.asc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy> sortByCreatedByDesc() {
    return addSortByInternal('createdBy', Sort.desc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy> sortByFileId() {
    return addSortByInternal('fileId', Sort.asc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy> sortByFileIdDesc() {
    return addSortByInternal('fileId', Sort.desc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy> sortByFileIdConfig() {
    return addSortByInternal('fileIdConfig', Sort.asc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy>
      sortByFileIdConfigDesc() {
    return addSortByInternal('fileIdConfig', Sort.desc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy> sortByFileUrl() {
    return addSortByInternal('fileUrl', Sort.asc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy> sortByFileUrlDesc() {
    return addSortByInternal('fileUrl', Sort.desc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy> sortByGetRows() {
    return addSortByInternal('getRows', Sort.asc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy> sortByGetRowsDesc() {
    return addSortByInternal('getRows', Sort.desc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy> sortByHeaderCols() {
    return addSortByInternal('headerCols', Sort.asc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy> sortByHeaderColsDesc() {
    return addSortByInternal('headerCols', Sort.desc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy> sortByHeaders() {
    return addSortByInternal('headers', Sort.asc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy> sortByHeadersDesc() {
    return addSortByInternal('headers', Sort.desc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy> sortBySelects1() {
    return addSortByInternal('selects1', Sort.asc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy> sortBySelects1Desc() {
    return addSortByInternal('selects1', Sort.desc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy> sortBySheetName() {
    return addSortByInternal('sheetName', Sort.asc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy> sortBySheetNameDesc() {
    return addSortByInternal('sheetName', Sort.desc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy> sortBySheetNameConfig() {
    return addSortByInternal('sheetNameConfig', Sort.asc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy>
      sortBySheetNameConfigDesc() {
    return addSortByInternal('sheetNameConfig', Sort.desc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy>
      sortBySheetNameFileIdKey() {
    return addSortByInternal('sheetNameFileIdKey', Sort.asc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy>
      sortBySheetNameFileIdKeyDesc() {
    return addSortByInternal('sheetNameFileIdKey', Sort.desc);
  }
}

extension SheetConfigQueryWhereSortThenBy
    on QueryBuilder<SheetConfig, SheetConfig, QSortThenBy> {
  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy> thenByByValueColumns() {
    return addSortByInternal('byValueColumns', Sort.asc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy>
      thenByByValueColumnsDesc() {
    return addSortByInternal('byValueColumns', Sort.desc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy> thenByCopyrightUrl() {
    return addSortByInternal('copyrightUrl', Sort.asc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy>
      thenByCopyrightUrlDesc() {
    return addSortByInternal('copyrightUrl', Sort.desc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy> thenByCreatedBy() {
    return addSortByInternal('createdBy', Sort.asc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy> thenByCreatedByDesc() {
    return addSortByInternal('createdBy', Sort.desc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy> thenByFileId() {
    return addSortByInternal('fileId', Sort.asc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy> thenByFileIdDesc() {
    return addSortByInternal('fileId', Sort.desc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy> thenByFileIdConfig() {
    return addSortByInternal('fileIdConfig', Sort.asc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy>
      thenByFileIdConfigDesc() {
    return addSortByInternal('fileIdConfig', Sort.desc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy> thenByFileUrl() {
    return addSortByInternal('fileUrl', Sort.asc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy> thenByFileUrlDesc() {
    return addSortByInternal('fileUrl', Sort.desc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy> thenByGetRows() {
    return addSortByInternal('getRows', Sort.asc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy> thenByGetRowsDesc() {
    return addSortByInternal('getRows', Sort.desc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy> thenByHeaderCols() {
    return addSortByInternal('headerCols', Sort.asc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy> thenByHeaderColsDesc() {
    return addSortByInternal('headerCols', Sort.desc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy> thenByHeaders() {
    return addSortByInternal('headers', Sort.asc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy> thenByHeadersDesc() {
    return addSortByInternal('headers', Sort.desc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy> thenBySelects1() {
    return addSortByInternal('selects1', Sort.asc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy> thenBySelects1Desc() {
    return addSortByInternal('selects1', Sort.desc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy> thenBySheetName() {
    return addSortByInternal('sheetName', Sort.asc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy> thenBySheetNameDesc() {
    return addSortByInternal('sheetName', Sort.desc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy> thenBySheetNameConfig() {
    return addSortByInternal('sheetNameConfig', Sort.asc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy>
      thenBySheetNameConfigDesc() {
    return addSortByInternal('sheetNameConfig', Sort.desc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy>
      thenBySheetNameFileIdKey() {
    return addSortByInternal('sheetNameFileIdKey', Sort.asc);
  }

  QueryBuilder<SheetConfig, SheetConfig, QAfterSortBy>
      thenBySheetNameFileIdKeyDesc() {
    return addSortByInternal('sheetNameFileIdKey', Sort.desc);
  }
}

extension SheetConfigQueryWhereDistinct
    on QueryBuilder<SheetConfig, SheetConfig, QDistinct> {
  QueryBuilder<SheetConfig, SheetConfig, QDistinct> distinctByByValueColumns(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('byValueColumns',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<SheetConfig, SheetConfig, QDistinct> distinctByCopyrightUrl(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('copyrightUrl', caseSensitive: caseSensitive);
  }

  QueryBuilder<SheetConfig, SheetConfig, QDistinct> distinctByCreatedBy(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('createdBy', caseSensitive: caseSensitive);
  }

  QueryBuilder<SheetConfig, SheetConfig, QDistinct> distinctByFileId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('fileId', caseSensitive: caseSensitive);
  }

  QueryBuilder<SheetConfig, SheetConfig, QDistinct> distinctByFileIdConfig(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('fileIdConfig', caseSensitive: caseSensitive);
  }

  QueryBuilder<SheetConfig, SheetConfig, QDistinct> distinctByFileUrl(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('fileUrl', caseSensitive: caseSensitive);
  }

  QueryBuilder<SheetConfig, SheetConfig, QDistinct> distinctByGetRows(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('getRows', caseSensitive: caseSensitive);
  }

  QueryBuilder<SheetConfig, SheetConfig, QDistinct> distinctByHeaderCols(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('headerCols', caseSensitive: caseSensitive);
  }

  QueryBuilder<SheetConfig, SheetConfig, QDistinct> distinctByHeaders(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('headers', caseSensitive: caseSensitive);
  }

  QueryBuilder<SheetConfig, SheetConfig, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<SheetConfig, SheetConfig, QDistinct> distinctBySelects1(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('selects1', caseSensitive: caseSensitive);
  }

  QueryBuilder<SheetConfig, SheetConfig, QDistinct> distinctBySheetName(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('sheetName', caseSensitive: caseSensitive);
  }

  QueryBuilder<SheetConfig, SheetConfig, QDistinct> distinctBySheetNameConfig(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('sheetNameConfig',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<SheetConfig, SheetConfig, QDistinct>
      distinctBySheetNameFileIdKey({bool caseSensitive = true}) {
    return addDistinctByInternal('sheetNameFileIdKey',
        caseSensitive: caseSensitive);
  }
}

extension SheetConfigQueryProperty
    on QueryBuilder<SheetConfig, SheetConfig, QQueryProperty> {
  QueryBuilder<SheetConfig, String, QQueryOperations> byValueColumnsProperty() {
    return addPropertyNameInternal('byValueColumns');
  }

  QueryBuilder<SheetConfig, String, QQueryOperations> copyrightUrlProperty() {
    return addPropertyNameInternal('copyrightUrl');
  }

  QueryBuilder<SheetConfig, String, QQueryOperations> createdByProperty() {
    return addPropertyNameInternal('createdBy');
  }

  QueryBuilder<SheetConfig, String, QQueryOperations> fileIdProperty() {
    return addPropertyNameInternal('fileId');
  }

  QueryBuilder<SheetConfig, String, QQueryOperations> fileIdConfigProperty() {
    return addPropertyNameInternal('fileIdConfig');
  }

  QueryBuilder<SheetConfig, String, QQueryOperations> fileUrlProperty() {
    return addPropertyNameInternal('fileUrl');
  }

  QueryBuilder<SheetConfig, String, QQueryOperations> getRowsProperty() {
    return addPropertyNameInternal('getRows');
  }

  QueryBuilder<SheetConfig, String, QQueryOperations> headerColsProperty() {
    return addPropertyNameInternal('headerCols');
  }

  QueryBuilder<SheetConfig, String, QQueryOperations> headersProperty() {
    return addPropertyNameInternal('headers');
  }

  QueryBuilder<SheetConfig, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<SheetConfig, String, QQueryOperations> selects1Property() {
    return addPropertyNameInternal('selects1');
  }

  QueryBuilder<SheetConfig, String, QQueryOperations> sheetNameProperty() {
    return addPropertyNameInternal('sheetName');
  }

  QueryBuilder<SheetConfig, String, QQueryOperations>
      sheetNameConfigProperty() {
    return addPropertyNameInternal('sheetNameConfig');
  }

  QueryBuilder<SheetConfig, String, QQueryOperations>
      sheetNameFileIdKeyProperty() {
    return addPropertyNameInternal('sheetNameFileIdKey');
  }
}
