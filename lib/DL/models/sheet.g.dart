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
      '{"name":"Sheet","idName":"id","properties":[{"name":"aQuerystringKey","type":"String"},{"name":"cols","type":"StringList"},{"name":"colsHeader","type":"StringList"},{"name":"copyrightUrl","type":"String"},{"name":"fileId","type":"String"},{"name":"fileUrl","type":"String"},{"name":"rows","type":"StringList"},{"name":"sheetName","type":"String"},{"name":"status","type":"String"}],"indexes":[],"links":[]}',
  nativeAdapter: const _SheetNativeAdapter(),
  webAdapter: const _SheetWebAdapter(),
  idName: 'id',
  propertyIds: {
    'aQuerystringKey': 0,
    'cols': 1,
    'colsHeader': 2,
    'copyrightUrl': 3,
    'fileId': 4,
    'fileUrl': 5,
    'rows': 6,
    'sheetName': 7,
    'status': 8
  },
  listProperties: {'cols', 'colsHeader', 'rows'},
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
    IsarNative.jsObjectSet(jsObj, 'aQuerystringKey', object.aQuerystringKey);
    IsarNative.jsObjectSet(jsObj, 'cols', object.cols);
    IsarNative.jsObjectSet(jsObj, 'colsHeader', object.colsHeader);
    IsarNative.jsObjectSet(jsObj, 'copyrightUrl', object.copyrightUrl);
    IsarNative.jsObjectSet(jsObj, 'fileId', object.fileId);
    IsarNative.jsObjectSet(jsObj, 'fileUrl', object.fileUrl);
    IsarNative.jsObjectSet(jsObj, 'id', object.id);
    IsarNative.jsObjectSet(jsObj, 'rows', object.rows);
    IsarNative.jsObjectSet(jsObj, 'sheetName', object.sheetName);
    IsarNative.jsObjectSet(jsObj, 'status', object.status);
    return jsObj;
  }

  @override
  Sheet deserialize(IsarCollection<Sheet> collection, dynamic jsObj) {
    final object = Sheet();
    object.aQuerystringKey =
        IsarNative.jsObjectGet(jsObj, 'aQuerystringKey') ?? '';
    object.cols = (IsarNative.jsObjectGet(jsObj, 'cols') as List?)
            ?.map((e) => e ?? '')
            .toList()
            .cast<String>() ??
        [];
    object.colsHeader = (IsarNative.jsObjectGet(jsObj, 'colsHeader') as List?)
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
    object.status = IsarNative.jsObjectGet(jsObj, 'status') ?? '';
    return object;
  }

  @override
  P deserializeProperty<P>(Object jsObj, String propertyName) {
    switch (propertyName) {
      case 'aQuerystringKey':
        return (IsarNative.jsObjectGet(jsObj, 'aQuerystringKey') ?? '') as P;
      case 'cols':
        return ((IsarNative.jsObjectGet(jsObj, 'cols') as List?)
                ?.map((e) => e ?? '')
                .toList()
                .cast<String>() ??
            []) as P;
      case 'colsHeader':
        return ((IsarNative.jsObjectGet(jsObj, 'colsHeader') as List?)
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
      case 'status':
        return (IsarNative.jsObjectGet(jsObj, 'status') ?? '') as P;
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
    final value0 = object.aQuerystringKey;
    final _aQuerystringKey = IsarBinaryWriter.utf8Encoder.convert(value0);
    dynamicSize += (_aQuerystringKey.length) as int;
    final value1 = object.cols;
    dynamicSize += (value1.length) * 8;
    final bytesList1 = <IsarUint8List>[];
    for (var str in value1) {
      final bytes = IsarBinaryWriter.utf8Encoder.convert(str);
      bytesList1.add(bytes);
      dynamicSize += bytes.length as int;
    }
    final _cols = bytesList1;
    final value2 = object.colsHeader;
    dynamicSize += (value2.length) * 8;
    final bytesList2 = <IsarUint8List>[];
    for (var str in value2) {
      final bytes = IsarBinaryWriter.utf8Encoder.convert(str);
      bytesList2.add(bytes);
      dynamicSize += bytes.length as int;
    }
    final _colsHeader = bytesList2;
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
    final value8 = object.status;
    final _status = IsarBinaryWriter.utf8Encoder.convert(value8);
    dynamicSize += (_status.length) as int;
    final size = staticSize + dynamicSize;

    rawObj.buffer = alloc(size);
    rawObj.buffer_length = size;
    final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
    final writer = IsarBinaryWriter(buffer, staticSize);
    writer.writeBytes(offsets[0], _aQuerystringKey);
    writer.writeStringList(offsets[1], _cols);
    writer.writeStringList(offsets[2], _colsHeader);
    writer.writeBytes(offsets[3], _copyrightUrl);
    writer.writeBytes(offsets[4], _fileId);
    writer.writeBytes(offsets[5], _fileUrl);
    writer.writeStringList(offsets[6], _rows);
    writer.writeBytes(offsets[7], _sheetName);
    writer.writeBytes(offsets[8], _status);
  }

  @override
  Sheet deserialize(IsarCollection<Sheet> collection, int id,
      IsarBinaryReader reader, List<int> offsets) {
    final object = Sheet();
    object.aQuerystringKey = reader.readString(offsets[0]);
    object.cols = reader.readStringList(offsets[1]) ?? [];
    object.colsHeader = reader.readStringList(offsets[2]) ?? [];
    object.copyrightUrl = reader.readString(offsets[3]);
    object.fileId = reader.readString(offsets[4]);
    object.fileUrl = reader.readString(offsets[5]);
    object.id = id;
    object.rows = reader.readStringList(offsets[6]) ?? [];
    object.sheetName = reader.readString(offsets[7]);
    object.status = reader.readString(offsets[8]);
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
      case 8:
        return (reader.readString(offset)) as P;
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
  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> aQuerystringKeyEqualTo(
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

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> aQuerystringKeyGreaterThan(
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

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> aQuerystringKeyLessThan(
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

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> aQuerystringKeyBetween(
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

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> aQuerystringKeyStartsWith(
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

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> aQuerystringKeyEndsWith(
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

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> aQuerystringKeyContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'aQuerystringKey',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> aQuerystringKeyMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'aQuerystringKey',
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

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> colsHeaderAnyEqualTo(
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

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> colsHeaderAnyGreaterThan(
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

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> colsHeaderAnyLessThan(
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

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> colsHeaderAnyBetween(
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

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> colsHeaderAnyStartsWith(
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

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> colsHeaderAnyEndsWith(
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

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> colsHeaderAnyContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'colsHeader',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> colsHeaderAnyMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'colsHeader',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> copyrightUrlEqualTo(
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

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> copyrightUrlGreaterThan(
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

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> copyrightUrlLessThan(
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

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> copyrightUrlBetween(
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

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> copyrightUrlStartsWith(
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

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> copyrightUrlEndsWith(
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

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> copyrightUrlContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'copyrightUrl',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> copyrightUrlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'copyrightUrl',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> fileIdEqualTo(
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

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> fileIdGreaterThan(
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

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> fileIdLessThan(
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

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> fileIdBetween(
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

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> fileIdStartsWith(
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

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> fileIdEndsWith(
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

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> fileIdContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'fileId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> fileIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'fileId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> fileUrlEqualTo(
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

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> fileUrlGreaterThan(
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

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> fileUrlLessThan(
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

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> fileUrlBetween(
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

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> fileUrlStartsWith(
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

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> fileUrlEndsWith(
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

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> fileUrlContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'fileUrl',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> fileUrlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'fileUrl',
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

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> sheetNameEqualTo(
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

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> sheetNameGreaterThan(
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

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> sheetNameLessThan(
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

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> sheetNameBetween(
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

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> sheetNameStartsWith(
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

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> sheetNameEndsWith(
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

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> sheetNameContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'sheetName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> sheetNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'sheetName',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> statusEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'status',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> statusGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'status',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> statusLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'status',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> statusBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'status',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> statusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'status',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> statusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'status',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> statusContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'status',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Sheet, Sheet, QAfterFilterCondition> statusMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'status',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension SheetQueryLinks on QueryBuilder<Sheet, Sheet, QFilterCondition> {}

extension SheetQueryWhereSortBy on QueryBuilder<Sheet, Sheet, QSortBy> {
  QueryBuilder<Sheet, Sheet, QAfterSortBy> sortByAQuerystringKey() {
    return addSortByInternal('aQuerystringKey', Sort.asc);
  }

  QueryBuilder<Sheet, Sheet, QAfterSortBy> sortByAQuerystringKeyDesc() {
    return addSortByInternal('aQuerystringKey', Sort.desc);
  }

  QueryBuilder<Sheet, Sheet, QAfterSortBy> sortByCopyrightUrl() {
    return addSortByInternal('copyrightUrl', Sort.asc);
  }

  QueryBuilder<Sheet, Sheet, QAfterSortBy> sortByCopyrightUrlDesc() {
    return addSortByInternal('copyrightUrl', Sort.desc);
  }

  QueryBuilder<Sheet, Sheet, QAfterSortBy> sortByFileId() {
    return addSortByInternal('fileId', Sort.asc);
  }

  QueryBuilder<Sheet, Sheet, QAfterSortBy> sortByFileIdDesc() {
    return addSortByInternal('fileId', Sort.desc);
  }

  QueryBuilder<Sheet, Sheet, QAfterSortBy> sortByFileUrl() {
    return addSortByInternal('fileUrl', Sort.asc);
  }

  QueryBuilder<Sheet, Sheet, QAfterSortBy> sortByFileUrlDesc() {
    return addSortByInternal('fileUrl', Sort.desc);
  }

  QueryBuilder<Sheet, Sheet, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Sheet, Sheet, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Sheet, Sheet, QAfterSortBy> sortBySheetName() {
    return addSortByInternal('sheetName', Sort.asc);
  }

  QueryBuilder<Sheet, Sheet, QAfterSortBy> sortBySheetNameDesc() {
    return addSortByInternal('sheetName', Sort.desc);
  }

  QueryBuilder<Sheet, Sheet, QAfterSortBy> sortByStatus() {
    return addSortByInternal('status', Sort.asc);
  }

  QueryBuilder<Sheet, Sheet, QAfterSortBy> sortByStatusDesc() {
    return addSortByInternal('status', Sort.desc);
  }
}

extension SheetQueryWhereSortThenBy on QueryBuilder<Sheet, Sheet, QSortThenBy> {
  QueryBuilder<Sheet, Sheet, QAfterSortBy> thenByAQuerystringKey() {
    return addSortByInternal('aQuerystringKey', Sort.asc);
  }

  QueryBuilder<Sheet, Sheet, QAfterSortBy> thenByAQuerystringKeyDesc() {
    return addSortByInternal('aQuerystringKey', Sort.desc);
  }

  QueryBuilder<Sheet, Sheet, QAfterSortBy> thenByCopyrightUrl() {
    return addSortByInternal('copyrightUrl', Sort.asc);
  }

  QueryBuilder<Sheet, Sheet, QAfterSortBy> thenByCopyrightUrlDesc() {
    return addSortByInternal('copyrightUrl', Sort.desc);
  }

  QueryBuilder<Sheet, Sheet, QAfterSortBy> thenByFileId() {
    return addSortByInternal('fileId', Sort.asc);
  }

  QueryBuilder<Sheet, Sheet, QAfterSortBy> thenByFileIdDesc() {
    return addSortByInternal('fileId', Sort.desc);
  }

  QueryBuilder<Sheet, Sheet, QAfterSortBy> thenByFileUrl() {
    return addSortByInternal('fileUrl', Sort.asc);
  }

  QueryBuilder<Sheet, Sheet, QAfterSortBy> thenByFileUrlDesc() {
    return addSortByInternal('fileUrl', Sort.desc);
  }

  QueryBuilder<Sheet, Sheet, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Sheet, Sheet, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Sheet, Sheet, QAfterSortBy> thenBySheetName() {
    return addSortByInternal('sheetName', Sort.asc);
  }

  QueryBuilder<Sheet, Sheet, QAfterSortBy> thenBySheetNameDesc() {
    return addSortByInternal('sheetName', Sort.desc);
  }

  QueryBuilder<Sheet, Sheet, QAfterSortBy> thenByStatus() {
    return addSortByInternal('status', Sort.asc);
  }

  QueryBuilder<Sheet, Sheet, QAfterSortBy> thenByStatusDesc() {
    return addSortByInternal('status', Sort.desc);
  }
}

extension SheetQueryWhereDistinct on QueryBuilder<Sheet, Sheet, QDistinct> {
  QueryBuilder<Sheet, Sheet, QDistinct> distinctByAQuerystringKey(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('aQuerystringKey',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<Sheet, Sheet, QDistinct> distinctByCopyrightUrl(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('copyrightUrl', caseSensitive: caseSensitive);
  }

  QueryBuilder<Sheet, Sheet, QDistinct> distinctByFileId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('fileId', caseSensitive: caseSensitive);
  }

  QueryBuilder<Sheet, Sheet, QDistinct> distinctByFileUrl(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('fileUrl', caseSensitive: caseSensitive);
  }

  QueryBuilder<Sheet, Sheet, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Sheet, Sheet, QDistinct> distinctBySheetName(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('sheetName', caseSensitive: caseSensitive);
  }

  QueryBuilder<Sheet, Sheet, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('status', caseSensitive: caseSensitive);
  }
}

extension SheetQueryProperty on QueryBuilder<Sheet, Sheet, QQueryProperty> {
  QueryBuilder<Sheet, String, QQueryOperations> aQuerystringKeyProperty() {
    return addPropertyNameInternal('aQuerystringKey');
  }

  QueryBuilder<Sheet, List<String>, QQueryOperations> colsProperty() {
    return addPropertyNameInternal('cols');
  }

  QueryBuilder<Sheet, List<String>, QQueryOperations> colsHeaderProperty() {
    return addPropertyNameInternal('colsHeader');
  }

  QueryBuilder<Sheet, String, QQueryOperations> copyrightUrlProperty() {
    return addPropertyNameInternal('copyrightUrl');
  }

  QueryBuilder<Sheet, String, QQueryOperations> fileIdProperty() {
    return addPropertyNameInternal('fileId');
  }

  QueryBuilder<Sheet, String, QQueryOperations> fileUrlProperty() {
    return addPropertyNameInternal('fileUrl');
  }

  QueryBuilder<Sheet, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Sheet, List<String>, QQueryOperations> rowsProperty() {
    return addPropertyNameInternal('rows');
  }

  QueryBuilder<Sheet, String, QQueryOperations> sheetNameProperty() {
    return addPropertyNameInternal('sheetName');
  }

  QueryBuilder<Sheet, String, QQueryOperations> statusProperty() {
    return addPropertyNameInternal('status');
  }
}
