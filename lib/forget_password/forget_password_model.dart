import '/flutter_flow/flutter_flow_util.dart';
import 'forget_password_widget.dart' show ForgetPasswordWidget;
import 'package:flutter/material.dart';

class ForgetPasswordModel extends FlutterFlowModel<ForgetPasswordWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for emailAddress_forget widget.
  FocusNode? emailAddressForgetFocusNode;
  TextEditingController? emailAddressForgetController;
  String? Function(BuildContext, String?)?
      emailAddressForgetControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    emailAddressForgetFocusNode?.dispose();
    emailAddressForgetController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
