import 'package:fluttebloctutorial/cubits/app_counter/app_counter_cubit.dart';
import 'package:fluttebloctutorial/screens/bloc_listener_consumer.dart';
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
      ],
      child: const MaterialApp(
        title: 'Material App',
        home: BlocListenerConsumer(),
      ),
    );
  }
}
