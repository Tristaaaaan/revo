import 'package:freezed_annotation/freezed_annotation.dart';

part 'jobs_model.freezed.dart';
part 'jobs_model.g.dart';

@freezed
abstract class JobModel with _$JobModel {
  const factory JobModel({
    required String id,
    required String name,
    required String address,
    int? dateTime,
    String? status,
    String? documentUrl,
  }) = _JobModel;

  factory JobModel.fromJson(Map<String, dynamic> json) =>
      _$JobModelFromJson(json);

  const JobModel._();

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'dateTime': dateTime,
      'status': status,
      'documentUrl': documentUrl,
    };
  }

  factory JobModel.fromMap(Map<String, dynamic> map) {
    return JobModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      address: map['address'] ?? '',
      dateTime: map['dateTime']?.toInt() ?? 0,
      status: map['status'] ?? '',
      documentUrl: map['documentUrl'] ?? '',
    );
  }
}
