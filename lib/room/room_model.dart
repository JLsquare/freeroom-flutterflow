import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'room_widget.dart' show RoomWidget;
import 'package:flutter/material.dart';

class RoomModel extends FlutterFlowModel<RoomWidget> {
  ///  Local state fields for this page.

  String status = '';

  String duration = '';

  List<InformationDataTypeStruct> informations = [];
  void addToInformations(InformationDataTypeStruct item) =>
      informations.add(item);
  void removeFromInformations(InformationDataTypeStruct item) =>
      informations.remove(item);
  void removeAtIndexFromInformations(int index) => informations.removeAt(index);
  void insertAtIndexInInformations(int index, InformationDataTypeStruct item) =>
      informations.insert(index, item);
  void updateInformationsAtIndex(
          int index, Function(InformationDataTypeStruct) updateFn) =>
      informations[index] = updateFn(informations[index]);

  String oldName = '';

  bool open = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (FreeRoomApiLite)] action in Room widget.
  ApiCallResponse? freeRoomApiResult;
  // Stores action output result for [Firestore Query - Query a collection] action in Room widget.
  RoomsRecord? firebaseResult;
  // State field(s) for guestInputField widget.
  FocusNode? guestInputFieldFocusNode;
  TextEditingController? guestInputFieldController;
  String? Function(BuildContext, String?)? guestInputFieldControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    guestInputFieldFocusNode?.dispose();
    guestInputFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
