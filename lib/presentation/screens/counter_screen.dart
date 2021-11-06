import 'package:counter_app/presentation/widgets/plasma_background.dart';
import 'package:flutter/material.dart';

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Screen'),
      ),
      body: Stack(
        children: [
          PlasmaBackground(),
        ],
      ),
    );
  }
}
