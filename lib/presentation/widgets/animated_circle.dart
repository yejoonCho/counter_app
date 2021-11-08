import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AnimatedCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.w,
      height: 40.h,
      child: FlareActor(
        'assets/flares/circle.flr',
        animation: "Alarm",
        color: Theme.of(context).accentColor,
      ),
    );
  }
}
