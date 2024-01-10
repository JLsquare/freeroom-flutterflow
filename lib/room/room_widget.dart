import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'room_model.dart';
export 'room_model.dart';

class RoomWidget extends StatefulWidget {
  const RoomWidget({
    super.key,
    required this.roomName,
  });

  final String? roomName;

  @override
  _RoomWidgetState createState() => _RoomWidgetState();
}

class _RoomWidgetState extends State<RoomWidget> {
  late RoomModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RoomModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.oldName = widget.roomName!;
      });
      _model.freeRoomApiResult = await FreeRoomApiLiteCall.call();
      if ((_model.freeRoomApiResult?.succeeded ?? true)) {
        setState(() {
          _model.status = ((_model.freeRoomApiResult?.jsonBody ?? '')
                  .toList()
                  .map<RoomDataTypeStruct?>(RoomDataTypeStruct.maybeFromMap)
                  .toList() as Iterable<RoomDataTypeStruct?>)
              .withoutNulls
              .where((e) => widget.roomName == e.name)
              .toList()
              .first
              .status;
          _model.duration = functions.formatDuration(
              ((_model.freeRoomApiResult?.jsonBody ?? '')
                      .toList()
                      .map<RoomDataTypeStruct?>(RoomDataTypeStruct.maybeFromMap)
                      .toList() as Iterable<RoomDataTypeStruct?>)
                  .withoutNulls
                  .where((e) => widget.roomName == e.name)
                  .toList()
                  .first
                  .duration);
          _model.open = ((_model.freeRoomApiResult?.jsonBody ?? '')
                  .toList()
                  .map<RoomDataTypeStruct?>(RoomDataTypeStruct.maybeFromMap)
                  .toList() as Iterable<RoomDataTypeStruct?>)
              .withoutNulls
              .where((e) => e.name == widget.roomName)
              .toList()
              .first
              .open;
        });
        _model.firebaseResult = await queryRoomsRecordOnce(
          queryBuilder: (roomsRecord) => roomsRecord.where(
            'room_name',
            isEqualTo: widget.roomName,
          ),
          singleRecord: true,
        ).then((s) => s.firstOrNull);
        setState(() {
          _model.informations = _model.firebaseResult!.informations
              .where((e) =>
                  e.timestamp! >
                  dateTimeFromSecondsSinceEpoch(
                      getCurrentTimestamp.secondsSinceEpoch - (3600 * 12)))
              .toList()
              .toList()
              .cast<InformationDataTypeStruct>();
        });
      }
      while (widget.roomName == _model.oldName) {
        await Future.delayed(const Duration(milliseconds: 100));
      }

      context.pushNamed(
        'Room',
        pathParameters: {
          'roomName': serializeParam(
            widget.roomName,
            ParamType.String,
          ),
        }.withoutNulls,
      );
    });

    _model.guestInputFieldController ??= TextEditingController();
    _model.guestInputFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(-1.0, -1.0),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(12.0, 32.0, 96.0, 32.0),
                  child: Container(
                    width: double.infinity,
                    height: 128.0,
                    constraints: const BoxConstraints(
                      maxWidth: 480.0,
                    ),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Align(
                      alignment: const AlignmentDirectional(0.0, -1.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: Text(
                          'IUT Free Room',
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context).displaySmall,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(12.0, 107.0, 12.0, 12.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 4.0,
                        color: Color(0x33000000),
                        offset: Offset(0.0, 2.0),
                      )
                    ],
                    borderRadius: BorderRadius.circular(16.0),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      width: 2.0,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, -1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.roomName,
                                  'No Room Name',
                                ),
                                style:
                                    FlutterFlowTheme.of(context).headlineMedium,
                              ),
                            ),
                          ),
                          Text(
                            '${_model.status} and ${(bool open) {
                              return open ? "open" : "closed";
                            }(_model.open)} : ${_model.duration}',
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Manrope',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                          ),
                          const Spacer(),
                          Text(
                            'Informations :',
                            style: FlutterFlowTheme.of(context).headlineMedium,
                          ),
                          Container(
                            constraints: const BoxConstraints(
                              maxHeight: 384.0,
                            ),
                            decoration: const BoxDecoration(),
                            child: Builder(
                              builder: (context) {
                                final information =
                                    _model.informations.toList();
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: information.length,
                                  itemBuilder: (context, informationIndex) {
                                    final informationItem =
                                        information[informationIndex];
                                    return Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 20.0,
                                          borderWidth: 1.0,
                                          buttonSize: 40.0,
                                          icon: const Icon(
                                            Icons.add,
                                            color: Colors.transparent,
                                            size: 24.0,
                                          ),
                                          onPressed: () {
                                            print('IconButton pressed ...');
                                          },
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              '${informationItem.information} - ${dateTimeFormat('Hm', informationItem.timestamp)}',
                                              textAlign: TextAlign.end,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(1.0, 0.0),
                                          child: FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 30.0,
                                            buttonSize: 40.0,
                                            icon: Icon(
                                              Icons.delete,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 24.0,
                                            ),
                                            onPressed: () async {
                                              if (informationItem.authorUid ==
                                                  currentUserUid) {
                                                setState(() {
                                                  _model.removeFromInformations(
                                                      informationItem);
                                                });

                                                await _model
                                                    .firebaseResult!.reference
                                                    .update({
                                                  ...mapToFirestore(
                                                    {
                                                      'informations':
                                                          getInformationDataTypeListFirestoreData(
                                                        _model.informations,
                                                      ),
                                                    },
                                                  ),
                                                });
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          const Spacer(),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 16.0),
                              child: SizedBox(
                                width: 384.0,
                                child: TextFormField(
                                  controller: _model.guestInputFieldController,
                                  focusNode: _model.guestInputFieldFocusNode,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText:
                                        'Information (if you\'re here, if it\'s used, who are here etc...)',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          fontSize: 14.0,
                                        ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context).bodySmall,
                                  textAlign: TextAlign.center,
                                  validator: _model
                                      .guestInputFieldControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              if ((_model.firebaseResult != null) &&
                                  (/* NOT RECOMMENDED */ _model
                                          .guestInputFieldController.text ==
                                      'true')) {
                                setState(() {
                                  _model.addToInformations(
                                      InformationDataTypeStruct(
                                    information:
                                        _model.guestInputFieldController.text,
                                    timestamp: getCurrentTimestamp,
                                    authorUid: currentUserUid,
                                  ));
                                });

                                await _model.firebaseResult!.reference.update({
                                  ...mapToFirestore(
                                    {
                                      'informations':
                                          getInformationDataTypeListFirestoreData(
                                        _model.informations,
                                      ),
                                    },
                                  ),
                                });
                              } else {
                                setState(() {
                                  _model.addToInformations(
                                      InformationDataTypeStruct(
                                    information:
                                        _model.guestInputFieldController.text,
                                    timestamp: getCurrentTimestamp,
                                    authorUid: currentUserUid,
                                    removed: false,
                                  ));
                                });

                                await RoomsRecord.collection.doc().set({
                                  ...createRoomsRecordData(
                                    roomName: widget.roomName,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'informations':
                                          getInformationDataTypeListFirestoreData(
                                        _model.informations,
                                      ),
                                    },
                                  ),
                                });
                              }
                            },
                            text: 'Send Information',
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Manrope',
                                    color: Colors.white,
                                  ),
                              elevation: 3.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 0.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: 16.0,
                          borderWidth: 2.0,
                          buttonSize: 40.0,
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          icon: Icon(
                            Icons.chevron_left,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            context.pushNamed('Panel');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(1.0, -1.0),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(32.0, 48.0, 32.0, 0.0),
                  child: FlutterFlowIconButton(
                    borderColor: FlutterFlowTheme.of(context).primaryBackground,
                    borderRadius: 16.0,
                    borderWidth: 2.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    icon: Icon(
                      Icons.logout,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      GoRouter.of(context).prepareAuthEvent();
                      await authManager.signOut();
                      GoRouter.of(context).clearRedirectLocation();

                      context.goNamedAuth('Authentification', context.mounted);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
