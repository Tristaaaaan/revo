import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:revo/features/jobs/data/model/jobs_model.dart';

part 'jobs_state.freezed.dart';

@freezed
class JobsState with _$JobsState {
  const factory JobsState.initial() = _Initial;
  const factory JobsState.loading() = _Loading;
  const factory JobsState.loaded(List<JobModel>? jobs) = _Loaded;
  const factory JobsState.error(String message) = _Error;
  const factory JobsState.empty() = _Empty;
}
