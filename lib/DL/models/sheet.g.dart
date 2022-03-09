// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sheet.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast

extension GetSheetCollection on Isar {
  IsarCollection<Sheet> get sheets {
    return getCollection('Sheet');
  }
}

final SheetSchema = CollectionSchema(
  name: 'Sheet',
  schema:
      '{"name":"Sheet","idName":"id","properties":[{"name":"cacheKey","type":"String"},{"name":"cols","type":"StringList"},{"name":"rows","type":"StringList"}],"indexes":[],"links":[]}',
  nativeAdapter: const _SheetNativeAdapter(),
  webAdapter: const _SheetWebAdapter(),
  idName: 'id',
  propertyIds: {'cacheKey': 0, 'cols': 1, 'rows': 2},
  listProperties: {'cols', 'rows'},
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

class _SheetWebAdapter extends IsarWebTypeAdapter<Sheet> {
  const _SheetWebAdapter();

  @override
  Object serialize(IsarCollection<Sheet> collection, Sheet object) {
    final jsObj = IsarNative.newJsObject();
    IsarNative.jsObjectSet(jsObj, 'cacheKey', object.cacheKey);
    IsarNative.jsObjectSet(jsObj, 'cols', object.cols);
    IsarNative.jsObjectSet(jsObj, 'id', object.id);
    IsarNative.jsObjectSet(jsObj, 'rows', object.rows);
    return jsObj;
  }

  @override
  Sheet deserialize(IsarCollection<Sheet> collection, dynamic jsObj) {
    final object = Sheet();
    object.cacheKey = IsarNative.jsObjectGet(jsObj, 'cacheKey') ?? '';
    object.cols = (IsarNative.jsObjectGet(jsObj, 'cols') as List?)
            ?.map((e) => e ?? '')
            .toList()
            .cast<String>() ??
        [];
    object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
    object.rows = (IsarNative.jsObjectGet(jsObj, 'rows') as List?)
            ?.map((e) => e ?? '')
            .toList()
            .cast<String>() ??
        [];
    return object;
  }

  @override
  P deserializeProperty<P>(Object jsObj, String propertyName) {
    switch (propertyName) {
      case 'cacheKey':
        return (IsarNative.jsObjectGet(jsObj, 'cacheKey') ?? '') as P;
      case 'cols':
        return ((IsarNative.jsObjectGet(jsObj, 'cols') as List?)
                ?.map((e) => e ?? '')
                .toList()
                .cast<String>() ??
            []) as P;
      case 'id':
        return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
            as P;
      case 'rows':
        return ((IsarNative.jsObjectGet(jsObj, 'rows') as List?)
                ?.map((e) => e ?? '')
                .toList()
                .cast<String>() ??
            []) as P;
      default:
        throw 'Illegal propertyName';
    }
  }

  @override
  void attachLinks(Isar isar, int id, Sheet object) {}
}

class _SheetNativeAdapter extends IsarNativeTypeAdapter<Sheet> {
  const _SheetNativeAdapter();

  @override
  void serialize(IsarCollection<Sheet> collection, IsarRawObject rawObj,
      Sheet object, int staticSize, List<int> offsets, AdapterAlloc alloc) {
    var dynamicSize = 0;
    final value0 = object.cacheKey;
    final _cacheKey = IsarBinaryWriter.utf8Encoder.convert(value0);
    dynamicSize += (_cacheKey.length) as int;
    final value1 = object.cols;
    dynamicSize += (value1.length) * 8;
    final bytesList1 = <IsarUint8List>[];
    for (var str in value1) {
      final bytes = IsarBinaryWriter.utf8Encoder.convert(str);
      bytesList1.add(bytes);
      dynamicSize += bytes.length as int;
    }
    final _cols = bytesList1;
    final value2 = object.rows;
    dynamicSize += (value2.length) * 8;
    final bytesList2 = <IsarUint8List>[];
    for (var str in value2) {
      final bytes = IsarBinaryWriter.utf8Encoder.convert(str);
      bytesList2.add(bytes);
      dynamicSize += bytes.length as int;
    }
    final _rows = bytesList2;
    final size = staticSize + dynamicSize;

    rawObj.buffer = alloc(size);
    rawObj.buffer_length = size;
    final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
    final writer = IsarBinaryWriter(buffer, staticSize);
    writer.writeBytes(offsets[0], _cacheKey);
    writer.writeStringList(offsets[1], _cols);
    writer.writeStringList(offsets[2], _rows);
  }

  @override
  Sheet deserialize(IsarCollection<Sheet> collection, int id,
      IsarBinaryReader reader, List<int> offsets) {
    final object = Sheet();
    object.cacheKey = reader.readString(offsets[0]);
    object.cols = reader.readStringList(offsets[1]) ?? [];
    object.id = id;
    object.rows = reader.readStringList(offsets[2]) ?? [];
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
        return (reader.readStringList(offset) ?? []) as P;
      case 2:
        return (reader.readStringList(offset) ?? []) as P;
      default:
        throw 'Illegal propertyIndex';
    }
  }

  @override
  void attachLinks(Isar isar, int id, Sheet object) {}
}

extension SheetQueryWhereSort on QueryBuilder<Sheet, Sheet, QWhere> {
  QueryBuilder<Sheet, Sheet, QAfterWhere> anyId() {
    return addWhereClauseInternal(const WhereClause(indexName: null));
  }
}

extension SheetQueryWhere on QueryBuilder<Sheet, Sheet, QWhereClause> {
  QueryBuilder<Sheet, Sheet, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: true,
      upper: [id],
      includeUpper: true,
    ));
  }

  QueryBuilder<Sheet, Sheet, QAfterWhereClause> idNotEqualTo(int id) {
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

  QueryBuilder<Sheet, Sheet, QAfterWhereClause> idGreaterThan(
    int id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: include,
    ));
  }

  QueryBuilder<Sheet, Sheet, QAfterWhereClause> idLessThan(
    int id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      upper: [id],
      includeUpper: include,
    ));
  }

  QueryBuilder<Sheet, Sheet, QAfterWhereClause> idBetween(
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

extension SheetQueryFilter on QueryBuilder<Sheet, Sheet, QFilterCondition> {
  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> cacheKeyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'cacheKey',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> cacheKeyGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'cacheKey',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> cacheKeyLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'cacheKey',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> cacheKeyBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'cacheKey',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> cacheKeyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'cacheKey',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> cacheKeyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'cacheKey',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> cacheKeyContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'cacheKey',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> cacheKeyMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'cacheKey',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> colsAnyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'cols',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> colsAnyGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'cols',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> colsAnyLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'cols',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> colsAnyBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'cols',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> colsAnyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'cols',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> colsAnyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'cols',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> colsAnyContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'cols',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> colsAnyMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'cols',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> rowsAnyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'rows',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> rowsAnyGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'rows',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> rowsAnyLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'rows',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> rowsAnyBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'rows',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> rowsAnyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'rows',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> rowsAnyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'rows',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> rowsAnyContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'rows',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> rowsAnyMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'rows',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension SheetQueryLinks on QueryBuilder<Sheet, Sheet, QFilterCondition> {}

extension SheetQueryWhereSortBy on QueryBuilder<Sheet, Sheet, QSortBy> {
  QueryBuilder<Sheet, Sheet, QAfterSortBy> sortByCacheKey() {
    return addSortByInternal('cacheKey', Sort.asc);
  }

  QueryBuilder<Sheet, Sheet, QAfterSortBy> sortByCacheKeyDesc() {
    return addSortByInternal('cacheKey', Sort.desc);
  }

  QueryBuilder<Sheet, Sheet, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Sheet, Sheet, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }
}

extension SheetQueryWhereSortThenBy on QueryBuilder<Sheet, Sheet, QSortThenBy> {
  QueryBuilder<Sheet, Sheet, QAfterSortBy> thenByCacheKey() {
    return addSortByInternal('cacheKey', Sort.asc);
  }

  QueryBuilder<Sheet, Sheet, QAfterSortBy> thenByCacheKeyDesc() {
    return addSortByInternal('cacheKey', Sort.desc);
  }

  QueryBuilder<Sheet, Sheet, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Sheet, Sheet, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }
}

extension SheetQueryWhereDistinct on QueryBuilder<Sheet, Sheet, QDistinct> {
  QueryBuilder<Sheet, Sheet, QDistinct> distinctByCacheKey(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('cacheKey', caseSensitive: caseSensitive);
  }

  QueryBuilder<Sheet, Sheet, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }
}

extension SheetQueryProperty on QueryBuilder<Sheet, Sheet, QQueryProperty> {
  QueryBuilder<Sheet, String, QQueryOperations> cacheKeyProperty() {
    return addPropertyNameInternal('cacheKey');
  }

  QueryBuilder<Sheet, List<String>, QQueryOperations> colsProperty() {
    return addPropertyNameInternal('cols');
  }

  QueryBuilder<Sheet, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Sheet, List<String>, QQueryOperations> rowsProperty() {
    return addPropertyNameInternal('rows');
  }
}
