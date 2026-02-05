import 'package:flutter_bloc/flutter_bloc.dart';

enum SummaryToggleOption { totalCalls, totalQuality, callBehavior }

class SummaryToggleCubit extends Cubit<SummaryToggleOption> {
  SummaryToggleCubit() : super(SummaryToggleOption.totalCalls);

  void select(SummaryToggleOption option) => emit(option);
}
