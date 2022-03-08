import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

const _duration = Duration(milliseconds: 500);

class SimpleAnimation extends StatefulWidget {
  const SimpleAnimation({Key? key}) : super(key: key);

  @override
  State<SimpleAnimation> createState() => _SimpleAnimationState();
}

class _SimpleAnimationState extends State<SimpleAnimation> {
  double width = 200;
  double height = 200;
  Color color = Colors.red;
  double widtDecoration = 1;
  late Timer timer;
  final random = Random();
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
      _duration,
      (timer) {
        setState(() {
          color = Color.fromRGBO(
            random.nextInt(255),
            random.nextInt(255),
            random.nextInt(255),
            1,
          );
          widtDecoration = random.nextInt(300).toDouble();
          width = random.nextInt(300).toDouble();
          height = random.nextInt(300).toDouble();
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      width: width,
      height: height,
      color: color,
      curve: Curves.bounceInOut,
      decoration: BoxDecoration(
          border: Border.all(
        color: Colors.white,
        width: widtDecoration,
      )),
      child: Container(),
    );
  }
}

class TweenAnimated extends StatefulWidget {
  TweenAnimated({Key? key}) : super(key: key);

  @override
  State<TweenAnimated> createState() => _TweenAnimatedState();
}

class _TweenAnimatedState extends State<TweenAnimated> {
  double value = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TweenAnimationBuilder<double>(
          duration: _duration,
          tween: Tween<double>(begin: 0, end: value),
          child: Container(
            width: 100,
            height: 100,
            color: Colors.cyan,
          ),
          builder: (context, value, Widget? child) {
            return Transform.translate(
              offset: Offset((value * MediaQuery.of(context).size.width) - 140, 0),
              child: child,
            );
          },
        ),
        Slider.adaptive(
          value: value,
          onChanged: (newvalue) => setState(() {
            value = newvalue;
          }),
        )
      ],
    );
  }
}

class ControlAnimated extends StatefulWidget {
  ControlAnimated({Key? key}) : super(key: key);

  @override
  State<ControlAnimated> createState() => _ControlAnimatedState();
}

class _ControlAnimatedState extends State<ControlAnimated> with SingleTickerProviderStateMixin {
  late final _animationCtrl = AnimationController(vsync: this, duration: _duration);
  late final _rotationCtrl = AnimationController(vsync: this, duration: _duration)..forward();
  late final _scaleCtrl = AnimationController(vsync: this, duration: _duration);
  late final _slideCtrl = AnimationController(vsync: this, duration: _duration);
  late final _customAnimationRotate = Tween(
    begin: 0.0,
    end: 1.0,
  ).animate(CurvedAnimation(
    parent: _rotationCtrl,
    curve: Curves.easeInOut,
  ));

  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(1.5, 0.0),
  ).animate(CurvedAnimation(
    parent: _slideCtrl,
    curve: Curves.elasticIn,
  ));

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationCtrl.repeat();
    _scaleCtrl.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _scaleCtrl.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _scaleCtrl.forward();
      }
    });
    // start the animation when the widget is first loaded
    // _scaleCtrl.forward();
  }

  @override
  void dispose() {
    _animationCtrl.dispose();
    super.dispose();
  }

  final container = Container(
    width: 180,
    height: 180,
    color: Colors.red,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedBuilder(
          animation: _animationCtrl,
          child: container,
          builder: (context, child) {
            return Transform.rotate(
              // 6. the angle is a function of the AnimationController's value
              angle: 0.5 * pi * _animationCtrl.value,
              child: child,
            );
          },
        ),
        ScaleTransition(
          scale: _scaleCtrl,
          child: container,
        ),
        RotationTransition(
          turns: _customAnimationRotate,
          child: container,
        ),
        SlideTransition(
          position: _offsetAnimation,
          child: container,
        )
      ],
    );
  }
}
