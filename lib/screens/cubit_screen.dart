import 'package:fluttebloctutorial/cubits/app_counter/app_counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitScreen extends StatelessWidget {
  static const routeName = "/cubitscreen";
  const CubitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCounterCubit, AppCounterState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("CubitScreen"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  //How to access bloc via BlocBuilder
                  state.counter.toString(),
                  //An alternative for BlocProvider
                  // This alternative ==  BlocProvider.of<AppCounterCubit>(context,listen:true);
                  // context .read<AppCounterCubit>().state.counter.toString(),
                  //An alternative for BlocProvider
                  // // This alternative ==  BlocProvider.of<AppCounterCubit>(context,listen:false);
                  // context.watch<AppCounterCubit>().state.counter.toString(),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    //Access to Bloc/Cubit
                    BlocProvider.of<AppCounterCubit>(context).increment();
                  },
                  icon: const Icon(Icons.add),
                  label: const Text("Increase 1"),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    context.read<AppCounterCubit>().decrement();
                  },
                  icon: const Icon(Icons.remove),
                  label: const Text("Decrease 1"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
