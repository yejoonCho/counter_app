import 'package:flutter/material.dart';

enum ConnectionType {
  wifi,
  mobile,
}

@immutable
abstract class InternetState {}

class InternetLoading extends InternetState {}

class InternetConnected extends InternetState {
  final ConnectionType connectionType;
  InternetConnected({required this.connectionType});
}

class InternetDisconnected extends InternetState {}
