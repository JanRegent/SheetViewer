// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sheetrows.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetSheetRowCollection on Isar {
  IsarCollection<SheetRow> get sheetRows => getCollection();
}

const SheetRowSchema = CollectionSchema(
  name: 'SheetRow',
  schema:
      '{"name":"SheetRow","idName":"id","properties":[{"name":"aRowNo","type":"String"},{"name":"aSheetName","type":"String"},{"name":"row","type":"String"},{"name":"zfileId","type":"String"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {'aRowNo': 0, 'aSheetName': 1, 'row': 2, 'zfileId': 3},
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
  version: 3,
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

List<IsarLinkBase> _sheetRowGetLinks(SheetRow object) {
  return [];
}

void _sheetRowSerializeNative(
    IsarCollection<SheetRow> collection,
    IsarRawObject rawObj,
    SheetRow object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.aRowNo;
  final _aRowNo = IsarBinaryWriter.utf8Encoder.convert(value0);
  dynamicSize += (_aRowNo.length) as int;
  final value1 = object.aSheetName;
  final _aSheetName = IsarBinaryWriter.utf8Encoder.convert(value1);
  dynamicSize += (_aSheetName.length) as int;
  final value2 = object.row;
  final _row = IsarBinaryWriter.utf8Encoder.convert(value2);
  dynamicSize += (_row.length) as int;
  final value3 = object.zfileId;
  final _zfileId = IsarBinaryWriter.utf8Encoder.convert(value3);
  dynamicSize += (_zfileId.length) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _aRowNo);
  writer.writeBytes(offsets[1], _aSheetName);
  writer.writeBytes(offsets[2], _row);
  writer.writeBytes(offsets[3], _zfileId);
}

SheetRow _sheetRowDeserializeNative(IsarCollection<SheetRow> collection, int id,
    IsarBinaryReader reader, List<int> offsets) {
  final object = SheetRow();
  object.aRowNo = reader.readString(offsets[0]);
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

dynamic _sheetRowSerializeWeb(
    IsarCollection<SheetRow> collection, SheetRow object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'aRowNo', object.aRowNo);
  IsarNative.jsObjectSet(jsObj, 'aSheetName', object.aSheetName);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'row', object.row);
  IsarNative.jsObjectSet(jsObj, 'zfileId', object.zfileId);
  return jsObj;
}

SheetRow _sheetRowDeserializeWeb(
    IsarCollection<SheetRow> collection, dynamic jsObj) {
  final object = SheetRow();
  object.aRowNo = IsarNative.jsObjectGet(jsObj, 'aRowNo') ?? '';
  object.aSheetName = IsarNative.jsObjectGet(jsObj, 'aSheetName') ?? '';
  object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
  object.row = IsarNative.jsObjectGet(jsObj, 'row') ?? '';
  object.zfileId = IsarNative.jsObjectGet(jsObj, 'zfileId') ?? '';
  return object;
}

P _sheetRowDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'aRowNo':
      return (IsarNative.jsObjectGet(jsObj, 'aRowNo') ?? '') as P;
    case 'aSheetName':
      return (IsarNative.jsObjectGet(jsObj, 'aSheetName') ?? '') as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'row':
      return (IsarNative.jsObjectGet(jsObj, 'row') ?? '') as P;
    case 'zfileId':
      return (IsarNative.jsObjectGet(jsObj, 'zfileId') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _sheetRowAttachLinks(IsarCollection col, int id, SheetRow object) {}

extension SheetRowQueryWhereSort on QueryBuilder<SheetRow, SheetRow, QWhere> {
  QueryBuilder<SheetRow, SheetRow, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension SheetRowQueryWhere on QueryBuilder<SheetRow, SheetRow, QWhereClause> {
  QueryBuilder<SheetRow, SheetRow, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<SheetRow, SheetRow, QAfterWhereClause> idNotEqualTo(int id) {
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

  QueryBuilder<SheetRow, SheetRow, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<SheetRow, SheetRow, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<SheetRow, SheetRow, QAfterWhereClause> idBetween(
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

extension SheetRowQueryFilter
    on QueryBuilder<SheetRow, SheetRow, QFilterCondition> {
  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> aRowNoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'aRowNo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> aRowNoGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'aRowNo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> aRowNoLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'aRowNo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> aRowNoBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'aRowNo',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> aRowNoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'aRowNo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> aRowNoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'aRowNo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> aRowNoContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'aRowNo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> aRowNoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'aRowNo',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> aSheetNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'aSheetName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> aSheetNameGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'aSheetName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> aSheetNameLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'aSheetName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> aSheetNameBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'aSheetName',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> aSheetNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'aSheetName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> aSheetNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'aSheetName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> aSheetNameContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'aSheetName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> aSheetNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'aSheetName',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> idBetween(
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

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> rowEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'row',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> rowGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'row',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> rowLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'row',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> rowBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'row',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> rowStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'row',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> rowEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'row',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> rowContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'row',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> rowMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'row',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> zfileIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'zfileId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> zfileIdGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'zfileId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> zfileIdLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'zfileId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> zfileIdBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'zfileId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> zfileIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'zfileId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> zfileIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'zfileId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> zfileIdContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'zfileId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetRow, SheetRow, QAfterFilterCondition> zfileIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'zfileId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension SheetRowQueryLinks
    on QueryBuilder<SheetRow, SheetRow, QFilterCondition> {}

extension SheetRowQueryWhereSortBy
    on QueryBuilder<SheetRow, SheetRow, QSortBy> {
  QueryBuilder<SheetRow, SheetRow, QAfterSortBy> sortByARowNo() {
    return addSortByInternal('aRowNo', Sort.asc);
  }

  QueryBuilder<SheetRow, SheetRow, QAfterSortBy> sortByARowNoDesc() {
    return addSortByInternal('aRowNo', Sort.desc);
  }

  QueryBuilder<SheetRow, SheetRow, QAfterSortBy> sortByASheetName() {
    return addSortByInternal('aSheetName', Sort.asc);
  }

  QueryBuilder<SheetRow, SheetRow, QAfterSortBy> sortByASheetNameDesc() {
    return addSortByInternal('aSheetName', Sort.desc);
  }

  QueryBuilder<SheetRow, SheetRow, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<SheetRow, SheetRow, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<SheetRow, SheetRow, QAfterSortBy> sortByRow() {
    return addSortByInternal('row', Sort.asc);
  }

  QueryBuilder<SheetRow, SheetRow, QAfterSortBy> sortByRowDesc() {
    return addSortByInternal('row', Sort.desc);
  }

  QueryBuilder<SheetRow, SheetRow, QAfterSortBy> sortByZfileId() {
    return addSortByInternal('zfileId', Sort.asc);
  }

  QueryBuilder<SheetRow, SheetRow, QAfterSortBy> sortByZfileIdDesc() {
    return addSortByInternal('zfileId', Sort.desc);
  }
}

extension SheetRowQueryWhereSortThenBy
    on QueryBuilder<SheetRow, SheetRow, QSortThenBy> {
  QueryBuilder<SheetRow, SheetRow, QAfterSortBy> thenByARowNo() {
    return addSortByInternal('aRowNo', Sort.asc);
  }

  QueryBuilder<SheetRow, SheetRow, QAfterSortBy> thenByARowNoDesc() {
    return addSortByInternal('aRowNo', Sort.desc);
  }

  QueryBuilder<SheetRow, SheetRow, QAfterSortBy> thenByASheetName() {
    return addSortByInternal('aSheetName', Sort.asc);
  }

  QueryBuilder<SheetRow, SheetRow, QAfterSortBy> thenByASheetNameDesc() {
    return addSortByInternal('aSheetName', Sort.desc);
  }

  QueryBuilder<SheetRow, SheetRow, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<SheetRow, SheetRow, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<SheetRow, SheetRow, QAfterSortBy> thenByRow() {
    return addSortByInternal('row', Sort.asc);
  }

  QueryBuilder<SheetRow, SheetRow, QAfterSortBy> thenByRowDesc() {
    return addSortByInternal('row', Sort.desc);
  }

  QueryBuilder<SheetRow, SheetRow, QAfterSortBy> thenByZfileId() {
    return addSortByInternal('zfileId', Sort.asc);
  }

  QueryBuilder<SheetRow, SheetRow, QAfterSortBy> thenByZfileIdDesc() {
    return addSortByInternal('zfileId', Sort.desc);
  }
}

extension SheetRowQueryWhereDistinct
    on QueryBuilder<SheetRow, SheetRow, QDistinct> {
  QueryBuilder<SheetRow, SheetRow, QDistinct> distinctByARowNo(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('aRowNo', caseSensitive: caseSensitive);
  }

  QueryBuilder<SheetRow, SheetRow, QDistinct> distinctByASheetName(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('aSheetName', caseSensitive: caseSensitive);
  }

  QueryBuilder<SheetRow, SheetRow, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<SheetRow, SheetRow, QDistinct> distinctByRow(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('row', caseSensitive: caseSensitive);
  }

  QueryBuilder<SheetRow, SheetRow, QDistinct> distinctByZfileId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('zfileId', caseSensitive: caseSensitive);
  }
}

extension SheetRowQueryProperty
    on QueryBuilder<SheetRow, SheetRow, QQueryProperty> {
  QueryBuilder<SheetRow, String, QQueryOperations> aRowNoProperty() {
    return addPropertyNameInternal('aRowNo');
  }

  QueryBuilder<SheetRow, String, QQueryOperations> aSheetNameProperty() {
    return addPropertyNameInternal('aSheetName');
  }

  QueryBuilder<SheetRow, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<SheetRow, String, QQueryOperations> rowProperty() {
    return addPropertyNameInternal('row');
  }

  QueryBuilder<SheetRow, String, QQueryOperations> zfileIdProperty() {
    return addPropertyNameInternal('zfileId');
  }
}
