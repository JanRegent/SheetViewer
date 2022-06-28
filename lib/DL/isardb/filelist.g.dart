// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filelist.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetFileListCollection on Isar {
  IsarCollection<FileList> get fileLists => getCollection();
}

const FileListSchema = CollectionSchema(
  name: 'FileList',
  schema:
      '{"name":"FileList","idName":"id","properties":[{"name":"aRowNo","type":"String"},{"name":"aSheetName","type":"String"},{"name":"row","type":"String"},{"name":"zfileId","type":"String"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {'aRowNo': 0, 'aSheetName': 1, 'row': 2, 'zfileId': 3},
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
  version: 3,
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

List<IsarLinkBase> _fileListGetLinks(FileList object) {
  return [];
}

void _fileListSerializeNative(
    IsarCollection<FileList> collection,
    IsarRawObject rawObj,
    FileList object,
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

FileList _fileListDeserializeNative(IsarCollection<FileList> collection, int id,
    IsarBinaryReader reader, List<int> offsets) {
  final object = FileList();
  object.aRowNo = reader.readString(offsets[0]);
  object.aSheetName = reader.readString(offsets[1]);
  object.id = id;
  object.row = reader.readString(offsets[2]);
  object.zfileId = reader.readString(offsets[3]);
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
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _fileListSerializeWeb(
    IsarCollection<FileList> collection, FileList object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'aRowNo', object.aRowNo);
  IsarNative.jsObjectSet(jsObj, 'aSheetName', object.aSheetName);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'row', object.row);
  IsarNative.jsObjectSet(jsObj, 'zfileId', object.zfileId);
  return jsObj;
}

FileList _fileListDeserializeWeb(
    IsarCollection<FileList> collection, dynamic jsObj) {
  final object = FileList();
  object.aRowNo = IsarNative.jsObjectGet(jsObj, 'aRowNo') ?? '';
  object.aSheetName = IsarNative.jsObjectGet(jsObj, 'aSheetName') ?? '';
  object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
  object.row = IsarNative.jsObjectGet(jsObj, 'row') ?? '';
  object.zfileId = IsarNative.jsObjectGet(jsObj, 'zfileId') ?? '';
  return object;
}

P _fileListDeserializePropWeb<P>(Object jsObj, String propertyName) {
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

void _fileListAttachLinks(IsarCollection col, int id, FileList object) {}

extension FileListQueryWhereSort on QueryBuilder<FileList, FileList, QWhere> {
  QueryBuilder<FileList, FileList, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension FileListQueryWhere on QueryBuilder<FileList, FileList, QWhereClause> {
  QueryBuilder<FileList, FileList, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<FileList, FileList, QAfterWhereClause> idNotEqualTo(int id) {
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

  QueryBuilder<FileList, FileList, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<FileList, FileList, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<FileList, FileList, QAfterWhereClause> idBetween(
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

extension FileListQueryFilter
    on QueryBuilder<FileList, FileList, QFilterCondition> {
  QueryBuilder<FileList, FileList, QAfterFilterCondition> aRowNoEqualTo(
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

  QueryBuilder<FileList, FileList, QAfterFilterCondition> aRowNoGreaterThan(
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

  QueryBuilder<FileList, FileList, QAfterFilterCondition> aRowNoLessThan(
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

  QueryBuilder<FileList, FileList, QAfterFilterCondition> aRowNoBetween(
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

  QueryBuilder<FileList, FileList, QAfterFilterCondition> aRowNoStartsWith(
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

  QueryBuilder<FileList, FileList, QAfterFilterCondition> aRowNoEndsWith(
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

  QueryBuilder<FileList, FileList, QAfterFilterCondition> aRowNoContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'aRowNo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<FileList, FileList, QAfterFilterCondition> aRowNoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'aRowNo',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<FileList, FileList, QAfterFilterCondition> aSheetNameEqualTo(
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

  QueryBuilder<FileList, FileList, QAfterFilterCondition> aSheetNameGreaterThan(
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

  QueryBuilder<FileList, FileList, QAfterFilterCondition> aSheetNameLessThan(
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

  QueryBuilder<FileList, FileList, QAfterFilterCondition> aSheetNameBetween(
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

  QueryBuilder<FileList, FileList, QAfterFilterCondition> aSheetNameStartsWith(
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

  QueryBuilder<FileList, FileList, QAfterFilterCondition> aSheetNameEndsWith(
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

  QueryBuilder<FileList, FileList, QAfterFilterCondition> aSheetNameContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'aSheetName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<FileList, FileList, QAfterFilterCondition> aSheetNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'aSheetName',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<FileList, FileList, QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<FileList, FileList, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<FileList, FileList, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<FileList, FileList, QAfterFilterCondition> idBetween(
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

  QueryBuilder<FileList, FileList, QAfterFilterCondition> rowEqualTo(
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

  QueryBuilder<FileList, FileList, QAfterFilterCondition> rowGreaterThan(
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

  QueryBuilder<FileList, FileList, QAfterFilterCondition> rowLessThan(
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

  QueryBuilder<FileList, FileList, QAfterFilterCondition> rowBetween(
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

  QueryBuilder<FileList, FileList, QAfterFilterCondition> rowStartsWith(
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

  QueryBuilder<FileList, FileList, QAfterFilterCondition> rowEndsWith(
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

  QueryBuilder<FileList, FileList, QAfterFilterCondition> rowContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'row',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<FileList, FileList, QAfterFilterCondition> rowMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'row',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<FileList, FileList, QAfterFilterCondition> zfileIdEqualTo(
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

  QueryBuilder<FileList, FileList, QAfterFilterCondition> zfileIdGreaterThan(
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

  QueryBuilder<FileList, FileList, QAfterFilterCondition> zfileIdLessThan(
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

  QueryBuilder<FileList, FileList, QAfterFilterCondition> zfileIdBetween(
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

  QueryBuilder<FileList, FileList, QAfterFilterCondition> zfileIdStartsWith(
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

  QueryBuilder<FileList, FileList, QAfterFilterCondition> zfileIdEndsWith(
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

  QueryBuilder<FileList, FileList, QAfterFilterCondition> zfileIdContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'zfileId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<FileList, FileList, QAfterFilterCondition> zfileIdMatches(
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

extension FileListQueryLinks
    on QueryBuilder<FileList, FileList, QFilterCondition> {}

extension FileListQueryWhereSortBy
    on QueryBuilder<FileList, FileList, QSortBy> {
  QueryBuilder<FileList, FileList, QAfterSortBy> sortByARowNo() {
    return addSortByInternal('aRowNo', Sort.asc);
  }

  QueryBuilder<FileList, FileList, QAfterSortBy> sortByARowNoDesc() {
    return addSortByInternal('aRowNo', Sort.desc);
  }

  QueryBuilder<FileList, FileList, QAfterSortBy> sortByASheetName() {
    return addSortByInternal('aSheetName', Sort.asc);
  }

  QueryBuilder<FileList, FileList, QAfterSortBy> sortByASheetNameDesc() {
    return addSortByInternal('aSheetName', Sort.desc);
  }

  QueryBuilder<FileList, FileList, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<FileList, FileList, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<FileList, FileList, QAfterSortBy> sortByRow() {
    return addSortByInternal('row', Sort.asc);
  }

  QueryBuilder<FileList, FileList, QAfterSortBy> sortByRowDesc() {
    return addSortByInternal('row', Sort.desc);
  }

  QueryBuilder<FileList, FileList, QAfterSortBy> sortByZfileId() {
    return addSortByInternal('zfileId', Sort.asc);
  }

  QueryBuilder<FileList, FileList, QAfterSortBy> sortByZfileIdDesc() {
    return addSortByInternal('zfileId', Sort.desc);
  }
}

extension FileListQueryWhereSortThenBy
    on QueryBuilder<FileList, FileList, QSortThenBy> {
  QueryBuilder<FileList, FileList, QAfterSortBy> thenByARowNo() {
    return addSortByInternal('aRowNo', Sort.asc);
  }

  QueryBuilder<FileList, FileList, QAfterSortBy> thenByARowNoDesc() {
    return addSortByInternal('aRowNo', Sort.desc);
  }

  QueryBuilder<FileList, FileList, QAfterSortBy> thenByASheetName() {
    return addSortByInternal('aSheetName', Sort.asc);
  }

  QueryBuilder<FileList, FileList, QAfterSortBy> thenByASheetNameDesc() {
    return addSortByInternal('aSheetName', Sort.desc);
  }

  QueryBuilder<FileList, FileList, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<FileList, FileList, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<FileList, FileList, QAfterSortBy> thenByRow() {
    return addSortByInternal('row', Sort.asc);
  }

  QueryBuilder<FileList, FileList, QAfterSortBy> thenByRowDesc() {
    return addSortByInternal('row', Sort.desc);
  }

  QueryBuilder<FileList, FileList, QAfterSortBy> thenByZfileId() {
    return addSortByInternal('zfileId', Sort.asc);
  }

  QueryBuilder<FileList, FileList, QAfterSortBy> thenByZfileIdDesc() {
    return addSortByInternal('zfileId', Sort.desc);
  }
}

extension FileListQueryWhereDistinct
    on QueryBuilder<FileList, FileList, QDistinct> {
  QueryBuilder<FileList, FileList, QDistinct> distinctByARowNo(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('aRowNo', caseSensitive: caseSensitive);
  }

  QueryBuilder<FileList, FileList, QDistinct> distinctByASheetName(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('aSheetName', caseSensitive: caseSensitive);
  }

  QueryBuilder<FileList, FileList, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<FileList, FileList, QDistinct> distinctByRow(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('row', caseSensitive: caseSensitive);
  }

  QueryBuilder<FileList, FileList, QDistinct> distinctByZfileId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('zfileId', caseSensitive: caseSensitive);
  }
}

extension FileListQueryProperty
    on QueryBuilder<FileList, FileList, QQueryProperty> {
  QueryBuilder<FileList, String, QQueryOperations> aRowNoProperty() {
    return addPropertyNameInternal('aRowNo');
  }

  QueryBuilder<FileList, String, QQueryOperations> aSheetNameProperty() {
    return addPropertyNameInternal('aSheetName');
  }

  QueryBuilder<FileList, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<FileList, String, QQueryOperations> rowProperty() {
    return addPropertyNameInternal('row');
  }

  QueryBuilder<FileList, String, QQueryOperations> zfileIdProperty() {
    return addPropertyNameInternal('zfileId');
  }
}
