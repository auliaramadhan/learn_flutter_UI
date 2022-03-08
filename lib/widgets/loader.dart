import 'package:flutter/material.dart';
import '../colors.dart';

class CircleLoading extends StatelessWidget {
  final Color color;
  final double size;
  const CircleLoading({Key? key, this.color = ColorApp.primary, this.size = 40}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: size,
        width: size,
        child: CircularProgressIndicator(
          color: color,
          strokeWidth: 2,
        ),
      ),
    );
  }
}
class LineProgress extends StatelessWidget {
  final Color color;
  final double value;
  const LineProgress({Key? key, this.color = ColorApp.primary, this.value = 0.1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LinearProgressIndicator(
        color: color,
        value: value,
      ),
    );
  }
}
