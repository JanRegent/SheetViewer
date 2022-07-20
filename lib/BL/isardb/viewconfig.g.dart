// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viewconfig.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings

extension GetViewConfigCollection on Isar {
  IsarCollection<ViewConfig> get viewConfigs => getCollection();
}

const ViewConfigSchema = CollectionSchema(
  name: r'ViewConfig',
  schema:
      r'{"name":"ViewConfig","idName":"id","properties":[{"name":"aSheetName","type":"String"},{"name":"autoFit","type":"StringList"},{"name":"colsFilter","type":"StringList"},{"name":"colsHeader","type":"String"},{"name":"freezeTo","type":"StringList"},{"name":"sort","type":"String"},{"name":"zSheetNameConfig","type":"String"},{"name":"zfileId","type":"String"},{"name":"zfileIdConfig","type":"String"}],"indexes":[],"links":[]}',
  idName: r'id',
  propertyIds: {
    r'aSheetName': 0,
    r'autoFit': 1,
    r'colsFilter': 2,
    r'colsHeader': 3,
    r'freezeTo': 4,
    r'sort': 5,
    r'zSheetNameConfig': 6,
    r'zfileId': 7,
    r'zfileIdConfig': 8
  },
  listProperties: {r'autoFit', r'colsFilter', r'freezeTo'},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _viewConfigGetId,
  setId: _viewConfigSetId,
  getLinks: _viewConfigGetLinks,
  attachLinks: _viewConfigAttachLinks,
  serializeNative: _viewConfigSerializeNative,
  deserializeNative: _viewConfigDeserializeNative,
  deserializePropNative: _viewConfigDeserializePropNative,
  serializeWeb: _viewConfigSerializeWeb,
  deserializeWeb: _viewConfigDeserializeWeb,
  deserializePropWeb: _viewConfigDeserializePropWeb,
  version: 4,
);

int? _viewConfigGetId(ViewConfig object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _viewConfigSetId(ViewConfig object, int id) {
  object.id = id;
}

List<IsarLinkBase<dynamic>> _viewConfigGetLinks(ViewConfig object) {
  return [];
}

void _viewConfigSerializeNative(
    IsarCollection<ViewConfig> collection,
    IsarCObject cObj,
    ViewConfig object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  final aSheetName$Bytes =
      IsarBinaryWriter.utf8Encoder.convert(object.aSheetName);
  var autoFit$BytesCount = (object.autoFit.length) * 8;
  final autoFit$BytesList = <IsarUint8List>[];
  for (final str in object.autoFit) {
    final bytes = IsarBinaryWriter.utf8Encoder.convert(str);
    autoFit$BytesList.add(bytes);
    autoFit$BytesCount += bytes.length as int;
  }
  var colsFilter$BytesCount = (object.colsFilter.length) * 8;
  final colsFilter$BytesList = <IsarUint8List>[];
  for (final str in object.colsFilter) {
    final bytes = IsarBinaryWriter.utf8Encoder.convert(str);
    colsFilter$BytesList.add(bytes);
    colsFilter$BytesCount += bytes.length as int;
  }
  final colsHeader$Bytes =
      IsarBinaryWriter.utf8Encoder.convert(object.colsHeader);
  var freezeTo$BytesCount = (object.freezeTo.length) * 8;
  final freezeTo$BytesList = <IsarUint8List>[];
  for (final str in object.freezeTo) {
    final bytes = IsarBinaryWriter.utf8Encoder.convert(str);
    freezeTo$BytesList.add(bytes);
    freezeTo$BytesCount += bytes.length as int;
  }
  final sort$Bytes = IsarBinaryWriter.utf8Encoder.convert(object.sort);
  final zSheetNameConfig$Bytes =
      IsarBinaryWriter.utf8Encoder.convert(object.zSheetNameConfig);
  final zfileId$Bytes = IsarBinaryWriter.utf8Encoder.convert(object.zfileId);
  final zfileIdConfig$Bytes =
      IsarBinaryWriter.utf8Encoder.convert(object.zfileIdConfig);
  final size = (staticSize +
      (aSheetName$Bytes.length) +
      autoFit$BytesCount +
      colsFilter$BytesCount +
      (colsHeader$Bytes.length) +
      freezeTo$BytesCount +
      (sort$Bytes.length) +
      (zSheetNameConfig$Bytes.length) +
      (zfileId$Bytes.length) +
      (zfileIdConfig$Bytes.length)) as int;
  cObj.buffer = alloc(size);
  cObj.buffer_length = size;

  final buffer = IsarNative.bufAsBytes(cObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeHeader();
  writer.writeBytes(offsets[0], aSheetName$Bytes);
  writer.writeStringList(offsets[1], autoFit$BytesList);
  writer.writeStringList(offsets[2], colsFilter$BytesList);
  writer.writeBytes(offsets[3], colsHeader$Bytes);
  writer.writeStringList(offsets[4], freezeTo$BytesList);
  writer.writeBytes(offsets[5], sort$Bytes);
  writer.writeBytes(offsets[6], zSheetNameConfig$Bytes);
  writer.writeBytes(offsets[7], zfileId$Bytes);
  writer.writeBytes(offsets[8], zfileIdConfig$Bytes);
}

ViewConfig _viewConfigDeserializeNative(IsarCollection<ViewConfig> collection,
    int id, IsarBinaryReader reader, List<int> offsets) {
  final object = ViewConfig();
  object.aSheetName = reader.readString(offsets[0]);
  object.autoFit = reader.readStringList(offsets[1]) ?? [];
  object.colsFilter = reader.readStringList(offsets[2]) ?? [];
  object.colsHeader = reader.readString(offsets[3]);
  object.freezeTo = reader.readStringList(offsets[4]) ?? [];
  object.id = id;
  object.sort = reader.readString(offsets[5]);
  object.zSheetNameConfig = reader.readString(offsets[6]);
  object.zfileId = reader.readString(offsets[7]);
  object.zfileIdConfig = reader.readString(offsets[8]);
  return object;
}

P _viewConfigDeserializePropNative<P>(
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
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readStringList(offset) ?? []) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Illegal propertyIndex');
  }
}

Object _viewConfigSerializeWeb(
    IsarCollection<ViewConfig> collection, ViewConfig object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, r'aSheetName', object.aSheetName);
  IsarNative.jsObjectSet(jsObj, r'autoFit', object.autoFit);
  IsarNative.jsObjectSet(jsObj, r'colsFilter', object.colsFilter);
  IsarNative.jsObjectSet(jsObj, r'colsHeader', object.colsHeader);
  IsarNative.jsObjectSet(jsObj, r'freezeTo', object.freezeTo);
  IsarNative.jsObjectSet(jsObj, r'id', object.id);
  IsarNative.jsObjectSet(jsObj, r'sort', object.sort);
  IsarNative.jsObjectSet(jsObj, r'zSheetNameConfig', object.zSheetNameConfig);
  IsarNative.jsObjectSet(jsObj, r'zfileId', object.zfileId);
  IsarNative.jsObjectSet(jsObj, r'zfileIdConfig', object.zfileIdConfig);
  return jsObj;
}

ViewConfig _viewConfigDeserializeWeb(
    IsarCollection<ViewConfig> collection, Object jsObj) {
  final object = ViewConfig();
  object.aSheetName = IsarNative.jsObjectGet(jsObj, r'aSheetName') ?? '';
  object.autoFit = (IsarNative.jsObjectGet(jsObj, r'autoFit') as List?)
          ?.map((e) => e ?? '')
          .toList()
          .cast<String>() ??
      [];
  object.colsFilter = (IsarNative.jsObjectGet(jsObj, r'colsFilter') as List?)
          ?.map((e) => e ?? '')
          .toList()
          .cast<String>() ??
      [];
  object.colsHeader = IsarNative.jsObjectGet(jsObj, r'colsHeader') ?? '';
  object.freezeTo = (IsarNative.jsObjectGet(jsObj, r'freezeTo') as List?)
          ?.map((e) => e ?? '')
          .toList()
          .cast<String>() ??
      [];
  object.id =
      IsarNative.jsObjectGet(jsObj, r'id') ?? (double.negativeInfinity as int);
  object.sort = IsarNative.jsObjectGet(jsObj, r'sort') ?? '';
  object.zSheetNameConfig =
      IsarNative.jsObjectGet(jsObj, r'zSheetNameConfig') ?? '';
  object.zfileId = IsarNative.jsObjectGet(jsObj, r'zfileId') ?? '';
  object.zfileIdConfig = IsarNative.jsObjectGet(jsObj, r'zfileIdConfig') ?? '';
  return object;
}

P _viewConfigDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case r'aSheetName':
      return (IsarNative.jsObjectGet(jsObj, r'aSheetName') ?? '') as P;
    case r'autoFit':
      return ((IsarNative.jsObjectGet(jsObj, r'autoFit') as List?)
              ?.map((e) => e ?? '')
              .toList()
              .cast<String>() ??
          []) as P;
    case r'colsFilter':
      return ((IsarNative.jsObjectGet(jsObj, r'colsFilter') as List?)
              ?.map((e) => e ?? '')
              .toList()
              .cast<String>() ??
          []) as P;
    case r'colsHeader':
      return (IsarNative.jsObjectGet(jsObj, r'colsHeader') ?? '') as P;
    case r'freezeTo':
      return ((IsarNative.jsObjectGet(jsObj, r'freezeTo') as List?)
              ?.map((e) => e ?? '')
              .toList()
              .cast<String>() ??
          []) as P;
    case r'id':
      return (IsarNative.jsObjectGet(jsObj, r'id') ??
          (double.negativeInfinity as int)) as P;
    case r'sort':
      return (IsarNative.jsObjectGet(jsObj, r'sort') ?? '') as P;
    case r'zSheetNameConfig':
      return (IsarNative.jsObjectGet(jsObj, r'zSheetNameConfig') ?? '') as P;
    case r'zfileId':
      return (IsarNative.jsObjectGet(jsObj, r'zfileId') ?? '') as P;
    case r'zfileIdConfig':
      return (IsarNative.jsObjectGet(jsObj, r'zfileIdConfig') ?? '') as P;
    default:
      throw IsarError('Illegal propertyName');
  }
}

void _viewConfigAttachLinks(
    IsarCollection<dynamic> col, int id, ViewConfig object) {}

extension ViewConfigQueryWhereSort
    on QueryBuilder<ViewConfig, ViewConfig, QWhere> {
  QueryBuilder<ViewConfig, ViewConfig, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ViewConfigQueryWhere
    on QueryBuilder<ViewConfig, ViewConfig, QWhereClause> {
  QueryBuilder<ViewConfig, ViewConfig, QAfterWhereClause> idEqualTo(int id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterWhereClause> idNotEqualTo(int id) {
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

  QueryBuilder<ViewConfig, ViewConfig, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterWhereClause> idBetween(
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

extension ViewConfigQueryFilter
    on QueryBuilder<ViewConfig, ViewConfig, QFilterCondition> {
  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition> aSheetNameEqualTo(
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

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition>
      aSheetNameGreaterThan(
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

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition>
      aSheetNameLessThan(
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

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition> aSheetNameBetween(
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

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition>
      aSheetNameStartsWith(
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

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition>
      aSheetNameEndsWith(
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

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition>
      aSheetNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'aSheetName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition> aSheetNameMatches(
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

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition>
      autoFitElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'autoFit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition>
      autoFitElementGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'autoFit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition>
      autoFitElementLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'autoFit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition>
      autoFitElementBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'autoFit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition>
      autoFitElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'autoFit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition>
      autoFitElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'autoFit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition>
      autoFitElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'autoFit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition>
      autoFitElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'autoFit',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition>
      colsFilterElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'colsFilter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition>
      colsFilterElementGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'colsFilter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition>
      colsFilterElementLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'colsFilter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition>
      colsFilterElementBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'colsFilter',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition>
      colsFilterElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'colsFilter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition>
      colsFilterElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'colsFilter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition>
      colsFilterElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'colsFilter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition>
      colsFilterElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'colsFilter',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition> colsHeaderEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'colsHeader',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition>
      colsHeaderGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'colsHeader',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition>
      colsHeaderLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'colsHeader',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition> colsHeaderBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'colsHeader',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition>
      colsHeaderStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'colsHeader',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition>
      colsHeaderEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'colsHeader',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition>
      colsHeaderContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'colsHeader',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition> colsHeaderMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'colsHeader',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition>
      freezeToElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'freezeTo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition>
      freezeToElementGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'freezeTo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition>
      freezeToElementLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'freezeTo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition>
      freezeToElementBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'freezeTo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition>
      freezeToElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'freezeTo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition>
      freezeToElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'freezeTo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition>
      freezeToElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'freezeTo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition>
      freezeToElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'freezeTo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition> idEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition> sortEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sort',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition> sortGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sort',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition> sortLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sort',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition> sortBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sort',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition> sortStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sort',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition> sortEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sort',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition> sortContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sort',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition> sortMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sort',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition>
      zSheetNameConfigEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'zSheetNameConfig',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition>
      zSheetNameConfigGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'zSheetNameConfig',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition>
      zSheetNameConfigLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'zSheetNameConfig',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition>
      zSheetNameConfigBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'zSheetNameConfig',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition>
      zSheetNameConfigStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'zSheetNameConfig',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition>
      zSheetNameConfigEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'zSheetNameConfig',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition>
      zSheetNameConfigContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'zSheetNameConfig',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition>
      zSheetNameConfigMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'zSheetNameConfig',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition> zfileIdEqualTo(
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

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition>
      zfileIdGreaterThan(
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

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition> zfileIdLessThan(
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

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition> zfileIdBetween(
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

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition> zfileIdStartsWith(
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

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition> zfileIdEndsWith(
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

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition> zfileIdContains(
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

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition> zfileIdMatches(
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

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition>
      zfileIdConfigEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'zfileIdConfig',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition>
      zfileIdConfigGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'zfileIdConfig',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition>
      zfileIdConfigLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'zfileIdConfig',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition>
      zfileIdConfigBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'zfileIdConfig',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition>
      zfileIdConfigStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'zfileIdConfig',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition>
      zfileIdConfigEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'zfileIdConfig',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition>
      zfileIdConfigContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'zfileIdConfig',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterFilterCondition>
      zfileIdConfigMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'zfileIdConfig',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }
}

extension ViewConfigQueryLinks
    on QueryBuilder<ViewConfig, ViewConfig, QFilterCondition> {}

extension ViewConfigQueryWhereSortBy
    on QueryBuilder<ViewConfig, ViewConfig, QSortBy> {
  QueryBuilder<ViewConfig, ViewConfig, QAfterSortBy> sortByASheetName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aSheetName', Sort.asc);
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterSortBy> sortByASheetNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aSheetName', Sort.desc);
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterSortBy> sortByColsHeader() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colsHeader', Sort.asc);
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterSortBy> sortByColsHeaderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colsHeader', Sort.desc);
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterSortBy> sortBySort() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sort', Sort.asc);
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterSortBy> sortBySortDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sort', Sort.desc);
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterSortBy> sortByZSheetNameConfig() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'zSheetNameConfig', Sort.asc);
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterSortBy>
      sortByZSheetNameConfigDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'zSheetNameConfig', Sort.desc);
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterSortBy> sortByZfileId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'zfileId', Sort.asc);
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterSortBy> sortByZfileIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'zfileId', Sort.desc);
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterSortBy> sortByZfileIdConfig() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'zfileIdConfig', Sort.asc);
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterSortBy> sortByZfileIdConfigDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'zfileIdConfig', Sort.desc);
    });
  }
}

extension ViewConfigQueryWhereSortThenBy
    on QueryBuilder<ViewConfig, ViewConfig, QSortThenBy> {
  QueryBuilder<ViewConfig, ViewConfig, QAfterSortBy> thenByASheetName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aSheetName', Sort.asc);
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterSortBy> thenByASheetNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aSheetName', Sort.desc);
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterSortBy> thenByColsHeader() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colsHeader', Sort.asc);
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterSortBy> thenByColsHeaderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colsHeader', Sort.desc);
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterSortBy> thenBySort() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sort', Sort.asc);
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterSortBy> thenBySortDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sort', Sort.desc);
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterSortBy> thenByZSheetNameConfig() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'zSheetNameConfig', Sort.asc);
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterSortBy>
      thenByZSheetNameConfigDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'zSheetNameConfig', Sort.desc);
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterSortBy> thenByZfileId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'zfileId', Sort.asc);
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterSortBy> thenByZfileIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'zfileId', Sort.desc);
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterSortBy> thenByZfileIdConfig() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'zfileIdConfig', Sort.asc);
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QAfterSortBy> thenByZfileIdConfigDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'zfileIdConfig', Sort.desc);
    });
  }
}

extension ViewConfigQueryWhereDistinct
    on QueryBuilder<ViewConfig, ViewConfig, QDistinct> {
  QueryBuilder<ViewConfig, ViewConfig, QDistinct> distinctByASheetName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'aSheetName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QDistinct> distinctByAutoFit() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'autoFit');
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QDistinct> distinctByColsFilter() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'colsFilter');
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QDistinct> distinctByColsHeader(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'colsHeader', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QDistinct> distinctByFreezeTo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'freezeTo');
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QDistinct> distinctBySort(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sort', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QDistinct> distinctByZSheetNameConfig(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'zSheetNameConfig',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QDistinct> distinctByZfileId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'zfileId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ViewConfig, ViewConfig, QDistinct> distinctByZfileIdConfig(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'zfileIdConfig',
          caseSensitive: caseSensitive);
    });
  }
}

extension ViewConfigQueryProperty
    on QueryBuilder<ViewConfig, ViewConfig, QQueryProperty> {
  QueryBuilder<ViewConfig, String, QQueryOperations> aSheetNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'aSheetName');
    });
  }

  QueryBuilder<ViewConfig, List<String>, QQueryOperations> autoFitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'autoFit');
    });
  }

  QueryBuilder<ViewConfig, List<String>, QQueryOperations>
      colsFilterProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'colsFilter');
    });
  }

  QueryBuilder<ViewConfig, String, QQueryOperations> colsHeaderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'colsHeader');
    });
  }

  QueryBuilder<ViewConfig, List<String>, QQueryOperations> freezeToProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'freezeTo');
    });
  }

  QueryBuilder<ViewConfig, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ViewConfig, String, QQueryOperations> sortProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sort');
    });
  }

  QueryBuilder<ViewConfig, String, QQueryOperations>
      zSheetNameConfigProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'zSheetNameConfig');
    });
  }

  QueryBuilder<ViewConfig, String, QQueryOperations> zfileIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'zfileId');
    });
  }

  QueryBuilder<ViewConfig, String, QQueryOperations> zfileIdConfigProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'zfileIdConfig');
    });
  }
}
