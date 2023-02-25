part of 'app_counter_bloc.dart';

abstract class AppCounterEvent extends Equatable {
  const AppCounterEvent();

  @override
  List<Object> get props => [];
}


class IncrementCounterEvent extends AppCounterEvent{}

class DecrementCounterEvent extends AppCounterEvent{}