// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'app_counter_cubit.dart';

//State of cubit
class AppCounterState extends Equatable {
  final int counter;
  const AppCounterState({required this.counter});

  //Define parameters of cubit for access from cubit define
  @override
  List<Object?> get props => [counter];

  //How to see parameters on debug console
  @override
  String toString() {
    return "AppCounterState: $counter";
  }

  //For States null protection
  AppCounterState copyWith({
    int? counter,
  }) {
    return AppCounterState(
      counter: counter ?? this.counter,
    );
  }

  //Default Use for main state
  factory AppCounterState.initial() {
    return const AppCounterState(counter: 0);
  }
}
