import 'package:flutter/material.dart';

class ExtraHeight extends StatelessWidget {
  final double height;
  const ExtraHeight([this.height = 16]) : super();

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}

class ExtraWidth extends StatelessWidget {
  final double? width;
  const ExtraWidth([this.width = 16]) : super();

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width);
  }
}
