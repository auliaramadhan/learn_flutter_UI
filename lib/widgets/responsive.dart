import 'package:flutter/material.dart';

class IntrinsicExample extends StatelessWidget {
  const IntrinsicExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('no Intrisic'),
        Row(
          children: [
            Container(child: const SizedBox(), color: Colors.yellow, height: 100),
            Container(child: const SizedBox(), color: Colors.red, height: 200),
            Container(child: const SizedBox(), color: Colors.blue, height: 150),
          ],
        ),
        const Text('wityh Intrisic'),
        IntrinsicHeight(
          child: Row(
            children: [
              Container(child: const SizedBox(), color: Colors.yellow, height: 100),
              Container(child: const SizedBox(), color: Colors.red, height: 200),
              Container(child: const SizedBox(), color: Colors.blue, height: 150),
            ],
          ),
        ),
      ],
    );
  }
}

class FittedExample extends StatelessWidget {
  const FittedExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('no Fitbox'),
        Center(
            child: Container(
          child: const Text('Example', style: TextStyle(fontSize: 200)),
          color: Colors.yellow,
          height: 100,
          width: 300,
        )),
        const Text('with Fitbox'),
        Center(
            child: Container(
          child: const FittedBox(fit: BoxFit.fill, child: Text('Example', style: TextStyle(fontSize: 200))),
          color: Colors.yellow,
          height: 100,
          width: 300,
        ))
      ],
    );
  }
}

class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text('Orientation builder'),
        SizedBox(
          height: size.height,
          child: OrientationBuilder(
            builder: (context, orientation) {
              return GridView.count(
                children: List.filled(
                    12,
                    Container(
                      child: SizedBox(),
                      color: Colors.red,
                      width: 100,
                      height: 60,
                    )),
                crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
              );
            },
          ),
        ),
        const Text('layout builder'),
        Container(
          height: 400,
          width: 400,
          color: Colors.orange,
          child: LayoutBuilder(
            builder: (context, box) {
              return Container(
                color: Colors.yellow,
                margin: EdgeInsets.all(16),
                child: Text('maxHeight ${box.maxHeight} minHeight ${box.minHeight} maxWidth ${box.maxWidth} minWidth ${box.minWidth}'),
              );
            },
          ),
        ),
      ],
    );
  }
}
