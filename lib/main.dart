import 'package:fluttebloctutorial/blocs/app_counter/app_counter_bloc.dart';
import 'package:fluttebloctutorial/cubits/app_counter/app_counter_cubit.dart';
import 'package:fluttebloctutorial/blocs/theme/theme_bloc.dart';
import 'package:fluttebloctutorial/cubits/color/color_cubit.dart';
import 'package:fluttebloctutorial/cubits/color_counter/color_counter_cubit.dart';
import 'package:fluttebloctutorial/screens/cubits_communication.dart';
import 'package:fluttebloctutorial/screens/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //How to inject blocs/cubits into the app
    return MultiBlocProvider(
      providers: [
        //Defination of Bloc/Cubit
        BlocProvider(
          create: (context) => AppCounterCubit(),
        ),
        BlocProvider(
          create: (context) => AppCounterBloc(),
        ),
        BlocProvider(
          create: (context) => ThemeBloc(),
        ),
        BlocProvider(create: (context) => ColorCubit()),
        BlocProvider(
          create: (context) => ColorCounterCubit(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Material App',
            theme: state.appTheme == AppTheme.light
                ? ThemeData()
                : ThemeData.dark(),
            home:  ChangeColor(),
          );
        },
      ),
    );
  }
}
