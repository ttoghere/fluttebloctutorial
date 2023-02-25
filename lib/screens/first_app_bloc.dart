import 'package:fluttebloctutorial/blocs/app_counter/app_counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocBlocListenerConsumer extends StatelessWidget {
  const BlocBlocListenerConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Listener/Consumer"),
      ),
      //Provides a cleaner code than listener & builder
      //BlocConsumer is the fusion of listener & builder
      body: BlocConsumer<AppCounterBloc, AppCounterState>(
        // //Return true false for calling listener
        // listenWhen: (previous, current) {
        //  if else etc.
        //  },
        // //Returns true false for calling builder
        // buildWhen: (previous, current) {
        //  if else etc.
        // },
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
                    //Diffrence of bloc against cubit is
                    //Bloc is more complex and for actions you have to call event
                    //With .add(event);
                    context.read<AppCounterBloc>().add(IncrementCounterEvent());
                  },
                  icon: const Icon(Icons.add),
                  label: const Text("Increase 1"),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    BlocProvider.of<AppCounterBloc>(context)
                        .add(DecrementCounterEvent());
                  },
                  icon: const Icon(Icons.remove),
                  label: const Text("Decrease 1"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

/*

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


 */
