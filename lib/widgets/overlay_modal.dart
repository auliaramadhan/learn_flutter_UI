import 'package:flutter/material.dart';

class OverlayExample extends StatefulWidget {
  const OverlayExample({Key? key}) : super(key: key);

  @override
  State<OverlayExample> createState() => _OverlayExampleState();
}

class _OverlayExampleState extends State<OverlayExample> {
  OverlayEntry? entry;
  Offset offset = const Offset(30, 40);

  @override
  void dispose() {
    // TODO: implement dispose
    hideOverlay();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(onPressed: showOverlay, child: const Text('Show Overlay')),
        ElevatedButton(onPressed: hideOverlay, child: const Text('ide Overlay')),
      ],
    );
  }

  void showOverlay() {
    entry = OverlayEntry(
      builder: (context) {
        return Positioned(
          left: offset.dx,
          top: offset.dy,
          child: GestureDetector(
            onPanUpdate: (details) {
              print('onPanUpdate ${details.localPosition}');
              offset = offset + details.delta;
              entry!.markNeedsBuild();
            },
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.circle),
              label: const Text('Record'),
            ),
          ),
        );
      },
    );
    final overlay = Overlay.of(context)!;
    overlay.insert(entry!);
  }

  void hideOverlay() {
    entry?.remove();
    entry = null;
  }
}
