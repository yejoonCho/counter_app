import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:counter_app/core/app_theme.dart';

class PlasmaBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        backgroundBlendMode: BlendMode.srcOver,
      ),
      child: PlasmaRenderer(
        type: PlasmaType.infinity,
        particles: 10,
        color: Theme.of(context).particlesColor,
        blur: 0.4,
        size: 0.38,
        speed: 1,
        offset: 0,
        blendMode: BlendMode.plus,
        particleType: ParticleType.atlas,
        variation1: 0,
        variation2: 0,
        variation3: 0,
        rotation: 0,
      ),
    );
  }
}
