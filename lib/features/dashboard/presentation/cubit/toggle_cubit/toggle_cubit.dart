import 'package:flutter_bloc/flutter_bloc.dart';

enum CallJobToggleOption { recentCalls, jobsScheduled }

class CallJobToggleCubit extends Cubit<CallJobToggleOption> {
  CallJobToggleCubit() : super(CallJobToggleOption.recentCalls);

  void select(CallJobToggleOption option) => emit(option);
}
