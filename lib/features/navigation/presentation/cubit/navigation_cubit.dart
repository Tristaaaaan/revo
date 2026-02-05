import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revo/features/navigation/presentation/cubit/navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState.initial());

  void changeTab(int index) {
    emit(state.copyWith(selectedIndex: index));
  }

  void setHolding(bool value) {
    emit(state.copyWith(isHolding: value));
  }
}
