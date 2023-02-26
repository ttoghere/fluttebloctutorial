part of 'color_counter_bloc.dart';

class ColorCounterState extends Equatable {
  final int counter;
  ColorCounterState({
    required this.counter,
  });

  factory ColorCounterState.initial() {
    return ColorCounterState(counter: 0);
  }

  @override
  List<Object> get props => [counter];

  @override
  String toString() => 'ColorCounterState(counter: $counter)';

  ColorCounterState copyWith({
    int? counter,
  }) {
    return ColorCounterState(
      counter: counter ?? this.counter,
    );
  }
}