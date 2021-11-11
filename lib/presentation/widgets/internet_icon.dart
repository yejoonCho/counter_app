import 'package:counter_app/logic/internet_cubit.dart';
import 'package:counter_app/logic/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class InternetIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InternetCubit, InternetState>(
      builder: (context, state) {
        if (state is InternetConnected &&
            state.connectionType == ConnectionType.wifi) {
          return Icon(
            Icons.wifi_outlined,
            size: SizerUtil.deviceType == DeviceType.tablet ? 60 : 36,
          );
        } else if (state is InternetConnected &&
            state.connectionType == ConnectionType.mobile) {
          return Icon(
            Icons.signal_cellular_alt_outlined,
            size: SizerUtil.deviceType == DeviceType.tablet ? 60 : 36,
          );
        } else if (state is InternetDisconnected) {
          return Icon(
            Icons.mobile_off_outlined,
            size: SizerUtil.deviceType == DeviceType.tablet ? 60 : 36,
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
