import 'package:fluttebloctutorial/blocs/color_counter/color_counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/color/color_bloc.dart';

class BlocChangeColor extends StatefulWidget {
  BlocChangeColor({super.key});

  @override
  State<BlocChangeColor> createState() => _BlocChangeColorState();
}

class _BlocChangeColorState extends State<BlocChangeColor> {
  int incrementSize = 1;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ColorBloc, ColorState>(
      listener: (context, colorState) {
        if (colorState.color == Colors.red) {
          incrementSize = 1;
        } else if (colorState.color == Colors.green) {
          incrementSize = 10;
        } else if (colorState.color == Colors.blue) {
          incrementSize = 100;
        } else if (colorState.color == Colors.black) {
          incrementSize = -100;
          context
              .read<ColorCounterBloc>()
              .add(ChangeColorCounterEvent(incrementSize: incrementSize));
        }
      },
      child: Scaffold(
        backgroundColor: context.watch<ColorBloc>().state.color,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: const Text(
                  'Change Color',
                  style: TextStyle(fontSize: 24.0),
                ),
                onPressed: () {
                  context.read<ColorBloc>().add(ChangeColorEvent());
                },
              ),
              const SizedBox(height: 20.0),
              Text(
                '${context.watch<ColorCounterBloc>().state.counter}',
                style: const TextStyle(
                  fontSize: 52.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                child: const Text(
                  'Increment Counter',
                  style: TextStyle(fontSize: 24.0),
                ),
                onPressed: () {
                  context
                      .read<ColorCounterBloc>()
                      .add(ChangeColorCounterEvent(incrementSize: incrementSize));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
