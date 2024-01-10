// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RoomDataTypeStruct extends FFFirebaseStruct {
  RoomDataTypeStruct({
    String? name,
    String? status,
    int? duration,
    bool? open,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _status = status,
        _duration = duration,
        _open = open,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;
  bool hasStatus() => _status != null;

  // "duration" field.
  int? _duration;
  int get duration => _duration ?? 0;
  set duration(int? val) => _duration = val;
  void incrementDuration(int amount) => _duration = duration + amount;
  bool hasDuration() => _duration != null;

  // "open" field.
  bool? _open;
  bool get open => _open ?? false;
  set open(bool? val) => _open = val;
  bool hasOpen() => _open != null;

  static RoomDataTypeStruct fromMap(Map<String, dynamic> data) =>
      RoomDataTypeStruct(
        name: data['name'] as String?,
        status: data['status'] as String?,
        duration: castToType<int>(data['duration']),
        open: data['open'] as bool?,
      );

  static RoomDataTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? RoomDataTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'status': _status,
        'duration': _duration,
        'open': _open,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'duration': serializeParam(
          _duration,
          ParamType.int,
        ),
        'open': serializeParam(
          _open,
          ParamType.bool,
        ),
      }.withoutNulls;

  static RoomDataTypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      RoomDataTypeStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        duration: deserializeParam(
          data['duration'],
          ParamType.int,
          false,
        ),
        open: deserializeParam(
          data['open'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'RoomDataTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RoomDataTypeStruct &&
        name == other.name &&
        status == other.status &&
        duration == other.duration &&
        open == other.open;
  }

  @override
  int get hashCode => const ListEquality().hash([name, status, duration, open]);
}

RoomDataTypeStruct createRoomDataTypeStruct({
  String? name,
  String? status,
  int? duration,
  bool? open,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RoomDataTypeStruct(
      name: name,
      status: status,
      duration: duration,
      open: open,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

RoomDataTypeStruct? updateRoomDataTypeStruct(
  RoomDataTypeStruct? roomDataType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    roomDataType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addRoomDataTypeStructData(
  Map<String, dynamic> firestoreData,
  RoomDataTypeStruct? roomDataType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (roomDataType == null) {
    return;
  }
  if (roomDataType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && roomDataType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final roomDataTypeData =
      getRoomDataTypeFirestoreData(roomDataType, forFieldValue);
  final nestedData =
      roomDataTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = roomDataType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getRoomDataTypeFirestoreData(
  RoomDataTypeStruct? roomDataType, [
  bool forFieldValue = false,
]) {
  if (roomDataType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(roomDataType.toMap());

  // Add any Firestore field values
  roomDataType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRoomDataTypeListFirestoreData(
  List<RoomDataTypeStruct>? roomDataTypes,
) =>
    roomDataTypes?.map((e) => getRoomDataTypeFirestoreData(e, true)).toList() ??
    [];
