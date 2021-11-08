import 'package:counter_app/logic/counter_cubit.dart';
import 'package:counter_app/logic/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterValue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, CounterState>(
      builder: (context, state) {
        return Text(
          '${state.counterValue}',
          style: Theme.of(context).textTheme.headline1!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 128,
              ),
        );
      },
    );
  }
}
