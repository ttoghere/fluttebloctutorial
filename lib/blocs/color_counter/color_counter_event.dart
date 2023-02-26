part of 'color_counter_bloc.dart';

abstract class ColorCounterEvent extends Equatable {
  const ColorCounterEvent();

  @override
  List<Object> get props => [];
}

class ChangeColorCounterEvent extends ColorCounterEvent {
  final int incrementSize;
  ChangeColorCounterEvent({
    required this.incrementSize,
  });

  @override
  List<Object> get props => [incrementSize];
}