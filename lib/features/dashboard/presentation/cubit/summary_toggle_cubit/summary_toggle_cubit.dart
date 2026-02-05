import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revo/shared/enum/shared_enums.dart';

class SummaryToggleCubit extends Cubit<SummaryToggleOption> {
  SummaryToggleCubit() : super(SummaryToggleOption.totalCalls);

  void select(SummaryToggleOption option) => emit(option);
}
