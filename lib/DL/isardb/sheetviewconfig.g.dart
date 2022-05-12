// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sheetviewconfig.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetSheetViewConfigCollection on Isar {
  IsarCollection<SheetViewConfig> get sheetViewConfigs => getCollection();
}

const SheetViewConfigSchema = CollectionSchema(
  name: 'SheetViewConfig',
  schema:
      '{"name":"SheetViewConfig","idName":"id","properties":[{"name":"aQuerystringKey","type":"String"},{"name":"aStatus","type":"String"},{"name":"colsHeader","type":"String"},{"name":"getRowsFirst","type":"String"},{"name":"getRowsFrom","type":"String"},{"name":"getRowsLast","type":"String"},{"name":"getRowsTo","type":"String"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {
    'aQuerystringKey': 0,
    'aStatus': 1,
    'colsHeader': 2,
    'getRowsFirst': 3,
    'getRowsFrom': 4,
    'getRowsLast': 5,
    'getRowsTo': 6
  },
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _sheetViewConfigGetId,
  setId: _sheetViewConfigSetId,
  getLinks: _sheetViewConfigGetLinks,
  attachLinks: _sheetViewConfigAttachLinks,
  serializeNative: _sheetViewConfigSerializeNative,
  deserializeNative: _sheetViewConfigDeserializeNative,
  deserializePropNative: _sheetViewConfigDeserializePropNative,
  serializeWeb: _sheetViewConfigSerializeWeb,
  deserializeWeb: _sheetViewConfigDeserializeWeb,
  deserializePropWeb: _sheetViewConfigDeserializePropWeb,
  version: 3,
);

int? _sheetViewConfigGetId(SheetViewConfig object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _sheetViewConfigSetId(SheetViewConfig object, int id) {
  object.id = id;
}

List<IsarLinkBase> _sheetViewConfigGetLinks(SheetViewConfig object) {
  return [];
}

void _sheetViewConfigSerializeNative(
    IsarCollection<SheetViewConfig> collection,
    IsarRawObject rawObj,
    SheetViewConfig object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.aQuerystringKey;
  final _aQuerystringKey = IsarBinaryWriter.utf8Encoder.convert(value0);
  dynamicSize += (_aQuerystringKey.length) as int;
  final value1 = object.aStatus;
  final _aStatus = IsarBinaryWriter.utf8Encoder.convert(value1);
  dynamicSize += (_aStatus.length) as int;
  final value2 = object.colsHeader;
  final _colsHeader = IsarBinaryWriter.utf8Encoder.convert(value2);
  dynamicSize += (_colsHeader.length) as int;
  final value3 = object.getRowsFirst;
  final _getRowsFirst = IsarBinaryWriter.utf8Encoder.convert(value3);
  dynamicSize += (_getRowsFirst.length) as int;
  final value4 = object.getRowsFrom;
  final _getRowsFrom = IsarBinaryWriter.utf8Encoder.convert(value4);
  dynamicSize += (_getRowsFrom.length) as int;
  final value5 = object.getRowsLast;
  final _getRowsLast = IsarBinaryWriter.utf8Encoder.convert(value5);
  dynamicSize += (_getRowsLast.length) as int;
  final value6 = object.getRowsTo;
  final _getRowsTo = IsarBinaryWriter.utf8Encoder.convert(value6);
  dynamicSize += (_getRowsTo.length) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _aQuerystringKey);
  writer.writeBytes(offsets[1], _aStatus);
  writer.writeBytes(offsets[2], _colsHeader);
  writer.writeBytes(offsets[3], _getRowsFirst);
  writer.writeBytes(offsets[4], _getRowsFrom);
  writer.writeBytes(offsets[5], _getRowsLast);
  writer.writeBytes(offsets[6], _getRowsTo);
}

SheetViewConfig _sheetViewConfigDeserializeNative(
    IsarCollection<SheetViewConfig> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = SheetViewConfig();
  object.aQuerystringKey = reader.readString(offsets[0]);
  object.aStatus = reader.readString(offsets[1]);
  object.colsHeader = reader.readString(offsets[2]);
  object.getRowsFirst = reader.readString(offsets[3]);
  object.getRowsFrom = reader.readString(offsets[4]);
  object.getRowsLast = reader.readString(offsets[5]);
  object.getRowsTo = reader.readString(offsets[6]);
  object.id = id;
  return object;
}

P _sheetViewConfigDeserializePropNative<P>(
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
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _sheetViewConfigSerializeWeb(
    IsarCollection<SheetViewConfig> collection, SheetViewConfig object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'aQuerystringKey', object.aQuerystringKey);
  IsarNative.jsObjectSet(jsObj, 'aStatus', object.aStatus);
  IsarNative.jsObjectSet(jsObj, 'colsHeader', object.colsHeader);
  IsarNative.jsObjectSet(jsObj, 'getRowsFirst', object.getRowsFirst);
  IsarNative.jsObjectSet(jsObj, 'getRowsFrom', object.getRowsFrom);
  IsarNative.jsObjectSet(jsObj, 'getRowsLast', object.getRowsLast);
  IsarNative.jsObjectSet(jsObj, 'getRowsTo', object.getRowsTo);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  return jsObj;
}

SheetViewConfig _sheetViewConfigDeserializeWeb(
    IsarCollection<SheetViewConfig> collection, dynamic jsObj) {
  final object = SheetViewConfig();
  object.aQuerystringKey =
      IsarNative.jsObjectGet(jsObj, 'aQuerystringKey') ?? '';
  object.aStatus = IsarNative.jsObjectGet(jsObj, 'aStatus') ?? '';
  object.colsHeader = IsarNative.jsObjectGet(jsObj, 'colsHeader') ?? '';
  object.getRowsFirst = IsarNative.jsObjectGet(jsObj, 'getRowsFirst') ?? '';
  object.getRowsFrom = IsarNative.jsObjectGet(jsObj, 'getRowsFrom') ?? '';
  object.getRowsLast = IsarNative.jsObjectGet(jsObj, 'getRowsLast') ?? '';
  object.getRowsTo = IsarNative.jsObjectGet(jsObj, 'getRowsTo') ?? '';
  object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
  return object;
}

P _sheetViewConfigDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'aQuerystringKey':
      return (IsarNative.jsObjectGet(jsObj, 'aQuerystringKey') ?? '') as P;
    case 'aStatus':
      return (IsarNative.jsObjectGet(jsObj, 'aStatus') ?? '') as P;
    case 'colsHeader':
      return (IsarNative.jsObjectGet(jsObj, 'colsHeader') ?? '') as P;
    case 'getRowsFirst':
      return (IsarNative.jsObjectGet(jsObj, 'getRowsFirst') ?? '') as P;
    case 'getRowsFrom':
      return (IsarNative.jsObjectGet(jsObj, 'getRowsFrom') ?? '') as P;
    case 'getRowsLast':
      return (IsarNative.jsObjectGet(jsObj, 'getRowsLast') ?? '') as P;
    case 'getRowsTo':
      return (IsarNative.jsObjectGet(jsObj, 'getRowsTo') ?? '') as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _sheetViewConfigAttachLinks(
    IsarCollection col, int id, SheetViewConfig object) {}

extension SheetViewConfigQueryWhereSort
    on QueryBuilder<SheetViewConfig, SheetViewConfig, QWhere> {
  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension SheetViewConfigQueryWhere
    on QueryBuilder<SheetViewConfig, SheetViewConfig, QWhereClause> {
  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterWhereClause> idEqualTo(
      int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterWhereClause>
      idNotEqualTo(int id) {
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

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterWhereClause>
      idGreaterThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterWhereClause> idLessThan(
      int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterWhereClause> idBetween(
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
}

extension SheetViewConfigQueryFilter
    on QueryBuilder<SheetViewConfig, SheetViewConfig, QFilterCondition> {
  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      aQuerystringKeyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'aQuerystringKey',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      aQuerystringKeyGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'aQuerystringKey',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      aQuerystringKeyLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'aQuerystringKey',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      aQuerystringKeyBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'aQuerystringKey',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      aQuerystringKeyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'aQuerystringKey',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      aQuerystringKeyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'aQuerystringKey',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      aQuerystringKeyContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'aQuerystringKey',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      aQuerystringKeyMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'aQuerystringKey',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      aStatusEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'aStatus',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      aStatusGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'aStatus',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      aStatusLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'aStatus',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      aStatusBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'aStatus',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      aStatusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'aStatus',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      aStatusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'aStatus',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      aStatusContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'aStatus',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      aStatusMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'aStatus',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      colsHeaderEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'colsHeader',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      colsHeaderGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'colsHeader',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      colsHeaderLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'colsHeader',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      colsHeaderBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'colsHeader',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      colsHeaderStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'colsHeader',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      colsHeaderEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'colsHeader',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      colsHeaderContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'colsHeader',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      colsHeaderMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'colsHeader',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      getRowsFirstEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'getRowsFirst',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      getRowsFirstGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'getRowsFirst',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      getRowsFirstLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'getRowsFirst',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      getRowsFirstBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'getRowsFirst',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      getRowsFirstStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'getRowsFirst',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      getRowsFirstEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'getRowsFirst',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      getRowsFirstContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'getRowsFirst',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      getRowsFirstMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'getRowsFirst',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      getRowsFromEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'getRowsFrom',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      getRowsFromGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'getRowsFrom',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      getRowsFromLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'getRowsFrom',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      getRowsFromBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'getRowsFrom',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      getRowsFromStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'getRowsFrom',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      getRowsFromEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'getRowsFrom',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      getRowsFromContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'getRowsFrom',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      getRowsFromMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'getRowsFrom',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      getRowsLastEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'getRowsLast',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      getRowsLastGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'getRowsLast',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      getRowsLastLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'getRowsLast',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      getRowsLastBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'getRowsLast',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      getRowsLastStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'getRowsLast',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      getRowsLastEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'getRowsLast',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      getRowsLastContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'getRowsLast',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      getRowsLastMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'getRowsLast',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      getRowsToEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'getRowsTo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      getRowsToGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'getRowsTo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      getRowsToLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'getRowsTo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      getRowsToBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'getRowsTo',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      getRowsToStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'getRowsTo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      getRowsToEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'getRowsTo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      getRowsToContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'getRowsTo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      getRowsToMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'getRowsTo',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      idBetween(
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
}

extension SheetViewConfigQueryLinks
    on QueryBuilder<SheetViewConfig, SheetViewConfig, QFilterCondition> {}

extension SheetViewConfigQueryWhereSortBy
    on QueryBuilder<SheetViewConfig, SheetViewConfig, QSortBy> {
  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterSortBy>
      sortByAQuerystringKey() {
    return addSortByInternal('aQuerystringKey', Sort.asc);
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterSortBy>
      sortByAQuerystringKeyDesc() {
    return addSortByInternal('aQuerystringKey', Sort.desc);
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterSortBy> sortByAStatus() {
    return addSortByInternal('aStatus', Sort.asc);
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterSortBy>
      sortByAStatusDesc() {
    return addSortByInternal('aStatus', Sort.desc);
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterSortBy>
      sortByColsHeader() {
    return addSortByInternal('colsHeader', Sort.asc);
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterSortBy>
      sortByColsHeaderDesc() {
    return addSortByInternal('colsHeader', Sort.desc);
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterSortBy>
      sortByGetRowsFirst() {
    return addSortByInternal('getRowsFirst', Sort.asc);
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterSortBy>
      sortByGetRowsFirstDesc() {
    return addSortByInternal('getRowsFirst', Sort.desc);
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterSortBy>
      sortByGetRowsFrom() {
    return addSortByInternal('getRowsFrom', Sort.asc);
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterSortBy>
      sortByGetRowsFromDesc() {
    return addSortByInternal('getRowsFrom', Sort.desc);
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterSortBy>
      sortByGetRowsLast() {
    return addSortByInternal('getRowsLast', Sort.asc);
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterSortBy>
      sortByGetRowsLastDesc() {
    return addSortByInternal('getRowsLast', Sort.desc);
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterSortBy>
      sortByGetRowsTo() {
    return addSortByInternal('getRowsTo', Sort.asc);
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterSortBy>
      sortByGetRowsToDesc() {
    return addSortByInternal('getRowsTo', Sort.desc);
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }
}

extension SheetViewConfigQueryWhereSortThenBy
    on QueryBuilder<SheetViewConfig, SheetViewConfig, QSortThenBy> {
  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterSortBy>
      thenByAQuerystringKey() {
    return addSortByInternal('aQuerystringKey', Sort.asc);
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterSortBy>
      thenByAQuerystringKeyDesc() {
    return addSortByInternal('aQuerystringKey', Sort.desc);
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterSortBy> thenByAStatus() {
    return addSortByInternal('aStatus', Sort.asc);
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterSortBy>
      thenByAStatusDesc() {
    return addSortByInternal('aStatus', Sort.desc);
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterSortBy>
      thenByColsHeader() {
    return addSortByInternal('colsHeader', Sort.asc);
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterSortBy>
      thenByColsHeaderDesc() {
    return addSortByInternal('colsHeader', Sort.desc);
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterSortBy>
      thenByGetRowsFirst() {
    return addSortByInternal('getRowsFirst', Sort.asc);
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterSortBy>
      thenByGetRowsFirstDesc() {
    return addSortByInternal('getRowsFirst', Sort.desc);
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterSortBy>
      thenByGetRowsFrom() {
    return addSortByInternal('getRowsFrom', Sort.asc);
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterSortBy>
      thenByGetRowsFromDesc() {
    return addSortByInternal('getRowsFrom', Sort.desc);
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterSortBy>
      thenByGetRowsLast() {
    return addSortByInternal('getRowsLast', Sort.asc);
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterSortBy>
      thenByGetRowsLastDesc() {
    return addSortByInternal('getRowsLast', Sort.desc);
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterSortBy>
      thenByGetRowsTo() {
    return addSortByInternal('getRowsTo', Sort.asc);
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterSortBy>
      thenByGetRowsToDesc() {
    return addSortByInternal('getRowsTo', Sort.desc);
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }
}

extension SheetViewConfigQueryWhereDistinct
    on QueryBuilder<SheetViewConfig, SheetViewConfig, QDistinct> {
  QueryBuilder<SheetViewConfig, SheetViewConfig, QDistinct>
      distinctByAQuerystringKey({bool caseSensitive = true}) {
    return addDistinctByInternal('aQuerystringKey',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QDistinct> distinctByAStatus(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('aStatus', caseSensitive: caseSensitive);
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QDistinct>
      distinctByColsHeader({bool caseSensitive = true}) {
    return addDistinctByInternal('colsHeader', caseSensitive: caseSensitive);
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QDistinct>
      distinctByGetRowsFirst({bool caseSensitive = true}) {
    return addDistinctByInternal('getRowsFirst', caseSensitive: caseSensitive);
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QDistinct>
      distinctByGetRowsFrom({bool caseSensitive = true}) {
    return addDistinctByInternal('getRowsFrom', caseSensitive: caseSensitive);
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QDistinct>
      distinctByGetRowsLast({bool caseSensitive = true}) {
    return addDistinctByInternal('getRowsLast', caseSensitive: caseSensitive);
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QDistinct> distinctByGetRowsTo(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('getRowsTo', caseSensitive: caseSensitive);
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }
}

extension SheetViewConfigQueryProperty
    on QueryBuilder<SheetViewConfig, SheetViewConfig, QQueryProperty> {
  QueryBuilder<SheetViewConfig, String, QQueryOperations>
      aQuerystringKeyProperty() {
    return addPropertyNameInternal('aQuerystringKey');
  }

  QueryBuilder<SheetViewConfig, String, QQueryOperations> aStatusProperty() {
    return addPropertyNameInternal('aStatus');
  }

  QueryBuilder<SheetViewConfig, String, QQueryOperations> colsHeaderProperty() {
    return addPropertyNameInternal('colsHeader');
  }

  QueryBuilder<SheetViewConfig, String, QQueryOperations>
      getRowsFirstProperty() {
    return addPropertyNameInternal('getRowsFirst');
  }

  QueryBuilder<SheetViewConfig, String, QQueryOperations>
      getRowsFromProperty() {
    return addPropertyNameInternal('getRowsFrom');
  }

  QueryBuilder<SheetViewConfig, String, QQueryOperations>
      getRowsLastProperty() {
    return addPropertyNameInternal('getRowsLast');
  }

  QueryBuilder<SheetViewConfig, String, QQueryOperations> getRowsToProperty() {
    return addPropertyNameInternal('getRowsTo');
  }

  QueryBuilder<SheetViewConfig, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }
}
