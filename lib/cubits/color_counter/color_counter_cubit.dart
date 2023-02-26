// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:fluttebloctutorial/cubits/color/color_cubit.dart';
import 'package:flutter/material.dart';

part 'color_counter_state.dart';

class ColorCounterCubit extends Cubit<ColorCounterState> {
  ColorCounterCubit() : super(ColorCounterState.initial());
  void changeCounter({required int incrementSize}) {
    emit(state.copyWith(counter: state.counter + incrementSize));
  }
}


/*
    //Stream Subscription Use form but its depreceated


class ColorCounterCubit extends Cubit<ColorCounterState> {
  int incrementSize = 1;

  final ColorCubit colorCubit;
  late final StreamSubscription colorSubscription;

  ColorCounterCubit({
    required this.colorCubit,
  }) : super(ColorCounterState.initial()) {
    colorCubit.stream.listen((ColorState colorState) {
      if (colorState.color == Colors.white) {
        incrementSize = 1;
      } else if (colorState.color == Colors.green) {
        incrementSize = 10;
      } else if (colorState.color == Colors.blue) {
        incrementSize = 100;
      } else if (colorState.color == Colors.red) {
        emit(state.copyWith(counter: state.counter - 100));
        incrementSize = -100;
      }
    });
  }

  void changeCounter() {
    emit(state.copyWith(counter: state.counter + incrementSize));
  }

  @override
  Future<void> close() {
    colorSubscription.cancel();
    return super.close();
  }
}


 */