import 'package:counter_app/logic/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class CounterCubit extends Cubit<CounterState> with HydratedMixin {
  CounterCubit() : super(CounterState(counterValue: 0));

  void increment() => emit(CounterState(counterValue: state.counterValue + 1));
  void decrement() => emit(CounterState(counterValue: state.counterValue - 1));

  @override
  CounterState fromJson(Map<String, dynamic> json) {
    return CounterState.fromMap(json);
  }

  @override
  Map<String, dynamic> toJson(CounterState state) {
    return state.toMap();
  }
}
