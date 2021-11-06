import 'package:flutter/material.dart';

class CounterSlide extends StatefulWidget {
  @override
  _CounterSlideState createState() => _CounterSlideState();
}

class _CounterSlideState extends State<CounterSlide>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        width: 280,
        height: 120,
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
                  size: 40,
                  color: Theme.of(context).iconTheme.color!.withOpacity(0.7),
                ),
              ),
              Positioned(
                right: 10.0,
                top: null,
                child: Icon(
                  Icons.add,
                  size: 40,
                  color: Theme.of(context).iconTheme.color!.withOpacity(0.7),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  color: Theme.of(context).accentColor,
                  shape: const CircleBorder(),
                  elevation: 5.0,
                  child: Center(
                    child: Icon(
                      Icons.trip_origin,
                      size: 40,
                      color:
                          Theme.of(context).iconTheme.color!.withOpacity(0.6),
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
}
