// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sheets.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast

extension GetSheetsCollection on Isar {
  IsarCollection<Sheets> get sheetss {
    return getCollection('Sheets');
  }
}

final SheetsSchema = CollectionSchema(
  name: 'Sheets',
  schema:
      '{"name":"Sheets","idName":"id","properties":[{"name":"cols","type":"StringList"},{"name":"key","type":"String"},{"name":"rows","type":"StringList"}],"indexes":[],"links":[]}',
  nativeAdapter: const _SheetsNativeAdapter(),
  webAdapter: const _SheetsWebAdapter(),
  idName: 'id',
  propertyIds: {'cols': 0, 'key': 1, 'rows': 2},
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

class _SheetsWebAdapter extends IsarWebTypeAdapter<Sheets> {
  const _SheetsWebAdapter();

  @override
  Object serialize(IsarCollection<Sheets> collection, Sheets object) {
    final jsObj = IsarNative.newJsObject();
    IsarNative.jsObjectSet(jsObj, 'cols', object.cols);
    IsarNative.jsObjectSet(jsObj, 'id', object.id);
    IsarNative.jsObjectSet(jsObj, 'key', object.key);
    IsarNative.jsObjectSet(jsObj, 'rows', object.rows);
    return jsObj;
  }

  @override
  Sheets deserialize(IsarCollection<Sheets> collection, dynamic jsObj) {
    final object = Sheets();
    object.cols = (IsarNative.jsObjectGet(jsObj, 'cols') as List?)
            ?.map((e) => e ?? '')
            .toList()
            .cast<String>() ??
        [];
    object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
    object.key = IsarNative.jsObjectGet(jsObj, 'key') ?? '';
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
      case 'cols':
        return ((IsarNative.jsObjectGet(jsObj, 'cols') as List?)
                ?.map((e) => e ?? '')
                .toList()
                .cast<String>() ??
            []) as P;
      case 'id':
        return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
            as P;
      case 'key':
        return (IsarNative.jsObjectGet(jsObj, 'key') ?? '') as P;
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
  void attachLinks(Isar isar, int id, Sheets object) {}
}

class _SheetsNativeAdapter extends IsarNativeTypeAdapter<Sheets> {
  const _SheetsNativeAdapter();

  @override
  void serialize(IsarCollection<Sheets> collection, IsarRawObject rawObj,
      Sheets object, int staticSize, List<int> offsets, AdapterAlloc alloc) {
    var dynamicSize = 0;
    final value0 = object.cols;
    dynamicSize += (value0.length) * 8;
    final bytesList0 = <IsarUint8List>[];
    for (var str in value0) {
      final bytes = IsarBinaryWriter.utf8Encoder.convert(str);
      bytesList0.add(bytes);
      dynamicSize += bytes.length as int;
    }
    final _cols = bytesList0;
    final value1 = object.key;
    final _key = IsarBinaryWriter.utf8Encoder.convert(value1);
    dynamicSize += (_key.length) as int;
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
    writer.writeStringList(offsets[0], _cols);
    writer.writeBytes(offsets[1], _key);
    writer.writeStringList(offsets[2], _rows);
  }

  @override
  Sheets deserialize(IsarCollection<Sheets> collection, int id,
      IsarBinaryReader reader, List<int> offsets) {
    final object = Sheets();
    object.cols = reader.readStringList(offsets[0]) ?? [];
    object.id = id;
    object.key = reader.readString(offsets[1]);
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
        return (reader.readStringList(offset) ?? []) as P;
      case 1:
        return (reader.readString(offset)) as P;
      case 2:
        return (reader.readStringList(offset) ?? []) as P;
      default:
        throw 'Illegal propertyIndex';
    }
  }

  @override
  void attachLinks(Isar isar, int id, Sheets object) {}
}

extension SheetsQueryWhereSort on QueryBuilder<Sheets, Sheets, QWhere> {
  QueryBuilder<Sheets, Sheets, QAfterWhere> anyId() {
    return addWhereClauseInternal(const WhereClause(indexName: null));
  }
}

extension SheetsQueryWhere on QueryBuilder<Sheets, Sheets, QWhereClause> {
  QueryBuilder<Sheets, Sheets, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: true,
      upper: [id],
      includeUpper: true,
    ));
  }

  QueryBuilder<Sheets, Sheets, QAfterWhereClause> idNotEqualTo(int id) {
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

  QueryBuilder<Sheets, Sheets, QAfterWhereClause> idGreaterThan(
    int id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: include,
    ));
  }

  QueryBuilder<Sheets, Sheets, QAfterWhereClause> idLessThan(
    int id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      upper: [id],
      includeUpper: include,
    ));
  }

  QueryBuilder<Sheets, Sheets, QAfterWhereClause> idBetween(
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

extension SheetsQueryFilter on QueryBuilder<Sheets, Sheets, QFilterCondition> {
  QueryBuilder<Sheets, Sheets, QAfterFilterCondition> colsAnyEqualTo(
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

  QueryBuilder<Sheets, Sheets, QAfterFilterCondition> colsAnyGreaterThan(
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

  QueryBuilder<Sheets, Sheets, QAfterFilterCondition> colsAnyLessThan(
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

  QueryBuilder<Sheets, Sheets, QAfterFilterCondition> colsAnyBetween(
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

  QueryBuilder<Sheets, Sheets, QAfterFilterCondition> colsAnyStartsWith(
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

  QueryBuilder<Sheets, Sheets, QAfterFilterCondition> colsAnyEndsWith(
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

  QueryBuilder<Sheets, Sheets, QAfterFilterCondition> colsAnyContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'cols',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Sheets, Sheets, QAfterFilterCondition> colsAnyMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'cols',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Sheets, Sheets, QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Sheets, Sheets, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Sheets, Sheets, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Sheets, Sheets, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Sheets, Sheets, QAfterFilterCondition> keyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'key',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Sheets, Sheets, QAfterFilterCondition> keyGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'key',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Sheets, Sheets, QAfterFilterCondition> keyLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'key',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Sheets, Sheets, QAfterFilterCondition> keyBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'key',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Sheets, Sheets, QAfterFilterCondition> keyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'key',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Sheets, Sheets, QAfterFilterCondition> keyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'key',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Sheets, Sheets, QAfterFilterCondition> keyContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'key',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Sheets, Sheets, QAfterFilterCondition> keyMatches(String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'key',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Sheets, Sheets, QAfterFilterCondition> rowsAnyEqualTo(
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

  QueryBuilder<Sheets, Sheets, QAfterFilterCondition> rowsAnyGreaterThan(
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

  QueryBuilder<Sheets, Sheets, QAfterFilterCondition> rowsAnyLessThan(
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

  QueryBuilder<Sheets, Sheets, QAfterFilterCondition> rowsAnyBetween(
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

  QueryBuilder<Sheets, Sheets, QAfterFilterCondition> rowsAnyStartsWith(
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

  QueryBuilder<Sheets, Sheets, QAfterFilterCondition> rowsAnyEndsWith(
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

  QueryBuilder<Sheets, Sheets, QAfterFilterCondition> rowsAnyContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'rows',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Sheets, Sheets, QAfterFilterCondition> rowsAnyMatches(
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

extension SheetsQueryLinks on QueryBuilder<Sheets, Sheets, QFilterCondition> {}

extension SheetsQueryWhereSortBy on QueryBuilder<Sheets, Sheets, QSortBy> {
  QueryBuilder<Sheets, Sheets, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Sheets, Sheets, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Sheets, Sheets, QAfterSortBy> sortByKey() {
    return addSortByInternal('key', Sort.asc);
  }

  QueryBuilder<Sheets, Sheets, QAfterSortBy> sortByKeyDesc() {
    return addSortByInternal('key', Sort.desc);
  }
}

extension SheetsQueryWhereSortThenBy
    on QueryBuilder<Sheets, Sheets, QSortThenBy> {
  QueryBuilder<Sheets, Sheets, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Sheets, Sheets, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Sheets, Sheets, QAfterSortBy> thenByKey() {
    return addSortByInternal('key', Sort.asc);
  }

  QueryBuilder<Sheets, Sheets, QAfterSortBy> thenByKeyDesc() {
    return addSortByInternal('key', Sort.desc);
  }
}

extension SheetsQueryWhereDistinct on QueryBuilder<Sheets, Sheets, QDistinct> {
  QueryBuilder<Sheets, Sheets, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Sheets, Sheets, QDistinct> distinctByKey(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('key', caseSensitive: caseSensitive);
  }
}

extension SheetsQueryProperty on QueryBuilder<Sheets, Sheets, QQueryProperty> {
  QueryBuilder<Sheets, List<String>, QQueryOperations> colsProperty() {
    return addPropertyNameInternal('cols');
  }

  QueryBuilder<Sheets, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Sheets, String, QQueryOperations> keyProperty() {
    return addPropertyNameInternal('key');
  }

  QueryBuilder<Sheets, List<String>, QQueryOperations> rowsProperty() {
    return addPropertyNameInternal('rows');
  }
}
