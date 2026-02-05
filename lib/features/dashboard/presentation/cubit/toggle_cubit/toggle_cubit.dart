import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revo/shared/enum/shared_enums.dart';

class CallJobToggleCubit extends Cubit<CallJobToggleOption> {
  CallJobToggleCubit() : super(CallJobToggleOption.recentCalls);

  void select(CallJobToggleOption option) => emit(option);
}
