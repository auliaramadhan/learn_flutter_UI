import 'package:flutter/material.dart';

class LinearGradientMask extends StatelessWidget {
  final Widget child;
  const LinearGradientMask({required this.child});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Colors.green, Colors.blue],
          tileMode: TileMode.mirror,
        ).createShader(bounds);
      },
      child: child,
    );
  }
}