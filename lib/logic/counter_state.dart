class CounterState {
  int counterValue = 0;

  CounterState({required this.counterValue});

  factory CounterState.fromMap(Map<String, dynamic> map) {
    return CounterState(counterValue: map['counterValue']);
  }

  Map<String, dynamic> toMap() {
    return {
      'counterValue': counterValue,
    };
  }

  @override
  String toString() => 'CounterState(counterValue: $counterValue)';
}
