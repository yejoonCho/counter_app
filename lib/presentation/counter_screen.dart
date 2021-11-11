import 'package:counter_app/presentation/widgets/animated_circle.dart';
import 'package:counter_app/presentation/widgets/counter_slide.dart';
import 'package:counter_app/presentation/widgets/counter_value.dart';
import 'package:counter_app/presentation/widgets/internet_icon.dart';
import 'package:counter_app/presentation/widgets/plasma_background.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Screen'),
        centerTitle: true,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          PlasmaBackground(),
          Positioned(
            top: 30,
            right: 30,
            child: InternetIcon(),
          ),
          Positioned(
            top: 10.h,
            child: Stack(
              alignment: Alignment.center,
              children: [
                AnimatedCircle(),
                CounterValue(),
              ],
            ),
          ),
          Positioned(bottom: 8.h, child: CounterSlide()),
        ],
      ),
    );
  }
}
