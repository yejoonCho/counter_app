import 'package:counter_app/presentation/widgets/animated_circle.dart';
import 'package:counter_app/presentation/widgets/counter_slide.dart';
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
        alignment: Alignment.center,
        children: [
          PlasmaBackground(),
          Positioned(bottom: 48, child: CounterSlide()),
          Positioned(top: 48, child: AnimatedCircle()),
        ],
      ),
    );
  }
}
