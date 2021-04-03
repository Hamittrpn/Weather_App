import 'package:flutter/material.dart';

class GradientColorContainer extends StatelessWidget {
  final Widget child;
  final MaterialColor color;

  GradientColorContainer({@required this.child, @required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [color[700], color[500], color[200]],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.6, 0.8, 1])),
    );
  }
}
