import 'package:counter_app/presentation/counter_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const String counter = 'counter';

  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case counter:
        return MaterialPageRoute(
          builder: (context) => CounterScreen(),
        );
      default:
        throw Exception('Route not found');
    }
  }
}
