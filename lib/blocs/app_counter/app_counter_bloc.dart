import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'app_counter_event.dart';
part 'app_counter_state.dart';

class AppCounterBloc extends Bloc<AppCounterEvent, AppCounterState> {
  AppCounterBloc() : super(AppCounterState.initial()) {
    //There are 2 alternative use for defining bloc actions
    //1) On action event builder
    on<IncrementCounterEvent>((event, emit) {
      emit(state.copyWith(counter: state.counter + 1));
    });
    //2) Making seperate function after that call function into the event
    //its more preferable for clean code
    on<DecrementCounterEvent>(_decrementCounter);
  }

  void _decrementCounter(DecrementCounterEvent event,Emitter<AppCounterState> emit){
    emit(state.copyWith(counter: state.counter - 1));
  }
}
