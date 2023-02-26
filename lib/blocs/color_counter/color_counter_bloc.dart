import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'color_counter_event.dart';
part 'color_counter_state.dart';

class ColorCounterBloc extends Bloc<ColorCounterEvent, ColorCounterState> {
  int incrementSize = 1;

  ColorCounterBloc() : super(ColorCounterState.initial()) {
    // colorSubscription = colorBloc.stream.listen((ColorState colorState) {
    //   if (colorState.color == Colors.red) {
    //     incrementSize = 1;
    //   } else if (colorState.color == Colors.green) {
    //     incrementSize = 10;
    //   } else if (colorState.color == Colors.blue) {
    //     incrementSize = 100;
    //   } else if (colorState.color == Colors.black) {
    //     incrementSize = -100;
    //     add(ChangeCounterEvent());
    //   }
    // });

    on<ChangeColorCounterEvent>((event, emit) {
      emit(state.copyWith(counter: state.counter + event.incrementSize));
    });
  }
}
