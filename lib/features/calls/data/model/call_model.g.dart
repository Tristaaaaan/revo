// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CallModel _$CallModelFromJson(Map<String, dynamic> json) => _CallModel(
  id: json['id'] as String,
  callerName: json['callerName'] as String,
  callerNumber: json['callerNumber'] as String,
  callerAvatarUrl: json['callerAvatarUrl'] as String?,
  callType: $enumDecode(_$CallTypeEnumMap, json['callType']),
  callTime: (json['callTime'] as num).toInt(),
  description: json['description'] as String,
  callTimeOut: (json['callTimeOut'] as num?)?.toInt(),
  callDuration: (json['callDuration'] as num?)?.toInt(),
);

Map<String, dynamic> _$CallModelToJson(_CallModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'callerName': instance.callerName,
      'callerNumber': instance.callerNumber,
      'callerAvatarUrl': instance.callerAvatarUrl,
      'callType': _$CallTypeEnumMap[instance.callType]!,
      'callTime': instance.callTime,
      'description': instance.description,
      'callTimeOut': instance.callTimeOut,
      'callDuration': instance.callDuration,
    };

const _$CallTypeEnumMap = {
  CallType.incoming: 'incoming',
  CallType.outgoing: 'outgoing',
  CallType.missed: 'missed',
};
