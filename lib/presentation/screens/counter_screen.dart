import 'package:flutter/material.dart';

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Screen'),
      ),
      body: Center(
        child: Text(
          'Welcome to Counter App',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
