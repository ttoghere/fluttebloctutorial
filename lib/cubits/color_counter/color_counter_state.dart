part of 'color_counter_cubit.dart';


//State of cubit
class ColorCounterState extends Equatable {
  final int counter;
  const ColorCounterState({required this.counter});

  //Define parameters of cubit for access from cubit define
  @override
  List<Object?> get props => [counter];

  //How to see parameters on debug console
  @override
  String toString() {
    return "ColorCounterState: $counter";
  }

  //For States null protection
  ColorCounterState copyWith({
    int? counter,
  }) {
    return ColorCounterState(
      counter: counter ?? this.counter,
    );
  }

  //Default Use for main state
  factory ColorCounterState.initial() {
    return const ColorCounterState(counter: 0);
  }
}
