import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class RoomsRecord extends FirestoreRecord {
  RoomsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "room_name" field.
  String? _roomName;
  String get roomName => _roomName ?? '';
  bool hasRoomName() => _roomName != null;

  // "informations" field.
  List<InformationDataTypeStruct>? _informations;
  List<InformationDataTypeStruct> get informations => _informations ?? const [];
  bool hasInformations() => _informations != null;

  void _initializeFields() {
    _roomName = snapshotData['room_name'] as String?;
    _informations = getStructList(
      snapshotData['informations'],
      InformationDataTypeStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Rooms');

  static Stream<RoomsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RoomsRecord.fromSnapshot(s));

  static Future<RoomsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RoomsRecord.fromSnapshot(s));

  static RoomsRecord fromSnapshot(DocumentSnapshot snapshot) => RoomsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RoomsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RoomsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RoomsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RoomsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRoomsRecordData({
  String? roomName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'room_name': roomName,
    }.withoutNulls,
  );

  return firestoreData;
}

class RoomsRecordDocumentEquality implements Equality<RoomsRecord> {
  const RoomsRecordDocumentEquality();

  @override
  bool equals(RoomsRecord? e1, RoomsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.roomName == e2?.roomName &&
        listEquality.equals(e1?.informations, e2?.informations);
  }

  @override
  int hash(RoomsRecord? e) =>
      const ListEquality().hash([e?.roomName, e?.informations]);

  @override
  bool isValidKey(Object? o) => o is RoomsRecord;
}
