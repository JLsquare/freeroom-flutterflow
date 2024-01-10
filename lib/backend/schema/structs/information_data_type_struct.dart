// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InformationDataTypeStruct extends FFFirebaseStruct {
  InformationDataTypeStruct({
    String? information,
    DateTime? timestamp,
    String? authorUid,
    bool? removed,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _information = information,
        _timestamp = timestamp,
        _authorUid = authorUid,
        _removed = removed,
        super(firestoreUtilData);

  // "information" field.
  String? _information;
  String get information => _information ?? '';
  set information(String? val) => _information = val;
  bool hasInformation() => _information != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  set timestamp(DateTime? val) => _timestamp = val;
  bool hasTimestamp() => _timestamp != null;

  // "author_uid" field.
  String? _authorUid;
  String get authorUid => _authorUid ?? '';
  set authorUid(String? val) => _authorUid = val;
  bool hasAuthorUid() => _authorUid != null;

  // "removed" field.
  bool? _removed;
  bool get removed => _removed ?? false;
  set removed(bool? val) => _removed = val;
  bool hasRemoved() => _removed != null;

  static InformationDataTypeStruct fromMap(Map<String, dynamic> data) =>
      InformationDataTypeStruct(
        information: data['information'] as String?,
        timestamp: data['timestamp'] as DateTime?,
        authorUid: data['author_uid'] as String?,
        removed: data['removed'] as bool?,
      );

  static InformationDataTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? InformationDataTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'information': _information,
        'timestamp': _timestamp,
        'author_uid': _authorUid,
        'removed': _removed,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'information': serializeParam(
          _information,
          ParamType.String,
        ),
        'timestamp': serializeParam(
          _timestamp,
          ParamType.DateTime,
        ),
        'author_uid': serializeParam(
          _authorUid,
          ParamType.String,
        ),
        'removed': serializeParam(
          _removed,
          ParamType.bool,
        ),
      }.withoutNulls;

  static InformationDataTypeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      InformationDataTypeStruct(
        information: deserializeParam(
          data['information'],
          ParamType.String,
          false,
        ),
        timestamp: deserializeParam(
          data['timestamp'],
          ParamType.DateTime,
          false,
        ),
        authorUid: deserializeParam(
          data['author_uid'],
          ParamType.String,
          false,
        ),
        removed: deserializeParam(
          data['removed'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'InformationDataTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is InformationDataTypeStruct &&
        information == other.information &&
        timestamp == other.timestamp &&
        authorUid == other.authorUid &&
        removed == other.removed;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([information, timestamp, authorUid, removed]);
}

InformationDataTypeStruct createInformationDataTypeStruct({
  String? information,
  DateTime? timestamp,
  String? authorUid,
  bool? removed,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    InformationDataTypeStruct(
      information: information,
      timestamp: timestamp,
      authorUid: authorUid,
      removed: removed,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

InformationDataTypeStruct? updateInformationDataTypeStruct(
  InformationDataTypeStruct? informationDataType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    informationDataType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addInformationDataTypeStructData(
  Map<String, dynamic> firestoreData,
  InformationDataTypeStruct? informationDataType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (informationDataType == null) {
    return;
  }
  if (informationDataType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && informationDataType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final informationDataTypeData =
      getInformationDataTypeFirestoreData(informationDataType, forFieldValue);
  final nestedData =
      informationDataTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      informationDataType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getInformationDataTypeFirestoreData(
  InformationDataTypeStruct? informationDataType, [
  bool forFieldValue = false,
]) {
  if (informationDataType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(informationDataType.toMap());

  // Add any Firestore field values
  informationDataType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getInformationDataTypeListFirestoreData(
  List<InformationDataTypeStruct>? informationDataTypes,
) =>
    informationDataTypes
        ?.map((e) => getInformationDataTypeFirestoreData(e, true))
        .toList() ??
    [];
