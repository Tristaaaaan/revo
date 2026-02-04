import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revo/features/calls/data/model/call_model.dart';
import 'package:revo/features/calls/domain/usecase/call_usecase.dart';
import 'package:revo/features/calls/presentation/cubit/call_states.dart';

class CallCubit extends Cubit<CallState> {
  final GetRecentCallsUseCase getRecentCallsUseCase;

  CallCubit(this.getRecentCallsUseCase) : super(const CallState.initial()) {
    fetchCalls();
  }

  Future<void> fetchCalls() async {
    emit(const CallState.loading());
    try {
      final List<CallModel>? calls = await getRecentCallsUseCase.execute();
      if (calls!.isEmpty) {
        emit(const CallState.empty());
      } else {
        emit(CallState.loaded(calls));
      }
    } catch (e) {
      emit(CallState.error(e.toString()));
    }
  }

  Future<void> refresh() async => fetchCalls();
}
