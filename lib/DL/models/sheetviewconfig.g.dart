// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sheetviewconfig.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast

extension GetSheetViewConfigCollection on Isar {
  IsarCollection<SheetViewConfig> get sheetViewConfigs {
    return getCollection('SheetViewConfig');
  }
}

final SheetViewConfigSchema = CollectionSchema(
  name: 'SheetViewConfig',
  schema:
      '{"name":"SheetViewConfig","idName":"id","properties":[{"name":"aQuerystringKey","type":"String"},{"name":"aStatus","type":"String"},{"name":"colsHeader","type":"String"},{"name":"queryVars","type":"String"}],"indexes":[],"links":[]}',
  nativeAdapter: const _SheetViewConfigNativeAdapter(),
  webAdapter: const _SheetViewConfigWebAdapter(),
  idName: 'id',
  propertyIds: {
    'aQuerystringKey': 0,
    'aStatus': 1,
    'colsHeader': 2,
    'queryVars': 3
  },
  listProperties: {},
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

class _SheetViewConfigWebAdapter extends IsarWebTypeAdapter<SheetViewConfig> {
  const _SheetViewConfigWebAdapter();

  @override
  Object serialize(
      IsarCollection<SheetViewConfig> collection, SheetViewConfig object) {
    final jsObj = IsarNative.newJsObject();
    IsarNative.jsObjectSet(jsObj, 'aQuerystringKey', object.aQuerystringKey);
    IsarNative.jsObjectSet(jsObj, 'aStatus', object.aStatus);
    IsarNative.jsObjectSet(jsObj, 'colsHeader', object.colsHeader);
    IsarNative.jsObjectSet(jsObj, 'id', object.id);
    IsarNative.jsObjectSet(jsObj, 'queryVars', object.queryVars);
    return jsObj;
  }

  @override
  SheetViewConfig deserialize(
      IsarCollection<SheetViewConfig> collection, dynamic jsObj) {
    final object = SheetViewConfig();
    object.aQuerystringKey =
        IsarNative.jsObjectGet(jsObj, 'aQuerystringKey') ?? '';
    object.aStatus = IsarNative.jsObjectGet(jsObj, 'aStatus') ?? '';
    object.colsHeader = IsarNative.jsObjectGet(jsObj, 'colsHeader') ?? '';
    object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
    object.queryVars = IsarNative.jsObjectGet(jsObj, 'queryVars') ?? '';
    return object;
  }

  @override
  P deserializeProperty<P>(Object jsObj, String propertyName) {
    switch (propertyName) {
      case 'aQuerystringKey':
        return (IsarNative.jsObjectGet(jsObj, 'aQuerystringKey') ?? '') as P;
      case 'aStatus':
        return (IsarNative.jsObjectGet(jsObj, 'aStatus') ?? '') as P;
      case 'colsHeader':
        return (IsarNative.jsObjectGet(jsObj, 'colsHeader') ?? '') as P;
      case 'id':
        return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
            as P;
      case 'queryVars':
        return (IsarNative.jsObjectGet(jsObj, 'queryVars') ?? '') as P;
      default:
        throw 'Illegal propertyName';
    }
  }

  @override
  void attachLinks(Isar isar, int id, SheetViewConfig object) {}
}

class _SheetViewConfigNativeAdapter
    extends IsarNativeTypeAdapter<SheetViewConfig> {
  const _SheetViewConfigNativeAdapter();

  @override
  void serialize(
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
    final value3 = object.queryVars;
    final _queryVars = IsarBinaryWriter.utf8Encoder.convert(value3);
    dynamicSize += (_queryVars.length) as int;
    final size = staticSize + dynamicSize;

    rawObj.buffer = alloc(size);
    rawObj.buffer_length = size;
    final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
    final writer = IsarBinaryWriter(buffer, staticSize);
    writer.writeBytes(offsets[0], _aQuerystringKey);
    writer.writeBytes(offsets[1], _aStatus);
    writer.writeBytes(offsets[2], _colsHeader);
    writer.writeBytes(offsets[3], _queryVars);
  }

  @override
  SheetViewConfig deserialize(IsarCollection<SheetViewConfig> collection,
      int id, IsarBinaryReader reader, List<int> offsets) {
    final object = SheetViewConfig();
    object.aQuerystringKey = reader.readString(offsets[0]);
    object.aStatus = reader.readString(offsets[1]);
    object.colsHeader = reader.readString(offsets[2]);
    object.id = id;
    object.queryVars = reader.readString(offsets[3]);
    return object;
  }

  @override
  P deserializeProperty<P>(
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
      default:
        throw 'Illegal propertyIndex';
    }
  }

  @override
  void attachLinks(Isar isar, int id, SheetViewConfig object) {}
}

extension SheetViewConfigQueryWhereSort
    on QueryBuilder<SheetViewConfig, SheetViewConfig, QWhere> {
  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterWhere> anyId() {
    return addWhereClauseInternal(const WhereClause(indexName: null));
  }
}

extension SheetViewConfigQueryWhere
    on QueryBuilder<SheetViewConfig, SheetViewConfig, QWhereClause> {
  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterWhereClause> idEqualTo(
      int id) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: true,
      upper: [id],
      includeUpper: true,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterWhereClause>
      idNotEqualTo(int id) {
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

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterWhereClause>
      idGreaterThan(
    int id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: include,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterWhereClause> idLessThan(
    int id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      upper: [id],
      includeUpper: include,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterWhereClause> idBetween(
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

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      queryVarsEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'queryVars',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      queryVarsGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'queryVars',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      queryVarsLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'queryVars',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      queryVarsBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'queryVars',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      queryVarsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'queryVars',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      queryVarsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'queryVars',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      queryVarsContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'queryVars',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterFilterCondition>
      queryVarsMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'queryVars',
      value: pattern,
      caseSensitive: caseSensitive,
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

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterSortBy>
      sortByQueryVars() {
    return addSortByInternal('queryVars', Sort.asc);
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterSortBy>
      sortByQueryVarsDesc() {
    return addSortByInternal('queryVars', Sort.desc);
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

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterSortBy>
      thenByQueryVars() {
    return addSortByInternal('queryVars', Sort.asc);
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QAfterSortBy>
      thenByQueryVarsDesc() {
    return addSortByInternal('queryVars', Sort.desc);
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

  QueryBuilder<SheetViewConfig, SheetViewConfig, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<SheetViewConfig, SheetViewConfig, QDistinct> distinctByQueryVars(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('queryVars', caseSensitive: caseSensitive);
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

  QueryBuilder<SheetViewConfig, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<SheetViewConfig, String, QQueryOperations> queryVarsProperty() {
    return addPropertyNameInternal('queryVars');
  }
}
