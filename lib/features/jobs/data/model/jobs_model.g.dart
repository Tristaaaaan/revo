// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jobs_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JobModel _$JobModelFromJson(Map<String, dynamic> json) => _JobModel(
  id: json['id'] as String,
  name: json['name'] as String,
  address: json['address'] as String,
  dateTime: (json['dateTime'] as num?)?.toInt(),
  status: json['status'] as String?,
  documentUrl: json['documentUrl'] as String?,
);

Map<String, dynamic> _$JobModelToJson(_JobModel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'address': instance.address,
  'dateTime': instance.dateTime,
  'status': instance.status,
  'documentUrl': instance.documentUrl,
};
