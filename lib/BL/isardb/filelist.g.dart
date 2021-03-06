// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filelist.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings

extension GetFileListCollection on Isar {
  IsarCollection<FileList> get fileLists => getCollection();
}

const FileListSchema = CollectionSchema(
  name: r'FileList',
  schema:
      r'{"name":"FileList","idName":"id","properties":[{"name":"aRowNo","type":"String"},{"name":"aSheetName","type":"String"},{"name":"row","type":"String"},{"name":"viewConfig","type":"String"},{"name":"viewConfigLocal","type":"String"},{"name":"zfileId","type":"String"},{"name":"zfileIdConfig","type":"String"}],"indexes":[],"links":[]}',
  idName: r'id',
  propertyIds: {
    r'aRowNo': 0,
    r'aSheetName': 1,
    r'row': 2,
    r'viewConfig': 3,
    r'viewConfigLocal': 4,
    r'zfileId': 5,
    r'zfileIdConfig': 6
  },
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _fileListGetId,
  setId: _fileListSetId,
  getLinks: _fileListGetLinks,
  attachLinks: _fileListAttachLinks,
  serializeNative: _fileListSerializeNative,
  deserializeNative: _fileListDeserializeNative,
  deserializePropNative: _fileListDeserializePropNative,
  serializeWeb: _fileListSerializeWeb,
  deserializeWeb: _fileListDeserializeWeb,
  deserializePropWeb: _fileListDeserializePropWeb,
  version: 4,
);

int? _fileListGetId(FileList object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _fileListSetId(FileList object, int id) {
  object.id = id;
}

List<IsarLinkBase<dynamic>> _fileListGetLinks(FileList object) {
  return [];
}

void _fileListSerializeNative(
    IsarCollection<FileList> collection,
    IsarCObject cObj,
    FileList object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  final aRowNo$Bytes = IsarBinaryWriter.utf8Encoder.convert(object.aRowNo);
  final aSheetName$Bytes =
      IsarBinaryWriter.utf8Encoder.convert(object.aSheetName);
  final row$Bytes = IsarBinaryWriter.utf8Encoder.convert(object.row);
  final viewConfig$Bytes =
      IsarBinaryWriter.utf8Encoder.convert(object.viewConfig);
  final viewConfigLocal$Bytes =
      IsarBinaryWriter.utf8Encoder.convert(object.viewConfigLocal);
  final zfileId$Bytes = IsarBinaryWriter.utf8Encoder.convert(object.zfileId);
  final zfileIdConfig$Bytes =
      IsarBinaryWriter.utf8Encoder.convert(object.zfileIdConfig);
  final size = (staticSize +
      (aRowNo$Bytes.length) +
      (aSheetName$Bytes.length) +
      (row$Bytes.length) +
      (viewConfig$Bytes.length) +
      (viewConfigLocal$Bytes.length) +
      (zfileId$Bytes.length) +
      (zfileIdConfig$Bytes.length)) as int;
  cObj.buffer = alloc(size);
  cObj.buffer_length = size;

  final buffer = IsarNative.bufAsBytes(cObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeHeader();
  writer.writeBytes(offsets[0], aRowNo$Bytes);
  writer.writeBytes(offsets[1], aSheetName$Bytes);
  writer.writeBytes(offsets[2], row$Bytes);
  writer.writeBytes(offsets[3], viewConfig$Bytes);
  writer.writeBytes(offsets[4], viewConfigLocal$Bytes);
  writer.writeBytes(offsets[5], zfileId$Bytes);
  writer.writeBytes(offsets[6], zfileIdConfig$Bytes);
}

FileList _fileListDeserializeNative(IsarCollection<FileList> collection, int id,
    IsarBinaryReader reader, List<int> offsets) {
  final object = FileList();
  object.aRowNo = reader.readString(offsets[0]);
  object.aSheetName = reader.readString(offsets[1]);
  object.id = id;
  object.row = reader.readString(offsets[2]);
  object.viewConfig = reader.readString(offsets[3]);
  object.viewConfigLocal = reader.readString(offsets[4]);
  object.zfileId = reader.readString(offsets[5]);
  object.zfileIdConfig = reader.readString(offsets[6]);
  return object;
}

P _fileListDeserializePropNative<P>(
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
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Illegal propertyIndex');
  }
}

Object _fileListSerializeWeb(
    IsarCollection<FileList> collection, FileList object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, r'aRowNo', object.aRowNo);
  IsarNative.jsObjectSet(jsObj, r'aSheetName', object.aSheetName);
  IsarNative.jsObjectSet(jsObj, r'id', object.id);
  IsarNative.jsObjectSet(jsObj, r'row', object.row);
  IsarNative.jsObjectSet(jsObj, r'viewConfig', object.viewConfig);
  IsarNative.jsObjectSet(jsObj, r'viewConfigLocal', object.viewConfigLocal);
  IsarNative.jsObjectSet(jsObj, r'zfileId', object.zfileId);
  IsarNative.jsObjectSet(jsObj, r'zfileIdConfig', object.zfileIdConfig);
  return jsObj;
}

FileList _fileListDeserializeWeb(
    IsarCollection<FileList> collection, Object jsObj) {
  final object = FileList();
  object.aRowNo = IsarNative.jsObjectGet(jsObj, r'aRowNo') ?? '';
  object.aSheetName = IsarNative.jsObjectGet(jsObj, r'aSheetName') ?? '';
  object.id =
      IsarNative.jsObjectGet(jsObj, r'id') ?? (double.negativeInfinity as int);
  object.row = IsarNative.jsObjectGet(jsObj, r'row') ?? '';
  object.viewConfig = IsarNative.jsObjectGet(jsObj, r'viewConfig') ?? '';
  object.viewConfigLocal =
      IsarNative.jsObjectGet(jsObj, r'viewConfigLocal') ?? '';
  object.zfileId = IsarNative.jsObjectGet(jsObj, r'zfileId') ?? '';
  object.zfileIdConfig = IsarNative.jsObjectGet(jsObj, r'zfileIdConfig') ?? '';
  return object;
}

P _fileListDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case r'aRowNo':
      return (IsarNative.jsObjectGet(jsObj, r'aRowNo') ?? '') as P;
    case r'aSheetName':
      return (IsarNative.jsObjectGet(jsObj, r'aSheetName') ?? '') as P;
    case r'id':
      return (IsarNative.jsObjectGet(jsObj, r'id') ??
          (double.negativeInfinity as int)) as P;
    case r'row':
      return (IsarNative.jsObjectGet(jsObj, r'row') ?? '') as P;
    case r'viewConfig':
      return (IsarNative.jsObjectGet(jsObj, r'viewConfig') ?? '') as P;
    case r'viewConfigLocal':
      return (IsarNative.jsObjectGet(jsObj, r'viewConfigLocal') ?? '') as P;
    case r'zfileId':
      return (IsarNative.jsObjectGet(jsObj, r'zfileId') ?? '') as P;
    case r'zfileIdConfig':
      return (IsarNative.jsObjectGet(jsObj, r'zfileIdConfig') ?? '') as P;
    default:
      throw IsarError('Illegal propertyName');
  }
}

void _fileListAttachLinks(
    IsarCollection<dynamic> col, int id, FileList object) {}

extension FileListQueryWhereSort on QueryBuilder<FileList, FileList, QWhere> {
  QueryBuilder<FileList, FileList, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension FileListQueryWhere on QueryBuilder<FileList, FileList, QWhereClause> {
  QueryBuilder<FileList, FileList, QAfterWhereClause> idEqualTo(int id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<FileList, FileList, QAfterWhereClause> idNotEqualTo(int id) {
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

  QueryBuilder<FileList, FileList, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<FileList, FileList, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<FileList, FileList, QAfterWhereClause> idBetween(
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

extension FileListQueryFilter
    on QueryBuilder<FileList, FileList, QFilterCondition> {
  QueryBuilder<FileList, FileList, QAfterFilterCondition> aRowNoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'aRowNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FileList, FileList, QAfterFilterCondition> aRowNoGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'aRowNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FileList, FileList, QAfterFilterCondition> aRowNoLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'aRowNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FileList, FileList, QAfterFilterCondition> aRowNoBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
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
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FileList, FileList, QAfterFilterCondition> aRowNoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'aRowNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FileList, FileList, QAfterFilterCondition> aRowNoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'aRowNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FileList, FileList, QAfterFilterCondition> aRowNoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'aRowNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FileList, FileList, QAfterFilterCondition> aRowNoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'aRowNo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FileList, FileList, QAfterFilterCondition> aSheetNameEqualTo(
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

  QueryBuilder<FileList, FileList, QAfterFilterCondition> aSheetNameGreaterThan(
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

  QueryBuilder<FileList, FileList, QAfterFilterCondition> aSheetNameLessThan(
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

  QueryBuilder<FileList, FileList, QAfterFilterCondition> aSheetNameBetween(
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

  QueryBuilder<FileList, FileList, QAfterFilterCondition> aSheetNameStartsWith(
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

  QueryBuilder<FileList, FileList, QAfterFilterCondition> aSheetNameEndsWith(
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

  QueryBuilder<FileList, FileList, QAfterFilterCondition> aSheetNameContains(
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

  QueryBuilder<FileList, FileList, QAfterFilterCondition> aSheetNameMatches(
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

  QueryBuilder<FileList, FileList, QAfterFilterCondition> idEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FileList, FileList, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<FileList, FileList, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<FileList, FileList, QAfterFilterCondition> idBetween(
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

  QueryBuilder<FileList, FileList, QAfterFilterCondition> rowEqualTo(
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

  QueryBuilder<FileList, FileList, QAfterFilterCondition> rowGreaterThan(
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

  QueryBuilder<FileList, FileList, QAfterFilterCondition> rowLessThan(
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

  QueryBuilder<FileList, FileList, QAfterFilterCondition> rowBetween(
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

  QueryBuilder<FileList, FileList, QAfterFilterCondition> rowStartsWith(
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

  QueryBuilder<FileList, FileList, QAfterFilterCondition> rowEndsWith(
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

  QueryBuilder<FileList, FileList, QAfterFilterCondition> rowContains(
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

  QueryBuilder<FileList, FileList, QAfterFilterCondition> rowMatches(
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

  QueryBuilder<FileList, FileList, QAfterFilterCondition> viewConfigEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'viewConfig',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FileList, FileList, QAfterFilterCondition> viewConfigGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'viewConfig',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FileList, FileList, QAfterFilterCondition> viewConfigLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'viewConfig',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FileList, FileList, QAfterFilterCondition> viewConfigBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'viewConfig',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FileList, FileList, QAfterFilterCondition> viewConfigStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'viewConfig',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FileList, FileList, QAfterFilterCondition> viewConfigEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'viewConfig',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FileList, FileList, QAfterFilterCondition> viewConfigContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'viewConfig',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FileList, FileList, QAfterFilterCondition> viewConfigMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'viewConfig',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FileList, FileList, QAfterFilterCondition>
      viewConfigLocalEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'viewConfigLocal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FileList, FileList, QAfterFilterCondition>
      viewConfigLocalGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'viewConfigLocal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FileList, FileList, QAfterFilterCondition>
      viewConfigLocalLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'viewConfigLocal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FileList, FileList, QAfterFilterCondition>
      viewConfigLocalBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'viewConfigLocal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FileList, FileList, QAfterFilterCondition>
      viewConfigLocalStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'viewConfigLocal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FileList, FileList, QAfterFilterCondition>
      viewConfigLocalEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'viewConfigLocal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FileList, FileList, QAfterFilterCondition>
      viewConfigLocalContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'viewConfigLocal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FileList, FileList, QAfterFilterCondition>
      viewConfigLocalMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'viewConfigLocal',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FileList, FileList, QAfterFilterCondition> zfileIdEqualTo(
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

  QueryBuilder<FileList, FileList, QAfterFilterCondition> zfileIdGreaterThan(
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

  QueryBuilder<FileList, FileList, QAfterFilterCondition> zfileIdLessThan(
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

  QueryBuilder<FileList, FileList, QAfterFilterCondition> zfileIdBetween(
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

  QueryBuilder<FileList, FileList, QAfterFilterCondition> zfileIdStartsWith(
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

  QueryBuilder<FileList, FileList, QAfterFilterCondition> zfileIdEndsWith(
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

  QueryBuilder<FileList, FileList, QAfterFilterCondition> zfileIdContains(
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

  QueryBuilder<FileList, FileList, QAfterFilterCondition> zfileIdMatches(
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

  QueryBuilder<FileList, FileList, QAfterFilterCondition> zfileIdConfigEqualTo(
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

  QueryBuilder<FileList, FileList, QAfterFilterCondition>
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

  QueryBuilder<FileList, FileList, QAfterFilterCondition> zfileIdConfigLessThan(
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

  QueryBuilder<FileList, FileList, QAfterFilterCondition> zfileIdConfigBetween(
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

  QueryBuilder<FileList, FileList, QAfterFilterCondition>
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

  QueryBuilder<FileList, FileList, QAfterFilterCondition> zfileIdConfigEndsWith(
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

  QueryBuilder<FileList, FileList, QAfterFilterCondition> zfileIdConfigContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'zfileIdConfig',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FileList, FileList, QAfterFilterCondition> zfileIdConfigMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'zfileIdConfig',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }
}

extension FileListQueryLinks
    on QueryBuilder<FileList, FileList, QFilterCondition> {}

extension FileListQueryWhereSortBy
    on QueryBuilder<FileList, FileList, QSortBy> {
  QueryBuilder<FileList, FileList, QAfterSortBy> sortByARowNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aRowNo', Sort.asc);
    });
  }

  QueryBuilder<FileList, FileList, QAfterSortBy> sortByARowNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aRowNo', Sort.desc);
    });
  }

  QueryBuilder<FileList, FileList, QAfterSortBy> sortByASheetName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aSheetName', Sort.asc);
    });
  }

  QueryBuilder<FileList, FileList, QAfterSortBy> sortByASheetNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aSheetName', Sort.desc);
    });
  }

  QueryBuilder<FileList, FileList, QAfterSortBy> sortByRow() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'row', Sort.asc);
    });
  }

  QueryBuilder<FileList, FileList, QAfterSortBy> sortByRowDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'row', Sort.desc);
    });
  }

  QueryBuilder<FileList, FileList, QAfterSortBy> sortByViewConfig() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'viewConfig', Sort.asc);
    });
  }

  QueryBuilder<FileList, FileList, QAfterSortBy> sortByViewConfigDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'viewConfig', Sort.desc);
    });
  }

  QueryBuilder<FileList, FileList, QAfterSortBy> sortByViewConfigLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'viewConfigLocal', Sort.asc);
    });
  }

  QueryBuilder<FileList, FileList, QAfterSortBy> sortByViewConfigLocalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'viewConfigLocal', Sort.desc);
    });
  }

  QueryBuilder<FileList, FileList, QAfterSortBy> sortByZfileId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'zfileId', Sort.asc);
    });
  }

  QueryBuilder<FileList, FileList, QAfterSortBy> sortByZfileIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'zfileId', Sort.desc);
    });
  }

  QueryBuilder<FileList, FileList, QAfterSortBy> sortByZfileIdConfig() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'zfileIdConfig', Sort.asc);
    });
  }

  QueryBuilder<FileList, FileList, QAfterSortBy> sortByZfileIdConfigDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'zfileIdConfig', Sort.desc);
    });
  }
}

extension FileListQueryWhereSortThenBy
    on QueryBuilder<FileList, FileList, QSortThenBy> {
  QueryBuilder<FileList, FileList, QAfterSortBy> thenByARowNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aRowNo', Sort.asc);
    });
  }

  QueryBuilder<FileList, FileList, QAfterSortBy> thenByARowNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aRowNo', Sort.desc);
    });
  }

  QueryBuilder<FileList, FileList, QAfterSortBy> thenByASheetName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aSheetName', Sort.asc);
    });
  }

  QueryBuilder<FileList, FileList, QAfterSortBy> thenByASheetNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aSheetName', Sort.desc);
    });
  }

  QueryBuilder<FileList, FileList, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<FileList, FileList, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<FileList, FileList, QAfterSortBy> thenByRow() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'row', Sort.asc);
    });
  }

  QueryBuilder<FileList, FileList, QAfterSortBy> thenByRowDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'row', Sort.desc);
    });
  }

  QueryBuilder<FileList, FileList, QAfterSortBy> thenByViewConfig() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'viewConfig', Sort.asc);
    });
  }

  QueryBuilder<FileList, FileList, QAfterSortBy> thenByViewConfigDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'viewConfig', Sort.desc);
    });
  }

  QueryBuilder<FileList, FileList, QAfterSortBy> thenByViewConfigLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'viewConfigLocal', Sort.asc);
    });
  }

  QueryBuilder<FileList, FileList, QAfterSortBy> thenByViewConfigLocalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'viewConfigLocal', Sort.desc);
    });
  }

  QueryBuilder<FileList, FileList, QAfterSortBy> thenByZfileId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'zfileId', Sort.asc);
    });
  }

  QueryBuilder<FileList, FileList, QAfterSortBy> thenByZfileIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'zfileId', Sort.desc);
    });
  }

  QueryBuilder<FileList, FileList, QAfterSortBy> thenByZfileIdConfig() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'zfileIdConfig', Sort.asc);
    });
  }

  QueryBuilder<FileList, FileList, QAfterSortBy> thenByZfileIdConfigDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'zfileIdConfig', Sort.desc);
    });
  }
}

extension FileListQueryWhereDistinct
    on QueryBuilder<FileList, FileList, QDistinct> {
  QueryBuilder<FileList, FileList, QDistinct> distinctByARowNo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'aRowNo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FileList, FileList, QDistinct> distinctByASheetName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'aSheetName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FileList, FileList, QDistinct> distinctByRow(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'row', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FileList, FileList, QDistinct> distinctByViewConfig(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'viewConfig', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FileList, FileList, QDistinct> distinctByViewConfigLocal(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'viewConfigLocal',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FileList, FileList, QDistinct> distinctByZfileId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'zfileId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FileList, FileList, QDistinct> distinctByZfileIdConfig(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'zfileIdConfig',
          caseSensitive: caseSensitive);
    });
  }
}

extension FileListQueryProperty
    on QueryBuilder<FileList, FileList, QQueryProperty> {
  QueryBuilder<FileList, String, QQueryOperations> aRowNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'aRowNo');
    });
  }

  QueryBuilder<FileList, String, QQueryOperations> aSheetNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'aSheetName');
    });
  }

  QueryBuilder<FileList, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<FileList, String, QQueryOperations> rowProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'row');
    });
  }

  QueryBuilder<FileList, String, QQueryOperations> viewConfigProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'viewConfig');
    });
  }

  QueryBuilder<FileList, String, QQueryOperations> viewConfigLocalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'viewConfigLocal');
    });
  }

  QueryBuilder<FileList, String, QQueryOperations> zfileIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'zfileId');
    });
  }

  QueryBuilder<FileList, String, QQueryOperations> zfileIdConfigProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'zfileIdConfig');
    });
  }
}
