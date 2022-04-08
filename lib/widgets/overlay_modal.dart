import 'dart:async';

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

// OverlayLoading

typedef CloseLoadingScreen = bool Function();
typedef UpdateLoadingScreen = bool Function(String text);

@immutable
class LoadingScreenController {
  final CloseLoadingScreen close;
  final UpdateLoadingScreen update;

  const LoadingScreenController({
    required this.close,
    required this.update,
  });
}

class LoadingScreen {
  factory LoadingScreen() => _shared;
  static final LoadingScreen _shared = LoadingScreen._sharedInstance();
  LoadingScreen._sharedInstance();
  LoadingScreenController? controller;

  void show({
    required BuildContext context,
    required String text,
  }) {
    if (controller?.update(text) ?? false) {
      return;
    } else {
      controller = showOverlay(
        context: context,
        text: text,
      );
    }
  }

  void hide() {
    controller?.close();
    controller = null;
  }

  LoadingScreenController showOverlay({
    required BuildContext context,
    required String text,
  }) {
    final _text = StreamController<String>();
    _text.add(text);

    final state = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    final overlay = OverlayEntry(
      builder: (context) {
        return Material(
          color: Colors.black.withAlpha(150),
          child: Center(
            child: Container(
                constraints: BoxConstraints(
                  maxWidth: size.width * 0.8,
                  maxHeight: size.height * 0.8,
                  minWidth: size.width * 0.5,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 10),
                        const CircularProgressIndicator(),
                        const SizedBox(height: 20),
                        StreamBuilder<String>(
                          stream: _text.stream,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Text(
                                snapshot.data!,
                                textAlign: TextAlign.center,
                              );
                            } else {
                              return Container();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                )),
          ),
        );
      },
    );

    state?.insert(overlay);

    return LoadingScreenController(
      close: () {
        _text.close();
        overlay.remove();
        return true;
      },
      update: (text) {
        _text.add(text);
        return true;
      },
    );
  }
}