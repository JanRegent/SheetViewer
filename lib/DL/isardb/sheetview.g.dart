// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sheetview.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetSheetViewCollection on Isar {
  IsarCollection<SheetView> get sheetViews => getCollection();
}

const SheetViewSchema = CollectionSchema(
  name: 'SheetView',
  schema:
      '{"name":"SheetView","idName":"id","properties":[{"name":"aQuerystringKey","type":"String"},{"name":"aStatus","type":"String"},{"name":"cols","type":"StringList"},{"name":"copyrightUrl","type":"String"},{"name":"fileId","type":"String"},{"name":"fileUrl","type":"String"},{"name":"rows","type":"StringList"},{"name":"sheetName","type":"String"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {
    'aQuerystringKey': 0,
    'aStatus': 1,
    'cols': 2,
    'copyrightUrl': 3,
    'fileId': 4,
    'fileUrl': 5,
    'rows': 6,
    'sheetName': 7
  },
  listProperties: {'cols', 'rows'},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _sheetViewGetId,
  setId: _sheetViewSetId,
  getLinks: _sheetViewGetLinks,
  attachLinks: _sheetViewAttachLinks,
  serializeNative: _sheetViewSerializeNative,
  deserializeNative: _sheetViewDeserializeNative,
  deserializePropNative: _sheetViewDeserializePropNative,
  serializeWeb: _sheetViewSerializeWeb,
  deserializeWeb: _sheetViewDeserializeWeb,
  deserializePropWeb: _sheetViewDeserializePropWeb,
  version: 3,
);

int? _sheetViewGetId(SheetView object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _sheetViewSetId(SheetView object, int id) {
  object.id = id;
}

List<IsarLinkBase> _sheetViewGetLinks(SheetView object) {
  return [];
}

void _sheetViewSerializeNative(
    IsarCollection<SheetView> collection,
    IsarRawObject rawObj,
    SheetView object,
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
  final value2 = object.cols;
  dynamicSize += (value2.length) * 8;
  final bytesList2 = <IsarUint8List>[];
  for (var str in value2) {
    final bytes = IsarBinaryWriter.utf8Encoder.convert(str);
    bytesList2.add(bytes);
    dynamicSize += bytes.length as int;
  }
  final _cols = bytesList2;
  final value3 = object.copyrightUrl;
  final _copyrightUrl = IsarBinaryWriter.utf8Encoder.convert(value3);
  dynamicSize += (_copyrightUrl.length) as int;
  final value4 = object.fileId;
  final _fileId = IsarBinaryWriter.utf8Encoder.convert(value4);
  dynamicSize += (_fileId.length) as int;
  final value5 = object.fileUrl;
  final _fileUrl = IsarBinaryWriter.utf8Encoder.convert(value5);
  dynamicSize += (_fileUrl.length) as int;
  final value6 = object.rows;
  dynamicSize += (value6.length) * 8;
  final bytesList6 = <IsarUint8List>[];
  for (var str in value6) {
    final bytes = IsarBinaryWriter.utf8Encoder.convert(str);
    bytesList6.add(bytes);
    dynamicSize += bytes.length as int;
  }
  final _rows = bytesList6;
  final value7 = object.sheetName;
  final _sheetName = IsarBinaryWriter.utf8Encoder.convert(value7);
  dynamicSize += (_sheetName.length) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _aQuerystringKey);
  writer.writeBytes(offsets[1], _aStatus);
  writer.writeStringList(offsets[2], _cols);
  writer.writeBytes(offsets[3], _copyrightUrl);
  writer.writeBytes(offsets[4], _fileId);
  writer.writeBytes(offsets[5], _fileUrl);
  writer.writeStringList(offsets[6], _rows);
  writer.writeBytes(offsets[7], _sheetName);
}

SheetView _sheetViewDeserializeNative(IsarCollection<SheetView> collection,
    int id, IsarBinaryReader reader, List<int> offsets) {
  final object = SheetView();
  object.aQuerystringKey = reader.readString(offsets[0]);
  object.aStatus = reader.readString(offsets[1]);
  object.cols = reader.readStringList(offsets[2]) ?? [];
  object.copyrightUrl = reader.readString(offsets[3]);
  object.fileId = reader.readString(offsets[4]);
  object.fileUrl = reader.readString(offsets[5]);
  object.id = id;
  object.rows = reader.readStringList(offsets[6]) ?? [];
  object.sheetName = reader.readString(offsets[7]);
  return object;
}

P _sheetViewDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readStringList(offset) ?? []) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readStringList(offset) ?? []) as P;
    case 7:
      return (reader.readString(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _sheetViewSerializeWeb(
    IsarCollection<SheetView> collection, SheetView object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'aQuerystringKey', object.aQuerystringKey);
  IsarNative.jsObjectSet(jsObj, 'aStatus', object.aStatus);
  IsarNative.jsObjectSet(jsObj, 'cols', object.cols);
  IsarNative.jsObjectSet(jsObj, 'copyrightUrl', object.copyrightUrl);
  IsarNative.jsObjectSet(jsObj, 'fileId', object.fileId);
  IsarNative.jsObjectSet(jsObj, 'fileUrl', object.fileUrl);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'rows', object.rows);
  IsarNative.jsObjectSet(jsObj, 'sheetName', object.sheetName);
  return jsObj;
}

SheetView _sheetViewDeserializeWeb(
    IsarCollection<SheetView> collection, dynamic jsObj) {
  final object = SheetView();
  object.aQuerystringKey =
      IsarNative.jsObjectGet(jsObj, 'aQuerystringKey') ?? '';
  object.aStatus = IsarNative.jsObjectGet(jsObj, 'aStatus') ?? '';
  object.cols = (IsarNative.jsObjectGet(jsObj, 'cols') as List?)
          ?.map((e) => e ?? '')
          .toList()
          .cast<String>() ??
      [];
  object.copyrightUrl = IsarNative.jsObjectGet(jsObj, 'copyrightUrl') ?? '';
  object.fileId = IsarNative.jsObjectGet(jsObj, 'fileId') ?? '';
  object.fileUrl = IsarNative.jsObjectGet(jsObj, 'fileUrl') ?? '';
  object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
  object.rows = (IsarNative.jsObjectGet(jsObj, 'rows') as List?)
          ?.map((e) => e ?? '')
          .toList()
          .cast<String>() ??
      [];
  object.sheetName = IsarNative.jsObjectGet(jsObj, 'sheetName') ?? '';
  return object;
}

P _sheetViewDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'aQuerystringKey':
      return (IsarNative.jsObjectGet(jsObj, 'aQuerystringKey') ?? '') as P;
    case 'aStatus':
      return (IsarNative.jsObjectGet(jsObj, 'aStatus') ?? '') as P;
    case 'cols':
      return ((IsarNative.jsObjectGet(jsObj, 'cols') as List?)
              ?.map((e) => e ?? '')
              .toList()
              .cast<String>() ??
          []) as P;
    case 'copyrightUrl':
      return (IsarNative.jsObjectGet(jsObj, 'copyrightUrl') ?? '') as P;
    case 'fileId':
      return (IsarNative.jsObjectGet(jsObj, 'fileId') ?? '') as P;
    case 'fileUrl':
      return (IsarNative.jsObjectGet(jsObj, 'fileUrl') ?? '') as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'rows':
      return ((IsarNative.jsObjectGet(jsObj, 'rows') as List?)
              ?.map((e) => e ?? '')
              .toList()
              .cast<String>() ??
          []) as P;
    case 'sheetName':
      return (IsarNative.jsObjectGet(jsObj, 'sheetName') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _sheetViewAttachLinks(IsarCollection col, int id, SheetView object) {}

extension SheetViewQueryWhereSort
    on QueryBuilder<SheetView, SheetView, QWhere> {
  QueryBuilder<SheetView, SheetView, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension SheetViewQueryWhere
    on QueryBuilder<SheetView, SheetView, QWhereClause> {
  QueryBuilder<SheetView, SheetView, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<SheetView, SheetView, QAfterWhereClause> idNotEqualTo(int id) {
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

  QueryBuilder<SheetView, SheetView, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<SheetView, SheetView, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<SheetView, SheetView, QAfterWhereClause> idBetween(
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

extension SheetViewQueryFilter
    on QueryBuilder<SheetView, SheetView, QFilterCondition> {
  QueryBuilder<SheetView, SheetView, QAfterFilterCondition>
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

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition>
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

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition>
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

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition>
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

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition>
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

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition>
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

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition>
      aQuerystringKeyContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'aQuerystringKey',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition>
      aQuerystringKeyMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'aQuerystringKey',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition> aStatusEqualTo(
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

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition> aStatusGreaterThan(
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

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition> aStatusLessThan(
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

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition> aStatusBetween(
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

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition> aStatusStartsWith(
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

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition> aStatusEndsWith(
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

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition> aStatusContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'aStatus',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition> aStatusMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'aStatus',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition> colsAnyEqualTo(
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

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition> colsAnyGreaterThan(
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

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition> colsAnyLessThan(
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

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition> colsAnyBetween(
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

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition> colsAnyStartsWith(
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

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition> colsAnyEndsWith(
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

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition> colsAnyContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'cols',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition> colsAnyMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'cols',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition> copyrightUrlEqualTo(
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

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition>
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

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition>
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

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition> copyrightUrlBetween(
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

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition>
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

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition>
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

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition>
      copyrightUrlContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'copyrightUrl',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition> copyrightUrlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'copyrightUrl',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition> fileIdEqualTo(
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

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition> fileIdGreaterThan(
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

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition> fileIdLessThan(
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

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition> fileIdBetween(
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

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition> fileIdStartsWith(
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

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition> fileIdEndsWith(
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

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition> fileIdContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'fileId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition> fileIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'fileId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition> fileUrlEqualTo(
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

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition> fileUrlGreaterThan(
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

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition> fileUrlLessThan(
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

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition> fileUrlBetween(
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

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition> fileUrlStartsWith(
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

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition> fileUrlEndsWith(
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

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition> fileUrlContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'fileUrl',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition> fileUrlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'fileUrl',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition> idEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition> idBetween(
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

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition> rowsAnyEqualTo(
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

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition> rowsAnyGreaterThan(
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

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition> rowsAnyLessThan(
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

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition> rowsAnyBetween(
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

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition> rowsAnyStartsWith(
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

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition> rowsAnyEndsWith(
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

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition> rowsAnyContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'rows',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition> rowsAnyMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'rows',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition> sheetNameEqualTo(
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

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition>
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

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition> sheetNameLessThan(
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

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition> sheetNameBetween(
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

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition> sheetNameStartsWith(
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

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition> sheetNameEndsWith(
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

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition> sheetNameContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'sheetName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SheetView, SheetView, QAfterFilterCondition> sheetNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'sheetName',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension SheetViewQueryLinks
    on QueryBuilder<SheetView, SheetView, QFilterCondition> {}

extension SheetViewQueryWhereSortBy
    on QueryBuilder<SheetView, SheetView, QSortBy> {
  QueryBuilder<SheetView, SheetView, QAfterSortBy> sortByAQuerystringKey() {
    return addSortByInternal('aQuerystringKey', Sort.asc);
  }

  QueryBuilder<SheetView, SheetView, QAfterSortBy> sortByAQuerystringKeyDesc() {
    return addSortByInternal('aQuerystringKey', Sort.desc);
  }

  QueryBuilder<SheetView, SheetView, QAfterSortBy> sortByAStatus() {
    return addSortByInternal('aStatus', Sort.asc);
  }

  QueryBuilder<SheetView, SheetView, QAfterSortBy> sortByAStatusDesc() {
    return addSortByInternal('aStatus', Sort.desc);
  }

  QueryBuilder<SheetView, SheetView, QAfterSortBy> sortByCopyrightUrl() {
    return addSortByInternal('copyrightUrl', Sort.asc);
  }

  QueryBuilder<SheetView, SheetView, QAfterSortBy> sortByCopyrightUrlDesc() {
    return addSortByInternal('copyrightUrl', Sort.desc);
  }

  QueryBuilder<SheetView, SheetView, QAfterSortBy> sortByFileId() {
    return addSortByInternal('fileId', Sort.asc);
  }

  QueryBuilder<SheetView, SheetView, QAfterSortBy> sortByFileIdDesc() {
    return addSortByInternal('fileId', Sort.desc);
  }

  QueryBuilder<SheetView, SheetView, QAfterSortBy> sortByFileUrl() {
    return addSortByInternal('fileUrl', Sort.asc);
  }

  QueryBuilder<SheetView, SheetView, QAfterSortBy> sortByFileUrlDesc() {
    return addSortByInternal('fileUrl', Sort.desc);
  }

  QueryBuilder<SheetView, SheetView, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<SheetView, SheetView, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<SheetView, SheetView, QAfterSortBy> sortBySheetName() {
    return addSortByInternal('sheetName', Sort.asc);
  }

  QueryBuilder<SheetView, SheetView, QAfterSortBy> sortBySheetNameDesc() {
    return addSortByInternal('sheetName', Sort.desc);
  }
}

extension SheetViewQueryWhereSortThenBy
    on QueryBuilder<SheetView, SheetView, QSortThenBy> {
  QueryBuilder<SheetView, SheetView, QAfterSortBy> thenByAQuerystringKey() {
    return addSortByInternal('aQuerystringKey', Sort.asc);
  }

  QueryBuilder<SheetView, SheetView, QAfterSortBy> thenByAQuerystringKeyDesc() {
    return addSortByInternal('aQuerystringKey', Sort.desc);
  }

  QueryBuilder<SheetView, SheetView, QAfterSortBy> thenByAStatus() {
    return addSortByInternal('aStatus', Sort.asc);
  }

  QueryBuilder<SheetView, SheetView, QAfterSortBy> thenByAStatusDesc() {
    return addSortByInternal('aStatus', Sort.desc);
  }

  QueryBuilder<SheetView, SheetView, QAfterSortBy> thenByCopyrightUrl() {
    return addSortByInternal('copyrightUrl', Sort.asc);
  }

  QueryBuilder<SheetView, SheetView, QAfterSortBy> thenByCopyrightUrlDesc() {
    return addSortByInternal('copyrightUrl', Sort.desc);
  }

  QueryBuilder<SheetView, SheetView, QAfterSortBy> thenByFileId() {
    return addSortByInternal('fileId', Sort.asc);
  }

  QueryBuilder<SheetView, SheetView, QAfterSortBy> thenByFileIdDesc() {
    return addSortByInternal('fileId', Sort.desc);
  }

  QueryBuilder<SheetView, SheetView, QAfterSortBy> thenByFileUrl() {
    return addSortByInternal('fileUrl', Sort.asc);
  }

  QueryBuilder<SheetView, SheetView, QAfterSortBy> thenByFileUrlDesc() {
    return addSortByInternal('fileUrl', Sort.desc);
  }

  QueryBuilder<SheetView, SheetView, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<SheetView, SheetView, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<SheetView, SheetView, QAfterSortBy> thenBySheetName() {
    return addSortByInternal('sheetName', Sort.asc);
  }

  QueryBuilder<SheetView, SheetView, QAfterSortBy> thenBySheetNameDesc() {
    return addSortByInternal('sheetName', Sort.desc);
  }
}

extension SheetViewQueryWhereDistinct
    on QueryBuilder<SheetView, SheetView, QDistinct> {
  QueryBuilder<SheetView, SheetView, QDistinct> distinctByAQuerystringKey(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('aQuerystringKey',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<SheetView, SheetView, QDistinct> distinctByAStatus(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('aStatus', caseSensitive: caseSensitive);
  }

  QueryBuilder<SheetView, SheetView, QDistinct> distinctByCopyrightUrl(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('copyrightUrl', caseSensitive: caseSensitive);
  }

  QueryBuilder<SheetView, SheetView, QDistinct> distinctByFileId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('fileId', caseSensitive: caseSensitive);
  }

  QueryBuilder<SheetView, SheetView, QDistinct> distinctByFileUrl(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('fileUrl', caseSensitive: caseSensitive);
  }

  QueryBuilder<SheetView, SheetView, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<SheetView, SheetView, QDistinct> distinctBySheetName(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('sheetName', caseSensitive: caseSensitive);
  }
}

extension SheetViewQueryProperty
    on QueryBuilder<SheetView, SheetView, QQueryProperty> {
  QueryBuilder<SheetView, String, QQueryOperations> aQuerystringKeyProperty() {
    return addPropertyNameInternal('aQuerystringKey');
  }

  QueryBuilder<SheetView, String, QQueryOperations> aStatusProperty() {
    return addPropertyNameInternal('aStatus');
  }

  QueryBuilder<SheetView, List<String>, QQueryOperations> colsProperty() {
    return addPropertyNameInternal('cols');
  }

  QueryBuilder<SheetView, String, QQueryOperations> copyrightUrlProperty() {
    return addPropertyNameInternal('copyrightUrl');
  }

  QueryBuilder<SheetView, String, QQueryOperations> fileIdProperty() {
    return addPropertyNameInternal('fileId');
  }

  QueryBuilder<SheetView, String, QQueryOperations> fileUrlProperty() {
    return addPropertyNameInternal('fileUrl');
  }

  QueryBuilder<SheetView, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<SheetView, List<String>, QQueryOperations> rowsProperty() {
    return addPropertyNameInternal('rows');
  }

  QueryBuilder<SheetView, String, QQueryOperations> sheetNameProperty() {
    return addPropertyNameInternal('sheetName');
  }
}
