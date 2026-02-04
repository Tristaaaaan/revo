import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:revo/features/calls/data/model/call_model.dart';

part 'call_states.freezed.dart';

@freezed
class CallState with _$CallState {
  const factory CallState.initial() = _Initial;
  const factory CallState.loading() = _Loading;
  const factory CallState.loaded(List<CallModel>? calls) = _Loaded;
  const factory CallState.error(String message) = _Error;
  const factory CallState.empty() = _Empty;
}
