import 'package:freezed_annotation/freezed_annotation.dart';

part 'call_model.freezed.dart';
part 'call_model.g.dart';

@JsonEnum(alwaysCreate: true)
enum CallType {
  @JsonValue('incoming')
  incoming,
  @JsonValue('outgoing')
  outgoing,
  @JsonValue('missed')
  missed,
}

@freezed
abstract class CallModel with _$CallModel {
  const factory CallModel({
    required String id,

    required String callerName,

    required String callerNumber,

    String? callerAvatarUrl,

    required CallType callType,

    required int callTime,

    int? callTimeOut,

    int? callDuration,
  }) = _CallModel;

  factory CallModel.fromJson(Map<String, dynamic> json) =>
      _$CallModelFromJson(json);

  const CallModel._();

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'callerName': callerName,
      'callerNumber': callerNumber,
      'callerAvatarUrl': callerAvatarUrl,
      'callType': callType.name,
      'callTime': callTime,
      'callTimeOut': callTimeOut,
      'callDuration': callDuration,
    };
  }

  factory CallModel.fromMap(Map<String, dynamic> map) {
    return CallModel(
      id: map['id'] as String,
      callerName: map['callerName'] as String,
      callerAvatarUrl: map['callerAvatarUrl'] as String?,
      callerNumber: map['callerNumber'] as String,
      callType: CallType.values.firstWhere(
        (e) => e.name == map['callType'],
        orElse: () => CallType.missed,
      ),
      callTime: map['callTime'] as int,
      callTimeOut: map['callTimeOut'] as int?,
      callDuration: map['callDuration'] as int?,
    );
  }
}
