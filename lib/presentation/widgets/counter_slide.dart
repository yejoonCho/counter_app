import 'package:counter_app/logic/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class CounterSlide extends StatefulWidget {
  @override
  _CounterSlideState createState() => _CounterSlideState();
}

class _CounterSlideState extends State<CounterSlide>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  double? _startAnimationPosX;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, lowerBound: -0.5, upperBound: 0.5);
    _controller.value = 0;
    _controller.addListener(() {});
    _animation = Tween<Offset>(begin: Offset(0.0, 0.0), end: Offset(1.5, 0.0))
        .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant CounterSlide oldWidget) {
    super.didUpdateWidget(oldWidget);
    _animation = Tween<Offset>(begin: Offset(0.0, 0.0), end: Offset(1.5, 0.0))
        .animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        width: SizerUtil.deviceType == DeviceType.tablet ? 40.w : 55.w,
        height: 12.h,
        child: Material(
          type: MaterialType.canvas,
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(60.0),
          color: Theme.of(context).accentColor.withOpacity(0.2),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                left: 10.0,
                bottom: null,
                child: Icon(
                  Icons.remove,
                  size: SizerUtil.deviceType == DeviceType.tablet ? 7.w : 10.w,
                  color: Theme.of(context).iconTheme.color!.withOpacity(0.7),
                ),
              ),
              Positioned(
                right: 10.0,
                top: null,
                child: Icon(
                  Icons.add,
                  size: SizerUtil.deviceType == DeviceType.tablet ? 7.w : 10.w,
                  color: Theme.of(context).iconTheme.color!.withOpacity(0.7),
                ),
              ),
              GestureDetector(
                onHorizontalDragStart: _onPanStart,
                onHorizontalDragUpdate: _onPanUpdate,
                onHorizontalDragEnd: _onPanEnd,
                child: SlideTransition(
                  position: _animation,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      color: Theme.of(context).accentColor,
                      shape: const CircleBorder(),
                      elevation: 5.0,
                      child: Center(
                        child: Icon(
                          Icons.trip_origin,
                          size: SizerUtil.deviceType == DeviceType.tablet
                              ? 7.w
                              : 10.w,
                          color: Theme.of(context)
                              .iconTheme
                              .color!
                              .withOpacity(0.6),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double offsetFromGlobalPos(Offset globalPosition) {
    RenderBox box = context.findRenderObject() as RenderBox;
    Offset local = box.globalToLocal(globalPosition);
    _startAnimationPosX = ((local.dx * 0.75) / box.size.width) - 0.4;
    return ((local.dx * 0.75) / box.size.width) - 0.4;
  }

  void _onPanStart(DragStartDetails details) {
    _controller.stop();
    _controller.value = offsetFromGlobalPos(details.globalPosition);
  }

  void _onPanUpdate(DragUpdateDetails details) {
    _controller.value = offsetFromGlobalPos(details.globalPosition);
  }

  void _onPanEnd(DragEndDetails details) {
    _controller.stop();

    if (_controller.value <= -0.2) {
      BlocProvider.of<CounterCubit>(context).decrement();
    } else if (_controller.value >= 0.2) {
      BlocProvider.of<CounterCubit>(context).increment();
    }

    final SpringDescription _kDefaultSpring =
        new SpringDescription.withDampingRatio(
      mass: 0.9,
      stiffness: 250.0,
      ratio: 0.6,
    );
    _controller.animateWith(
        SpringSimulation(_kDefaultSpring, _startAnimationPosX!, 0.0, 0.0));
  }
}
