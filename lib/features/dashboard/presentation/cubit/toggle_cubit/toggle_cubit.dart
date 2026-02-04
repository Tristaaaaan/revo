import 'package:flutter_bloc/flutter_bloc.dart';

enum ToggleOption { recentCalls, jobsScheduled }

class ToggleCubit extends Cubit<ToggleOption> {
  ToggleCubit() : super(ToggleOption.recentCalls);

  void select(ToggleOption option) => emit(option);
}
