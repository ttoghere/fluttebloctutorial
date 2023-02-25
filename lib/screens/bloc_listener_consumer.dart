import 'package:fluttebloctutorial/cubits/app_counter/app_counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocListenerConsumer extends StatelessWidget {
  const BlocListenerConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Listener/Consumer"),
      ),
      //Helps to give action for statement or any condition change
      body: BlocListener<AppCounterCubit, AppCounterState>(
        listener: (context, state) {
          if (state.counter == 3) {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      content: Text("Counter is: ${state.counter}"),
                    ));
          } else if (state.counter == -1) {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      content: Text("Counter is: ${state.counter}"),
                    ));
          }
        },
        child: BlocBuilder<AppCounterCubit, AppCounterState>(
          builder: (context, state) {
            return Center(
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
            );
          },
        ),
      ),
    );
  }
}
