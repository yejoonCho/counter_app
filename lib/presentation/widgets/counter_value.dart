import 'package:animate_do/animate_do.dart';
import 'package:counter_app/logic/counter_cubit.dart';
import 'package:counter_app/logic/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterValue extends StatefulWidget {
  @override
  _CounterValueState createState() => _CounterValueState();
}

class _CounterValueState extends State<CounterValue> {
  AnimationController? _animationController;

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, CounterState>(
      builder: (context, state) {
        _animationController?.forward(from: 0.0);
        return ZoomIn(
          duration: Duration(milliseconds: 400),
          manualTrigger: true,
          controller: (controller) => _animationController = controller,
          child: Text(
            '${state.counterValue}',
            style: Theme.of(context).textTheme.headline1!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 128,
                ),
          ),
        );
      },
    );
  }
}
