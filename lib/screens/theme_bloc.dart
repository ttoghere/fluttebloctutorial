import 'dart:math';
import 'package:fluttebloctutorial/blocs/theme/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeBlocScreen extends StatelessWidget {
  const ThemeBlocScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            final int randInt = Random().nextInt(10);
            BlocProvider.of<ThemeBloc>(context)
                .add(ChangeThemeEvent(randInt: randInt));
            print("RandInt: $randInt");
          },
          child: const Text("Theme Change"),
        ),
      ),
    );
  }
}
