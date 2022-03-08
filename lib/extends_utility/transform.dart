import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class TransformExample extends StatefulWidget {
  @override
  _TransformExampleState createState() => _TransformExampleState();
}

class _TransformExampleState extends State<TransformExample> {
  double translateX = 0.0;
  double translateY = 0.0;
  double scaleFactor = 1;
  double myAngle = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          buildMatrix(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildTranslate(),
              buildScale(),
              buildRotate(),
            ],
          ),
        ],
      ),
    );
  }

  double x = 0;
  double y = 0;
  double z = 0;

  Widget buildMatrix() {
    return Center(
      child: Transform(
        transform: Matrix4.identity()
          ..rotateX(x)
          ..rotateY(y)
          ..rotateZ(z),
        alignment: FractionalOffset.center,
        child: GestureDetector(
          onPanUpdate: (details) {
            // print(details.localPosition);
            setState(() {
              y = y - details.delta.dx / 100;
              x = x + details.delta.dy / 100;
            });
          },
          child: Container(
            color: Colors.red,
            height: 200.0,
            width: 200.0,
          ),
        ),
      ),
    );
  }

  Widget buildTranslate() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Transform.translate(
          offset: Offset(translateX, translateY),
          child: const Icon(
            Icons.star,
            color: Colors.blue,
            size: 50,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(Icons.keyboard_arrow_up),
              color: Colors.blue,
              onPressed: () {
                translate(1);
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.keyboard_arrow_left,
                  ),
                  color: Colors.blue,
                  onPressed: () {
                    translate(4);
                  },
                ),
                SizedBox(
                  width: 25,
                ),
                IconButton(
                  icon: const Icon(Icons.keyboard_arrow_right),
                  color: Colors.blue,
                  onPressed: () {
                    translate(2);
                  },
                ),
              ],
            ),
            IconButton(
              icon: const Icon(
                Icons.keyboard_arrow_down,
              ),
              color: Colors.blue,
              onPressed: () {
                translate(3);
              },
            ),
          ],
        )
      ],
    );
  }

  translate(int i) {
    switch (i) {
      case 1:
        setState(() {
          translateY -= 10;
        });
        break;
      case 2:
        setState(() {
          translateX += 10;
        });
        break;
      case 3:
        setState(() {
          translateY += 10;
        });
        break;
      case 4:
        setState(() {
          translateX -= 10;
        });
        break;
      default:
        break;
    }
  }

  Widget buildScale() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Transform.scale(
          scale: scaleFactor,
          child: const Icon(
            Icons.star,
            color: Colors.green,
            size: 50,
          ),
        ),
        TextButton(
          child: Text(
            "Scale",
            style: TextStyle(color: Colors.green),
          ),
          onPressed: () {
            scale();
          },
        ),
      ],
    );
  }

  scale() async {
    for (var i = 0; i < 30; i++)
      await Future.delayed(Duration(milliseconds: 25), () {
        setState(() {
          scaleFactor += 0.1;
        });
      });
    for (var i = 0; i < 30; i++)
      await Future.delayed(Duration(milliseconds: 25), () {
        setState(() {
          scaleFactor -= 0.1;
        });
      });
  }

  Widget buildRotate() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Transform.rotate(
          angle: myAngle,
          child: const Icon(
            Icons.star,
            color: Colors.orange,
            size: 50,
          ),
        ),
        TextButton(
          child: Text(
            "Rotate",
            style: TextStyle(color: Colors.orange),
          ),
          onPressed: () {
            rotate();
          },
        ),
      ],
    );
  }

  rotate() async {
    for (var i = 0; i < 50; i++)
      await Future.delayed(Duration(milliseconds: 25), () {
        setState(() {
          myAngle += 0.1;
        });
      });
  }
}

class MovingCardWidget extends StatefulWidget {
  final String urlFront;
  final String urlBack;

  const MovingCardWidget({
    required this.urlFront,
    required this.urlBack,
    Key? key,
  }) : super(key: key);

  @override
  _MovingCardWidgetState createState() => _MovingCardWidgetState();
}

class _MovingCardWidgetState extends State<MovingCardWidget> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  bool isFront = true;
  double verticalDrag = 0;
  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onVerticalDragStart: (details) {
          controller.reset();

          setState(() {
            isFront = true;
            verticalDrag = 0;
          });
        },
        onVerticalDragUpdate: (details) {
          setState(() {
            verticalDrag += details.delta.dy;
            verticalDrag %= 360;

            setImageSide();
          });
        },
        onVerticalDragEnd: (details) {
          final double end = 360 - verticalDrag >= 180 ? 0 : 360;

          animation = Tween<double>(begin: verticalDrag, end: end).animate(controller)
            ..addListener(() {
              setState(() {
                verticalDrag = animation.value;
                setImageSide();
              });
            });
          controller.forward();
        },
        child: Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateX(verticalDrag / 180 * pi),
          alignment: Alignment.center,
          child: isFront
              ? Image.asset(widget.urlFront)
              : Transform(
                  transform: Matrix4.identity()..rotateX(pi),
                  alignment: Alignment.center,
                  child: Image.asset(widget.urlBack),
                ),
        ),
      );

  void setImageSide() {
    if (verticalDrag <= 90 || verticalDrag >= 270) {
      isFront = true;
    } else {
      isFront = false;
    }
  }
}
