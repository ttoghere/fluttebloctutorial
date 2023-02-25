import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'app_counter_state.dart';

class AppCounterCubit extends Cubit<AppCounterState> {
  AppCounterCubit() : super(AppCounterState.initial());

  void increment() {
    emit(state.copyWith(counter: state.counter + 1));
  }

  void decrement() {
    emit(state.copyWith(counter: state.counter - 1));
  }
}
