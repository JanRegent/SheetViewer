// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetLogCollection on Isar {
  IsarCollection<Log> get logs => getCollection();
}

const LogSchema = CollectionSchema(
  name: 'Log',
  schema:
      '{"name":"Log","idName":"id","properties":[{"name":"aFunc","type":"String"},{"name":"aStep","type":"String"},{"name":"descr","type":"String"},{"name":"mess","type":"String"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {'aFunc': 0, 'aStep': 1, 'descr': 2, 'mess': 3},
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _logGetId,
  setId: _logSetId,
  getLinks: _logGetLinks,
  attachLinks: _logAttachLinks,
  serializeNative: _logSerializeNative,
  deserializeNative: _logDeserializeNative,
  deserializePropNative: _logDeserializePropNative,
  serializeWeb: _logSerializeWeb,
  deserializeWeb: _logDeserializeWeb,
  deserializePropWeb: _logDeserializePropWeb,
  version: 3,
);

int? _logGetId(Log object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _logSetId(Log object, int id) {
  object.id = id;
}

List<IsarLinkBase> _logGetLinks(Log object) {
  return [];
}

void _logSerializeNative(IsarCollection<Log> collection, IsarRawObject rawObj,
    Log object, int staticSize, List<int> offsets, AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.aFunc;
  final _aFunc = IsarBinaryWriter.utf8Encoder.convert(value0);
  dynamicSize += (_aFunc.length) as int;
  final value1 = object.aStep;
  final _aStep = IsarBinaryWriter.utf8Encoder.convert(value1);
  dynamicSize += (_aStep.length) as int;
  final value2 = object.descr;
  final _descr = IsarBinaryWriter.utf8Encoder.convert(value2);
  dynamicSize += (_descr.length) as int;
  final value3 = object.mess;
  final _mess = IsarBinaryWriter.utf8Encoder.convert(value3);
  dynamicSize += (_mess.length) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _aFunc);
  writer.writeBytes(offsets[1], _aStep);
  writer.writeBytes(offsets[2], _descr);
  writer.writeBytes(offsets[3], _mess);
}

Log _logDeserializeNative(IsarCollection<Log> collection, int id,
    IsarBinaryReader reader, List<int> offsets) {
  final object = Log();
  object.aFunc = reader.readString(offsets[0]);
  object.aStep = reader.readString(offsets[1]);
  object.descr = reader.readString(offsets[2]);
  object.id = id;
  object.mess = reader.readString(offsets[3]);
  return object;
}

P _logDeserializePropNative<P>(
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

dynamic _logSerializeWeb(IsarCollection<Log> collection, Log object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'aFunc', object.aFunc);
  IsarNative.jsObjectSet(jsObj, 'aStep', object.aStep);
  IsarNative.jsObjectSet(jsObj, 'descr', object.descr);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'mess', object.mess);
  return jsObj;
}

Log _logDeserializeWeb(IsarCollection<Log> collection, dynamic jsObj) {
  final object = Log();
  object.aFunc = IsarNative.jsObjectGet(jsObj, 'aFunc') ?? '';
  object.aStep = IsarNative.jsObjectGet(jsObj, 'aStep') ?? '';
  object.descr = IsarNative.jsObjectGet(jsObj, 'descr') ?? '';
  object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
  object.mess = IsarNative.jsObjectGet(jsObj, 'mess') ?? '';
  return object;
}

P _logDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'aFunc':
      return (IsarNative.jsObjectGet(jsObj, 'aFunc') ?? '') as P;
    case 'aStep':
      return (IsarNative.jsObjectGet(jsObj, 'aStep') ?? '') as P;
    case 'descr':
      return (IsarNative.jsObjectGet(jsObj, 'descr') ?? '') as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'mess':
      return (IsarNative.jsObjectGet(jsObj, 'mess') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _logAttachLinks(IsarCollection col, int id, Log object) {}

extension LogQueryWhereSort on QueryBuilder<Log, Log, QWhere> {
  QueryBuilder<Log, Log, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension LogQueryWhere on QueryBuilder<Log, Log, QWhereClause> {
  QueryBuilder<Log, Log, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<Log, Log, QAfterWhereClause> idNotEqualTo(int id) {
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

  QueryBuilder<Log, Log, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<Log, Log, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<Log, Log, QAfterWhereClause> idBetween(
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

extension LogQueryFilter on QueryBuilder<Log, Log, QFilterCondition> {
  QueryBuilder<Log, Log, QAfterFilterCondition> aFuncEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'aFunc',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> aFuncGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'aFunc',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> aFuncLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'aFunc',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> aFuncBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'aFunc',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> aFuncStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'aFunc',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> aFuncEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'aFunc',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> aFuncContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'aFunc',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> aFuncMatches(String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'aFunc',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> aStepEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'aStep',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> aStepGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'aStep',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> aStepLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'aStep',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> aStepBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'aStep',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> aStepStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'aStep',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> aStepEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'aStep',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> aStepContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'aStep',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> aStepMatches(String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'aStep',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> descrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'descr',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> descrGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'descr',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> descrLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'descr',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> descrBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'descr',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> descrStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'descr',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> descrEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'descr',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> descrContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'descr',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> descrMatches(String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'descr',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Log, Log, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Log, Log, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Log, Log, QAfterFilterCondition> messEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'mess',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> messGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'mess',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> messLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'mess',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> messBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'mess',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> messStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'mess',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> messEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'mess',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> messContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'mess',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> messMatches(String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'mess',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension LogQueryLinks on QueryBuilder<Log, Log, QFilterCondition> {}

extension LogQueryWhereSortBy on QueryBuilder<Log, Log, QSortBy> {
  QueryBuilder<Log, Log, QAfterSortBy> sortByAFunc() {
    return addSortByInternal('aFunc', Sort.asc);
  }

  QueryBuilder<Log, Log, QAfterSortBy> sortByAFuncDesc() {
    return addSortByInternal('aFunc', Sort.desc);
  }

  QueryBuilder<Log, Log, QAfterSortBy> sortByAStep() {
    return addSortByInternal('aStep', Sort.asc);
  }

  QueryBuilder<Log, Log, QAfterSortBy> sortByAStepDesc() {
    return addSortByInternal('aStep', Sort.desc);
  }

  QueryBuilder<Log, Log, QAfterSortBy> sortByDescr() {
    return addSortByInternal('descr', Sort.asc);
  }

  QueryBuilder<Log, Log, QAfterSortBy> sortByDescrDesc() {
    return addSortByInternal('descr', Sort.desc);
  }

  QueryBuilder<Log, Log, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Log, Log, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Log, Log, QAfterSortBy> sortByMess() {
    return addSortByInternal('mess', Sort.asc);
  }

  QueryBuilder<Log, Log, QAfterSortBy> sortByMessDesc() {
    return addSortByInternal('mess', Sort.desc);
  }
}

extension LogQueryWhereSortThenBy on QueryBuilder<Log, Log, QSortThenBy> {
  QueryBuilder<Log, Log, QAfterSortBy> thenByAFunc() {
    return addSortByInternal('aFunc', Sort.asc);
  }

  QueryBuilder<Log, Log, QAfterSortBy> thenByAFuncDesc() {
    return addSortByInternal('aFunc', Sort.desc);
  }

  QueryBuilder<Log, Log, QAfterSortBy> thenByAStep() {
    return addSortByInternal('aStep', Sort.asc);
  }

  QueryBuilder<Log, Log, QAfterSortBy> thenByAStepDesc() {
    return addSortByInternal('aStep', Sort.desc);
  }

  QueryBuilder<Log, Log, QAfterSortBy> thenByDescr() {
    return addSortByInternal('descr', Sort.asc);
  }

  QueryBuilder<Log, Log, QAfterSortBy> thenByDescrDesc() {
    return addSortByInternal('descr', Sort.desc);
  }

  QueryBuilder<Log, Log, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Log, Log, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Log, Log, QAfterSortBy> thenByMess() {
    return addSortByInternal('mess', Sort.asc);
  }

  QueryBuilder<Log, Log, QAfterSortBy> thenByMessDesc() {
    return addSortByInternal('mess', Sort.desc);
  }
}

extension LogQueryWhereDistinct on QueryBuilder<Log, Log, QDistinct> {
  QueryBuilder<Log, Log, QDistinct> distinctByAFunc(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('aFunc', caseSensitive: caseSensitive);
  }

  QueryBuilder<Log, Log, QDistinct> distinctByAStep(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('aStep', caseSensitive: caseSensitive);
  }

  QueryBuilder<Log, Log, QDistinct> distinctByDescr(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('descr', caseSensitive: caseSensitive);
  }

  QueryBuilder<Log, Log, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Log, Log, QDistinct> distinctByMess(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('mess', caseSensitive: caseSensitive);
  }
}

extension LogQueryProperty on QueryBuilder<Log, Log, QQueryProperty> {
  QueryBuilder<Log, String, QQueryOperations> aFuncProperty() {
    return addPropertyNameInternal('aFunc');
  }

  QueryBuilder<Log, String, QQueryOperations> aStepProperty() {
    return addPropertyNameInternal('aStep');
  }

  QueryBuilder<Log, String, QQueryOperations> descrProperty() {
    return addPropertyNameInternal('descr');
  }

  QueryBuilder<Log, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Log, String, QQueryOperations> messProperty() {
    return addPropertyNameInternal('mess');
  }
}
