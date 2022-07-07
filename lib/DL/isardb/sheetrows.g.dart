// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sheetrows.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings

extension GetSheetRowCollection on Isar {
  IsarCollection<SheetRow> get sheetRows => getCollection();
}

const SheetRowSchema = CollectionSchema(
  name: r'SheetRow',
  schema:
      r'{"name":"SheetRow","idName":"id","properties":[{"name":"aRowNo","type":"Long"},{"name":"aSheetName","type":"String"},{"name":"row","type":"String"},{"name":"zfileId","type":"String"}],"indexes":[],"links":[]}',
  idName: r'id',
  propertyIds: {r'aRowNo': 0, r'aSheetName': 1, r'row': 2, r'zfileId': 3},
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _sheetRowGetId,
  setId: _sheetRowSetId,
  getLinks: _sheetRowGetLinks,
  attachLinks: _sheetRowAttachLinks,
  serializeNative: _sheetRowSerializeNative,
  deserializeNative: _sheetRowDeserializeNative,
  deserializePropNative: _sheetRowDeserializePropNative,
  serializeWeb: _sheetRowSerializeWeb,
  deserializeWeb: _sheetRowDeserializeWeb,
  deserializePropWeb: _sheetRowDeserializePropWeb,
  version: 4,
);

int? _sheetRowGetId(SheetRow object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _sheetRowSetId(SheetRow object, int id) {
  object.id = id;
}

List<IsarLinkBase<dynamic>> _sheetRowGetLinks(SheetRow object) {
  return [];
}

void _sheetRowSerializeNative(
    IsarCollection<SheetRow> collection,
    IsarCObject cObj,
    SheetRow object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  final aSheetName$Bytes =
      IsarBinaryWriter.utf8Encoder.convert(object.aSheetName);
  final row$Bytes = IsarBinaryWriter.utf8Encoder.convert(object.row);
  final zfileId$Bytes = IsarBinaryWriter.utf8Encoder.convert(object.zfileId);
  final size = (staticSize +
      (aSheetName$Bytes.length) +
      (row$Bytes.length) +
      (zfileId$Bytes.length)) as int;
  cObj.buffer = alloc(size);
  cObj.buffer_length = size;

  final buffer = IsarNative.bufAsBytes(cObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeHeader();
  writer.writeLong(offsets[0], object.aRowNo);
  writer.writeBytes(offsets[1], aSheetName$Bytes);
  writer.writeBytes(offsets[2], row$Bytes);
  writer.writeBytes(offsets[3], zfileId$Bytes);
}

SheetRow _sheetRowDeserializeNative(IsarCollection<SheetRow> collection, int id,
    IsarBinaryReader reader, List<int> offsets) {
  final object = SheetRow();
  object.aRowNo = reader.readLong(offsets[0]);
  object.aSheetName = reader.readString(offsets[1]);
  object.id = id;
  object.row = reader.readString(offsets[2]);
  object.zfileId = reader.readString(offsets[3]);
  return object;
}

P _sheetRowDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Illegal propertyIndex');
  }
}

Object _sheetRowSerializeWeb(
    IsarCollection<SheetRow> collection, SheetRow object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, r'aRowNo', object.aRowNo);
  IsarNative.jsObjectSet(jsObj, r'aSheetName', object.aSheetName);
  IsarNative.jsObjectSet(jsObj, r'id', object.id);
  IsarNative.jsObjectSet(jsObj, r'row', object.row);
  IsarNative.jsObjectSet(jsObj, r'zfileId', object.zfileId);
  return jsObj;
}

SheetRow _sheetRowDeserializeWeb(
    IsarCollection<SheetRow> collection, Object jsObj) {
  final object = SheetRow();
  object.aRowNo = IsarNative.jsObjectGet(jsObj, r'aRowNo') ??
      (double.negativeInfinity as int);
  object.aSheetName = IsarNative.jsObjectGet(jsObj, r'aSheetName') ?? '';
  object.id =
      IsarNative.jsObjectGet(jsObj, r'id') ?? (double.negativeInfinity as int);
  object.row = IsarNative.jsObjectGet(jsObj, r'row') ?? '';
  object.zfileId = IsarNative.jsObjectGet(jsObj, r'zfileId') ?? '';
  return object;
}

P _sheetRowDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case r'aRowNo':
      return (IsarNative.jsObjectGet(jsObj, r'aRowNo') ??
          (double.negativeInfinity as int)) as P;
    case r'aSheetName':
      return (IsarNative.jsObjectGet(jsObj, r'aSheetName') ?? '') as P;
    case r'id':
      return (IsarNative.jsObjectGet(jsObj, r'id') ??
          (double.negativeInfinity as int)) as P;
    case r'row':
      return (IsarNative.jsObjectGet(jsObj, r'row') ?? '') as P;
    case r'zfileId':
      return (IsarNative.jsObjectGet(jsObj, r'zfileId') ?? '') as P;
    default:
      throw IsarError('Illegal propertyName');
  }
}

void _sheetRowAttachLinks(
    IsarCollection<dynamic> col, int id, SheetRow object) {}

extension SheetRowQueryWhereSort on QueryBuilder<SheetRow, SheetRow, QWhere> {
  QueryBuilder<SheetRow, SheetRow, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SheetRowQueryWhere on QueryBuilder<SheetRow, SheetRow, QWhereClause> {
  QueryBuilder<SheetRow, SheetRow, QAfterWhereClause> idEqualTo(int id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SheetRow, SheetRow, QAfterWhereClause> idNotEqualTo(int id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<SheetRow, SheetRow, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SheetRow, SheetRow, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SheetRow, SheetRow, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SheetRowQueryFilter
    on QueryBuilder<SheetRow, SheetRow, QFilterCondition> {
  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> aRowNoEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'aRowNo',
        value: value,
      ));
    });
  }

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> aRowNoGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'aRowNo',
        value: value,
      ));
    });
  }

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> aRowNoLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'aRowNo',
        value: value,
      ));
    });
  }

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> aRowNoBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'aRowNo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> aSheetNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'aSheetName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> aSheetNameGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'aSheetName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> aSheetNameLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'aSheetName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> aSheetNameBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'aSheetName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> aSheetNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'aSheetName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> aSheetNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'aSheetName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> aSheetNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'aSheetName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> aSheetNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'aSheetName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> idEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> rowEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'row',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> rowGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'row',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> rowLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'row',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> rowBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'row',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> rowStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'row',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> rowEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'row',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> rowContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'row',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> rowMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'row',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> zfileIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'zfileId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> zfileIdGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'zfileId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> zfileIdLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'zfileId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> zfileIdBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'zfileId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> zfileIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'zfileId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> zfileIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'zfileId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> zfileIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'zfileId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> zfileIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'zfileId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }
}

extension SheetRowQueryLinks
    on QueryBuilder<SheetRow, SheetRow, QFilterCondition> {}

extension SheetRowQueryWhereSortBy
    on QueryBuilder<SheetRow, SheetRow, QSortBy> {
  QueryBuilder<SheetRow, SheetRow, QAfterSortBy> sortByARowNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aRowNo', Sort.asc);
    });
  }

  QueryBuilder<SheetRow, SheetRow, QAfterSortBy> sortByARowNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aRowNo', Sort.desc);
    });
  }

  QueryBuilder<SheetRow, SheetRow, QAfterSortBy> sortByASheetName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aSheetName', Sort.asc);
    });
  }

  QueryBuilder<SheetRow, SheetRow, QAfterSortBy> sortByASheetNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aSheetName', Sort.desc);
    });
  }

  QueryBuilder<SheetRow, SheetRow, QAfterSortBy> sortByRow() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'row', Sort.asc);
    });
  }

  QueryBuilder<SheetRow, SheetRow, QAfterSortBy> sortByRowDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'row', Sort.desc);
    });
  }

  QueryBuilder<SheetRow, SheetRow, QAfterSortBy> sortByZfileId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'zfileId', Sort.asc);
    });
  }

  QueryBuilder<SheetRow, SheetRow, QAfterSortBy> sortByZfileIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'zfileId', Sort.desc);
    });
  }
}

extension SheetRowQueryWhereSortThenBy
    on QueryBuilder<SheetRow, SheetRow, QSortThenBy> {
  QueryBuilder<SheetRow, SheetRow, QAfterSortBy> thenByARowNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aRowNo', Sort.asc);
    });
  }

  QueryBuilder<SheetRow, SheetRow, QAfterSortBy> thenByARowNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aRowNo', Sort.desc);
    });
  }

  QueryBuilder<SheetRow, SheetRow, QAfterSortBy> thenByASheetName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aSheetName', Sort.asc);
    });
  }

  QueryBuilder<SheetRow, SheetRow, QAfterSortBy> thenByASheetNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aSheetName', Sort.desc);
    });
  }

  QueryBuilder<SheetRow, SheetRow, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SheetRow, SheetRow, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SheetRow, SheetRow, QAfterSortBy> thenByRow() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'row', Sort.asc);
    });
  }

  QueryBuilder<SheetRow, SheetRow, QAfterSortBy> thenByRowDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'row', Sort.desc);
    });
  }

  QueryBuilder<SheetRow, SheetRow, QAfterSortBy> thenByZfileId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'zfileId', Sort.asc);
    });
  }

  QueryBuilder<SheetRow, SheetRow, QAfterSortBy> thenByZfileIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'zfileId', Sort.desc);
    });
  }
}

extension SheetRowQueryWhereDistinct
    on QueryBuilder<SheetRow, SheetRow, QDistinct> {
  QueryBuilder<SheetRow, SheetRow, QDistinct> distinctByARowNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'aRowNo');
    });
  }

  QueryBuilder<SheetRow, SheetRow, QDistinct> distinctByASheetName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'aSheetName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SheetRow, SheetRow, QDistinct> distinctByRow(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'row', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SheetRow, SheetRow, QDistinct> distinctByZfileId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'zfileId', caseSensitive: caseSensitive);
    });
  }
}

extension SheetRowQueryProperty
    on QueryBuilder<SheetRow, SheetRow, QQueryProperty> {
  QueryBuilder<SheetRow, int, QQueryOperations> aRowNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'aRowNo');
    });
  }

  QueryBuilder<SheetRow, String, QQueryOperations> aSheetNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'aSheetName');
    });
  }

  QueryBuilder<SheetRow, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SheetRow, String, QQueryOperations> rowProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'row');
    });
  }

  QueryBuilder<SheetRow, String, QQueryOperations> zfileIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'zfileId');
    });
  }
}
