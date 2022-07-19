// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings

extension GetLogCollection on Isar {
  IsarCollection<Log> get logs => getCollection();
}

const LogSchema = CollectionSchema(
  name: r'Log',
  schema:
      r'{"name":"Log","idName":"id","properties":[{"name":"aFunc","type":"String"},{"name":"aStep","type":"String"},{"name":"descr","type":"String"},{"name":"mess","type":"String"}],"indexes":[],"links":[]}',
  idName: r'id',
  propertyIds: {r'aFunc': 0, r'aStep': 1, r'descr': 2, r'mess': 3},
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
  version: 4,
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

List<IsarLinkBase<dynamic>> _logGetLinks(Log object) {
  return [];
}

void _logSerializeNative(IsarCollection<Log> collection, IsarCObject cObj,
    Log object, int staticSize, List<int> offsets, AdapterAlloc alloc) {
  final aFunc$Bytes = IsarBinaryWriter.utf8Encoder.convert(object.aFunc);
  final aStep$Bytes = IsarBinaryWriter.utf8Encoder.convert(object.aStep);
  final descr$Bytes = IsarBinaryWriter.utf8Encoder.convert(object.descr);
  final mess$Bytes = IsarBinaryWriter.utf8Encoder.convert(object.mess);
  final size = (staticSize +
      (aFunc$Bytes.length) +
      (aStep$Bytes.length) +
      (descr$Bytes.length) +
      (mess$Bytes.length)) as int;
  cObj.buffer = alloc(size);
  cObj.buffer_length = size;

  final buffer = IsarNative.bufAsBytes(cObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeHeader();
  writer.writeBytes(offsets[0], aFunc$Bytes);
  writer.writeBytes(offsets[1], aStep$Bytes);
  writer.writeBytes(offsets[2], descr$Bytes);
  writer.writeBytes(offsets[3], mess$Bytes);
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
      throw IsarError('Illegal propertyIndex');
  }
}

Object _logSerializeWeb(IsarCollection<Log> collection, Log object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, r'aFunc', object.aFunc);
  IsarNative.jsObjectSet(jsObj, r'aStep', object.aStep);
  IsarNative.jsObjectSet(jsObj, r'descr', object.descr);
  IsarNative.jsObjectSet(jsObj, r'id', object.id);
  IsarNative.jsObjectSet(jsObj, r'mess', object.mess);
  return jsObj;
}

Log _logDeserializeWeb(IsarCollection<Log> collection, Object jsObj) {
  final object = Log();
  object.aFunc = IsarNative.jsObjectGet(jsObj, r'aFunc') ?? '';
  object.aStep = IsarNative.jsObjectGet(jsObj, r'aStep') ?? '';
  object.descr = IsarNative.jsObjectGet(jsObj, r'descr') ?? '';
  object.id =
      IsarNative.jsObjectGet(jsObj, r'id') ?? (double.negativeInfinity as int);
  object.mess = IsarNative.jsObjectGet(jsObj, r'mess') ?? '';
  return object;
}

P _logDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case r'aFunc':
      return (IsarNative.jsObjectGet(jsObj, r'aFunc') ?? '') as P;
    case r'aStep':
      return (IsarNative.jsObjectGet(jsObj, r'aStep') ?? '') as P;
    case r'descr':
      return (IsarNative.jsObjectGet(jsObj, r'descr') ?? '') as P;
    case r'id':
      return (IsarNative.jsObjectGet(jsObj, r'id') ??
          (double.negativeInfinity as int)) as P;
    case r'mess':
      return (IsarNative.jsObjectGet(jsObj, r'mess') ?? '') as P;
    default:
      throw IsarError('Illegal propertyName');
  }
}

void _logAttachLinks(IsarCollection<dynamic> col, int id, Log object) {}

extension LogQueryWhereSort on QueryBuilder<Log, Log, QWhere> {
  QueryBuilder<Log, Log, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension LogQueryWhere on QueryBuilder<Log, Log, QWhereClause> {
  QueryBuilder<Log, Log, QAfterWhereClause> idEqualTo(int id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Log, Log, QAfterWhereClause> idNotEqualTo(int id) {
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

  QueryBuilder<Log, Log, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Log, Log, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Log, Log, QAfterWhereClause> idBetween(
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

extension LogQueryFilter on QueryBuilder<Log, Log, QFilterCondition> {
  QueryBuilder<Log, Log, QAfterFilterCondition> aFuncEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'aFunc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> aFuncGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'aFunc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> aFuncLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'aFunc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> aFuncBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'aFunc',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> aFuncStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'aFunc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> aFuncEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'aFunc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> aFuncContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'aFunc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> aFuncMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'aFunc',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> aStepEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'aStep',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> aStepGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'aStep',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> aStepLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'aStep',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> aStepBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'aStep',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> aStepStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'aStep',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> aStepEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'aStep',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> aStepContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'aStep',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> aStepMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'aStep',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> descrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> descrGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'descr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> descrLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'descr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> descrBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'descr',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> descrStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'descr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> descrEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'descr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> descrContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'descr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> descrMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'descr',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> idEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Log, Log, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Log, Log, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Log, Log, QAfterFilterCondition> messEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mess',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> messGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mess',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> messLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mess',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> messBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mess',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> messStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'mess',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> messEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'mess',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> messContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'mess',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Log, Log, QAfterFilterCondition> messMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'mess',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }
}

extension LogQueryLinks on QueryBuilder<Log, Log, QFilterCondition> {}

extension LogQueryWhereSortBy on QueryBuilder<Log, Log, QSortBy> {
  QueryBuilder<Log, Log, QAfterSortBy> sortByAFunc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aFunc', Sort.asc);
    });
  }

  QueryBuilder<Log, Log, QAfterSortBy> sortByAFuncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aFunc', Sort.desc);
    });
  }

  QueryBuilder<Log, Log, QAfterSortBy> sortByAStep() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aStep', Sort.asc);
    });
  }

  QueryBuilder<Log, Log, QAfterSortBy> sortByAStepDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aStep', Sort.desc);
    });
  }

  QueryBuilder<Log, Log, QAfterSortBy> sortByDescr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descr', Sort.asc);
    });
  }

  QueryBuilder<Log, Log, QAfterSortBy> sortByDescrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descr', Sort.desc);
    });
  }

  QueryBuilder<Log, Log, QAfterSortBy> sortByMess() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mess', Sort.asc);
    });
  }

  QueryBuilder<Log, Log, QAfterSortBy> sortByMessDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mess', Sort.desc);
    });
  }
}

extension LogQueryWhereSortThenBy on QueryBuilder<Log, Log, QSortThenBy> {
  QueryBuilder<Log, Log, QAfterSortBy> thenByAFunc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aFunc', Sort.asc);
    });
  }

  QueryBuilder<Log, Log, QAfterSortBy> thenByAFuncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aFunc', Sort.desc);
    });
  }

  QueryBuilder<Log, Log, QAfterSortBy> thenByAStep() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aStep', Sort.asc);
    });
  }

  QueryBuilder<Log, Log, QAfterSortBy> thenByAStepDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aStep', Sort.desc);
    });
  }

  QueryBuilder<Log, Log, QAfterSortBy> thenByDescr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descr', Sort.asc);
    });
  }

  QueryBuilder<Log, Log, QAfterSortBy> thenByDescrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descr', Sort.desc);
    });
  }

  QueryBuilder<Log, Log, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Log, Log, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Log, Log, QAfterSortBy> thenByMess() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mess', Sort.asc);
    });
  }

  QueryBuilder<Log, Log, QAfterSortBy> thenByMessDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mess', Sort.desc);
    });
  }
}

extension LogQueryWhereDistinct on QueryBuilder<Log, Log, QDistinct> {
  QueryBuilder<Log, Log, QDistinct> distinctByAFunc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'aFunc', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Log, Log, QDistinct> distinctByAStep(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'aStep', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Log, Log, QDistinct> distinctByDescr(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'descr', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Log, Log, QDistinct> distinctByMess(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mess', caseSensitive: caseSensitive);
    });
  }
}

extension LogQueryProperty on QueryBuilder<Log, Log, QQueryProperty> {
  QueryBuilder<Log, String, QQueryOperations> aFuncProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'aFunc');
    });
  }

  QueryBuilder<Log, String, QQueryOperations> aStepProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'aStep');
    });
  }

  QueryBuilder<Log, String, QQueryOperations> descrProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'descr');
    });
  }

  QueryBuilder<Log, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Log, String, QQueryOperations> messProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mess');
    });
  }
}
